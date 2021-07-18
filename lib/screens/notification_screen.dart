import 'package:cuts/dummy_data/user_dummy_data.dart';
import 'package:cuts/providers/state_provider.dart';
import 'package:cuts/widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Container(
      //integrating it with google maps api and adding barber's location on it.
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 90,
            left: 30,
            right: 30,
            top: 15,
          ),
          child: Column(
            children: [
              SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.black,
                        size: 18,
                      ),
                      onPressed: () {
                        context.read(pageindex).state = page.home;
                      },
                    ),
                  ),
                  Text(
                    'Notifications',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 25),
                  ),
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    child: Icon(
                      Icons.more_vert,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Container(
                height: ((120 * currentUser.notification.length) +
                            (15 * currentUser.notification.length))
                        .toDouble() +
                    50,
                child: ListView.builder(
                    itemCount: currentUser.notification.length,
                    itemBuilder: (BuildContext context, int index) {
                      //use notification widget...
                      return NotificationWidget(
                        element: currentUser.notification[index],
                        index: index,
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
