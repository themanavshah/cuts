import 'package:cuts/providers/state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final index = watch(pageindex);
    return Container(
      //height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(height > 700 ? 40 : 20),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 18.0,
          right: 18,
          bottom: 16,
          top: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(
                  index.state == page.home ||
                          index.state == page.show_all ||
                          index.state == page.notification ||
                          index.state == page.menu
                      ? Icons.home_rounded
                      : Icons.home_outlined,
                  color: index.state == page.home ||
                          index.state == page.show_all ||
                          index.state == page.notification ||
                          index.state == page.menu
                      ? Colors.black
                      : Colors.black.withOpacity(0.4),
                  size: height > 700 ? 26 : 22,
                ),
                onPressed: () {
                  context.read(pageindex).state = page.home;
                }),
            IconButton(
                icon: Icon(
                  index.state == page.nearby
                      ? Icons.location_on_rounded
                      : Icons.location_on_outlined,
                  color: index.state == page.nearby
                      ? Colors.black
                      : Colors.black.withOpacity(0.4),
                  size: height > 700 ? 26 : 22,
                ),
                onPressed: () {
                  context.read(pageindex).state = page.nearby;
                }),
            IconButton(
                icon: Icon(
                  index.state != page.chat
                      ? Icons.message_outlined
                      : Icons.message_rounded,
                  color: index.state == page.chat
                      ? Colors.black
                      : Colors.black.withOpacity(0.4),
                  size: height > 700 ? 26 : 22,
                ),
                onPressed: () {
                  context.read(pageindex).state = page.chat;
                }),
            IconButton(
                icon: Icon(
                  index.state == page.favorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: index.state == page.favorite
                      ? Colors.black
                      : Colors.black.withOpacity(0.4),
                  size: height > 700 ? 26 : 22,
                ),
                onPressed: () {
                  context.read(pageindex).state = page.favorite;
                }),
          ],
        ),
      ),
    );
  }
}
