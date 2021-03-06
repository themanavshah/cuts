import 'package:cuts/dummy_data/user_dummy_data.dart';
import 'package:cuts/providers/state_provider.dart';
import 'package:cuts/screens/chat_detail_screen.dart';
import 'package:cuts/widgets/chatWidgets/inbox_chat_barber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //creating an E2EE chat system
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: Center(
          child: Padding(
        padding: const EdgeInsets.only(
          bottom: 40,
          left: 30,
          right: 30,
          //top: 15,
        ),
        child: Column(
          children: [
            SizedBox(height: height > 700 ? 70 : 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: height > 700 ? 22 : 18,
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.black,
                      size: height > 700 ? 18 : 14,
                    ),
                    onPressed: () {
                      context.read(pageindex).state = page.home;
                    },
                  ),
                ),
                Text(
                  'Inbox',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: height > 700 ? 25 : 20),
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
            SizedBox(height: height > 700 ? 30 : 20),
            currentUser.chatbarber.length == 0
                ? Padding(
                    padding: EdgeInsets.only(top: height > 700 ? 120 : 80),
                    child: Container(
                      child: Center(
                          child: Container(
                              child:
                                  Image.asset("assets/dummies/noc_chat.png"))),
                    ),
                  )
                : Container(
                    height: ((120 * currentUser.chatbarber.length) +
                                (15 * currentUser.chatbarber.length))
                            .toDouble() +
                        50,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      //shrinkWrap: true,
                      //scrollDirection: Axis.horizontal,
                      itemCount: currentUser.chatbarber.length,
                      itemBuilder: (BuildContext context, int index) => Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChatDetailScreen(
                                              barber: currentUser
                                                  .chatbarber[index].barber,
                                            )));
                              },
                              child: InboxChatBarber(
                                barber: currentUser.chatbarber[index].barber,
                              ))),
                    ),
                  ),
            // Container(
            //   height: MediaQuery.of(context).size.height,
            //   //color: Colors.grey.withOpacity(0.2),
            // ),
          ],
        ),
      )),
    );
  }
}
