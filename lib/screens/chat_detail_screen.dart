import 'package:cuts/dummy_data/barber_shops_data.dart';
import 'package:cuts/providers/state_provider.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class ChatDetailScreen extends StatefulWidget {
  ChatDetailScreen({Key key, this.barber}) : super(key: key);

  Barber barber;

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final _controller = TextEditingController();

  io.Socket socket;
  List<Message> msgs = [];

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
    setMessage(message, 231, widget.barber.id);
    socket.emit("/buttonmsg", {
      "message": message,
      "sentBy": 231,
      "sentTo": widget.barber.id,
      //"timestamp": DateTime.now(),
    });
  }

  void setMessage(message, to, from) {
    var msg = Message(data: message, sentbyid: from, senttoid: to);
    msgs.add(msg);
  }

  @override
  void initState() {
    connect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
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
              Container(
                width: 200,
                height: 250,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Text(msgs[index].data);
                  },
                  itemCount: msgs.length,
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
                        top: 15.0,
                        right: 15,
                        left: 20,
                        bottom: 13,
                      ),
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
                        ),
                        onPressed: () {
                          setState(() {
                            if (_controller.text.trim().isNotEmpty) {
                              sendMessage(_controller.text);
                              _controller.clear();
                            }
                          });
                        },
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
