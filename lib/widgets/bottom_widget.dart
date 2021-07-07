import 'package:cuts/providers/state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final index = watch(pageindex);
    return Container(
      //height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.white,
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 18.0, right: 18, bottom: 22, top: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(
                  index.state != 0 ? Icons.home_outlined : Icons.home_rounded,
                  color: index.state == 0
                      ? Colors.black
                      : Colors.black.withOpacity(0.4),
                ),
                onPressed: () {
                  context.read(pageindex).state = 0;
                }),
            IconButton(
                icon: Icon(
                  index.state == 1
                      ? Icons.location_on_rounded
                      : Icons.location_on_outlined,
                  color: index.state == 1
                      ? Colors.black
                      : Colors.black.withOpacity(0.4),
                ),
                onPressed: () {
                  context.read(pageindex).state = 1;
                }),
            IconButton(
                icon: Icon(
                  index.state != 2
                      ? Icons.message_outlined
                      : Icons.message_rounded,
                  color: index.state == 2
                      ? Colors.black
                      : Colors.black.withOpacity(0.4),
                ),
                onPressed: () {
                  context.read(pageindex).state = 2;
                }),
            IconButton(
                icon: Icon(
                  index.state == 3 ? Icons.favorite : Icons.favorite_border,
                  color: index.state == 3
                      ? Colors.black
                      : Colors.black.withOpacity(0.4),
                ),
                onPressed: () {
                  context.read(pageindex).state = 3;
                }),
          ],
        ),
      ),
    );
  }
}
