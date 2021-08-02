import 'package:cuts/dummy_data/barber_shops_data.dart';
import 'package:cuts/dummy_data/user_dummy_data.dart';
import 'package:cuts/providers/state_provider.dart';
import 'package:cuts/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class ChatDetailScreen extends StatefulWidget {
  ChatDetailScreen({Key key, this.barber}) : super(key: key);

  Barber barber;
  var sentBy;

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

bool barberCheck(var lis, Barber element) {
  for (var i = 0; i < lis.length; i++) {
    if (lis[i].barber.id == element.id) return true;
  }
  return false;
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final _controller = TextEditingController();

  io.Socket socket;
  List<Message> msgs;

  void connect() {
    socket = io.io("http://localhost:3000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.onConnect((data) {
      print("connected...");
      socket.on("/fromsocket", (msgs) {
        print(msgs);
        //setMessage("msgs[]", msgs.sentTo, msgs.sentBy);
        //print(msgs);
      });
    });
    //print(socket.connected);
    socket.emit("/test", "test message...");
  }

  void sendMessage(message) {
    setMessage(message, widget.barber.id, currentUser.userId);
    socket.emit("/buttonmsg", {
      "message": message,
      "sentBy": currentUser.userId,
      "sentTo": widget.barber.id,
    });
  }

  void setMessage(message, to, from) {
    var msg = Message(data: message, sentbyid: from, senttoid: to);
    msgs.add(msg);
  }

  @override
  void initState() {
    connect();
    // var usertemp = currentUser.chatbarber.where(
    //                               (element) =>
    //                                   element.barber.id == widget.barber.id);
    // msgs = [...usertemp.first.messageList, ]
    super.initState();
  }

  // ScrollController _scrollController = ScrollController();

  // _scrollToBottom() {
  //   if (msgs.isNotEmpty) {
  //     _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print(height);
    var usertemp = currentUser.chatbarber
        .where((element) => element.barber.id == widget.barber.id);
    print("UT; " + usertemp.isEmpty.toString());
    var initList = usertemp.isEmpty ? [] : usertemp.first.messageList;
    msgs = [
      Message(
        data: "where you at?",
        sentbyid: widget.barber.id,
        senttoid: currentUser.userId,
      ),
      ...initList,
      //...usertemp.first.messageList,
    ];
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  //height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: height > 700 ? 15.0 : 10,
                      right: height > 700 ? 30 : 20,
                      bottom: height > 700 ? 35 : 20,
                      top: height > 700 ? 50 : 35,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Colors.black,
                                size: height > 700 ? 25 : 18,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            SizedBox(width: height > 700 ? 10 : 5),
                            CircleAvatar(
                              radius: height > 700 ? 28 : 22,
                              backgroundImage: AssetImage(widget.barber.image),
                            ),
                            SizedBox(width: 18),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.barber.name,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: height > 700 ? 20 : 16,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  widget.barber.name,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: height > 700 ? 14 : 12,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: height > 700 ? 25 : 20,
                          backgroundColor: Colors.orange[50],
                          child: IconButton(
                            icon: Icon(
                              Icons.call,
                              color: Colors.orange,
                              size: height > 700 ? 18 : 14,
                            ),
                            onPressed: () {
                              print("call");
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    height:
                        WidgetsBinding.instance.window.viewInsets.bottom > 0.0
                            ? MediaQuery.of(context).size.height -
                                (height > 700 ? 520 : 450)
                            : MediaQuery.of(context).size.height -
                                (height > 700 ? 180 : 180),
                    child: ListView.builder(
                      //reverse: true,
                      //controller: _scrollController,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        //_scrollToBottom();
                        return ChatBubble(
                          message: msgs[index].data,
                          barber: widget.barber,
                          sentBy: msgs[index].sentbyid,
                        );
                      },
                      itemCount: msgs.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.only(
                right: height > 700 ? 20.0 : 12,
                left: height > 700 ? 20 : 12,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                      radius: height > 700 ? 24 : 20,
                      backgroundColor: Colors.orange,
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          size: height > 700 ? 20 : 14,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      )),
                  SizedBox(width: height > 700 ? 25 : 20),
                  Container(
                    height: height > 700 ? 60 : 50,
                    width: 230,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: height > 700 ? 8.0 : 20,
                        right: 15,
                        left: 15,
                        bottom: 10,
                      ),
                      child: Center(
                        child: TextFormField(
                          controller: _controller,
                          cursorColor: Colors.black,
                          cursorWidth: 1,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: "Type a message",
                              hintStyle: TextStyle(
                                fontSize: 14,
                              )),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 20),
                  CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: IconButton(
                        icon: Icon(
                          Icons.send_rounded,
                          color: Colors.white,
                          size: 14,
                        ),
                        onPressed: () {
                          // print(currentUser.chatbarber.where(
                          //     (element) => element.id == widget.barber.id));
                          setState(() {
                            if (_controller.text.trim().isNotEmpty) {
                              if (!barberCheck(
                                  currentUser.chatbarber, widget.barber)) {
                                currentUser.chatbarber
                                    .add(ChatBarber(barber: widget.barber));
                              }
                              var usertemp = currentUser.chatbarber.where(
                                  (element) =>
                                      element.barber.id == widget.barber.id);
                              usertemp.first.messageList.insert(
                                  usertemp.first.messageList.length,
                                  Message(
                                    data: _controller.text,
                                    sentbyid: currentUser.userId,
                                    senttoid: widget.barber.id,
                                  ));
                              sendMessage(_controller.text);
                              _controller.clear();
                            }
                            //_scrollToBottom();
                          });
                          print(currentUser.chatbarber);
                        },
                      )),
                ],
              ),
            ),
          ),
          // Positioned(
          //   top: 0,
          //   child: Container(
          //     height: 200,
          //     decoration: BoxDecoration(
          //         gradient: LinearGradient(
          //             begin: Alignment.bottomCenter,
          //             end: Alignment.topCenter,
          //             colors: [
          //           Colors.white.withOpacity(0.8),
          //           Colors.transparent
          //         ])),
          //   ),
          // ),
        ],
      ),
    );
  }
}
