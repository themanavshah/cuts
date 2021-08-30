import 'package:cuts/providers/state_provider.dart';
import 'package:cuts/providers/stream_controller.dart';
//import 'package:cuts/screens/actions_screen.dart';
import 'package:cuts/screens/mainScreens/chat_screen.dart';
import 'package:cuts/screens/mainScreens/favorite_screen.dart';
import 'package:cuts/screens/mainScreens/home_screen.dart';
import 'package:cuts/screens/menu_screen.dart';
import 'package:cuts/screens/mainScreens/nearby_screen.dart';
import 'package:cuts/screens/notification_screen.dart';
import 'package:cuts/screens/show_all_screen.dart';
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
          // StreamBuilder(
          //   stream: favBarberStreamController.stream,
          //   builder: (context, snapshot) {
          //   if (snapshot.hasError)
          //           return snapshot.error;
          //         else if (snapshot.connectionState ==
          //             ConnectionState.waiting) {
          //           print("waiting for data!");
          //           return CircularProgressIndicator();
          //         }
          //         if (currentUser.nearbyBarber.length == 0) {
          //           return Container(
          //             height: 100,
          //             width: 100,
          //             color: Colors.grey,
          //           );
          //         }
          // }),
          if (index.state == page.menu) MenuScreen(),
          if (index.state == page.notification) NotificationScreen(),
          if (index.state == page.show_all) ShowAllScreen(),
          if (index.state == page.home) HomeScreen(),
          if (index.state == page.nearby) NearbyScreen(),
          if (index.state == page.chat) ChatScreen(),
          if (index.state == page.favorite) FavoriteScreen(),
          Positioned(bottom: 0, child: BottomWidget()),
        ],
      ),
    );
  }
}
