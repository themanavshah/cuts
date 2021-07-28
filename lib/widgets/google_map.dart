import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:cuts/dummy_data/user_dummy_data.dart';
import 'package:cuts/widgets/barbers_partdetail_ms.dart';
import 'package:cuts/widgets/get_custom_marker_widget.dart';
//import 'package:cuts/widgets/get_custom_marker_widget.dart';
import 'package:cuts/widgets/marker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsWidget extends StatefulWidget {
  @override
  _GoogleMapsWidgetState createState() => _GoogleMapsWidgetState();
}

class _GoogleMapsWidgetState extends State<GoogleMapsWidget> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(22.994880, 72.608653);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  List<Marker> _markers = [];
  LatLng _lastMapPosition = _center;

  List<Widget> markerWidget() {
    return currentUser.nearbyBarber
        .map((b) => MarkerWidget(barber: b))
        .toList();
  }

  List<Marker> mapBitmapsToMarkers(List<Uint8List> bitmaps) {
    List<Marker> markersList = [];
    bitmaps.asMap().forEach((i, bmp) {
      final barber = currentUser.nearbyBarber[i];
      markersList.add(Marker(
          markerId: MarkerId(barber.location.toString()),
          position: barber.location,
          icon: BitmapDescriptor.fromBytes(bmp),
          onTap: () {
            showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return BarberDetailModalSheet(
                  barber: barber,
                );
              },
            );
          }));
    });
    return markersList;
  }

  @override
  void initState() {
    // TODO: implement initState
    // print("started init");
    // for (var i = 0; i < currentUser.nearbyBarber.length; i++) {
    //   _markers.add(Marker(
    //     // This marker id can be anything that uniquely identifies each marker.
    //     markerId: MarkerId(currentUser.nearbyBarber[i].location.toString()),
    //     position: currentUser.nearbyBarber[i].location,
    //     infoWindow: InfoWindow(
    //       title: currentUser.nearbyBarber[i].name,
    //       snippet: '${currentUser.nearbyBarber[i].rating} Star Rating',
    //     ),
    //     //icon: reqmarker,
    //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    //   ));
    // }
    MarkerGenerator(markerWidget(), (bitmaps) {
      setState(() {
        _markers = mapBitmapsToMarkers(bitmaps);
      });
    }).generate(context);

    super.initState();
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _handleTap(LatLng point) {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(point.toString()),
        position: point,
        infoWindow: InfoWindow(
          title: 'I am a marker',
        ),
        icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_markers);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Maps Sample App'),
      //   backgroundColor: Colors.green[700],
      // ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            mapType: _currentMapType,
            markers: _markers.toSet(),
            onCameraMove: _onCameraMove,
            onTap: _handleTap,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 14.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 70.0,
              right: 30,
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Column(
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      print('change in map type.');
                      _onMapTypeButtonPressed();
                    },
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    backgroundColor: Colors.orange,
                    child: const Icon(
                      Icons.map_rounded,
                      size: 25.0,
                    ),
                  ),
                  // SizedBox(height: 30),
                  // FloatingActionButton(
                  //   onPressed: _onAddMarkerButtonPressed,
                  //   materialTapTargetSize: MaterialTapTargetSize.padded,
                  //   backgroundColor: Colors.orange,
                  //   child: const Icon(Icons.add_location, size: 25.0),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
