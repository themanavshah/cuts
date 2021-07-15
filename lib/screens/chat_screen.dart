import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  io.Socket socket;
  List<String> msgs = ['inti msg'];

  void connect() {
    socket = io.io("http://localhost:3000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.onConnect((data) {
      print("connected...");
      socket.on("/fromsocket", (data) {
        setMessage(data);
        print(msgs);
      });
    });
    //print(socket.connected);
    socket.emit("/test", "test message...");
  }

  void sendMessage(message) {
    setMessage(message);
    socket.emit("/buttonmsg", message);
  }

  void setMessage(message) {
    msgs.add(message);
  }

  @override
  void initState() {
    connect();
    super.initState();
  }

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //creating an E2EE chat system
    return Container(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 250,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Text(msgs[index]);
              },
              itemCount: msgs.length,
            ),
          ),
          Row(
            children: [
              Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width - 200,
                  child: TextField(
                    controller: _controller,
                  )),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_controller.text.trim().isNotEmpty) {
                        sendMessage(_controller.text);
                        _controller.clear();
                      }
                    });
                  },
                  child: Text('emit')),
            ],
          )
        ],
      )),
    );
  }
}
