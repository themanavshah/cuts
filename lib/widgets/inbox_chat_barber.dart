import 'package:cuts/dummy_data/barber_shops_data.dart';
import 'package:cuts/dummy_data/user_dummy_data.dart';
import 'package:flutter/material.dart';

class InboxChatBarber extends StatelessWidget {
  Barber barber;
  InboxChatBarber({Key key, this.barber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var usertemp = currentUser.chatbarber
        .where((element) => element.barber.id == barber.id);
    var lastMessage =
        usertemp.first.messageList[usertemp.first.messageList.length - 1];
    return Container(
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage(barber.image),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          barber.name,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 20),
                        ),
                        SizedBox(height: 3),
                        Container(
                          width: 200,
                          child: Text(
                            lastMessage.data,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w300,
                                fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  "12:31",
                  //overflow: overfl,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(),
          ],
        ),
      ),
    );
  }
}
