import 'package:cuts/dummy_data/user_dummy_data.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatefulWidget {
  NotificationModel element;
  int index;
  NotificationWidget({Key key, this.element, this.index}) : super(key: key);

  @override
  _NotificationWidgetState createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentUser.notification[widget.index].seen = true;
        });
      },
      child: Container(
        //height: ,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.element.title,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 5),
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 2,
                        ),
                        SizedBox(width: 5),
                        Text(
                          widget.element.time,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.element.mainName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: 250,
                      child: Text(
                        widget.element.description,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: !currentUser.notification[widget.index].seen
                      ? Colors.black
                      : Colors.transparent,
                  radius: 6,
                )
              ],
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
