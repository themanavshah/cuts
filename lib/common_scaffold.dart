import 'package:cuts/providers/state_provider.dart';
import 'package:cuts/screens/chat_screen.dart';
import 'package:cuts/screens/favorite_screen.dart';
import 'package:cuts/screens/home_screen.dart';
import 'package:cuts/screens/nearby_screen.dart';
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
