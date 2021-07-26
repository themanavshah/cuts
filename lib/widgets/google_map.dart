import 'dart:async';

import 'package:cuts/dummy_data/user_dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsWidget extends StatefulWidget {
  @override
  _GoogleMapsWidgetState createState() => _GoogleMapsWidgetState();
}

class _GoogleMapsWidgetState extends State<GoogleMapsWidget> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(23.007345, 72.602580);

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

  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;

  @override
  void initState() {
    // TODO: implement initState
    for (var i = 0; i < currentUser.nearbyBarber.length; i++) {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(currentUser.nearbyBarber[i].location.toString()),
        position: currentUser.nearbyBarber[i].location,
        infoWindow: InfoWindow(
          title: currentUser.nearbyBarber[i].name,
          snippet: '${currentUser.nearbyBarber[i].rating} Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    }
    super.initState();
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
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
            markers: _markers,
            onCameraMove: _onCameraMove,
            onTap: _handleTap,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 13.0,
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
