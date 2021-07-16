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

  @override
  Widget build(BuildContext context) {
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
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                //height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 30,
                    bottom: 25,
                    top: 50,
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
                              size: 25,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          SizedBox(width: 10),
                          CircleAvatar(
                            radius: 28,
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
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                widget.barber.name,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.orange[50],
                        child: IconButton(
                          icon: Icon(
                            Icons.call,
                            color: Colors.orange,
                            size: 18,
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
                  height: MediaQuery.of(context).size.height - 220,
                  child: ListView.builder(
                    //reverse: true,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
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
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 20.0,
                left: 20,
                bottom: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      )),
                  SizedBox(width: 25),
                  Container(
                    height: 60,
                    width: 250,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        right: 15,
                        left: 15,
                        bottom: 10,
                      ),
                      child: Center(
                        child: TextFormField(
                          controller: _controller,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: "Type a message"),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 25),
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
                          });
                          print(currentUser.chatbarber);
                        },
                      )),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                    Colors.white.withOpacity(0.8),
                    Colors.transparent
                  ])),
            ),
          ),
        ],
      ),
    );
  }
}
