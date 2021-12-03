import 'package:cuts/widgets/mapWidgets/google_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NearbyScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Container(
      //integrating it with google maps api and adding barber's location on it.
      child: Center(child: Text("Maps")),
    );
  }
}
