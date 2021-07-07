import 'package:cuts/providers/state_provider.dart';
import 'package:cuts/screens/chat_screen.dart';
import 'package:cuts/screens/favorite_screen.dart';
import 'package:cuts/screens/home_screen.dart';
import 'package:cuts/screens/nearby_screen.dart';
import 'package:cuts/widgets/bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonScaffold extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final index = watch(pageindex);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          if (index.state == 0) HomeScreen(),
          if (index.state == 1) NearbyScreen(),
          if (index.state == 2) ChatScreen(),
          if (index.state == 3) FavoriteScreen(),
          Positioned(bottom: 0, child: BottomWidget()),
        ],
      ),
    );
  }
}
