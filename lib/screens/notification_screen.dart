import 'package:cuts/dummy_data/user_dummy_data.dart';
import 'package:cuts/providers/state_provider.dart';
import 'package:cuts/widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  void markAsSeen() {
    for (var i = 0; i < currentUser.notification.length; i++) {
      currentUser.notification[i].seen = true;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                        fontWeight: FontWeight.w500,
                        fontSize: 22),
                  ),
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.more_vert,
                      color: Colors.transparent,
                      size: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your activity',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 22),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        markAsSeen();
                      });
                    },
                    child: Text(
                      'Mark as seen',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
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
