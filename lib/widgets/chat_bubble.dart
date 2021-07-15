import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  var message;
  var barber;
  ChatBubble({Key key, this.message, this.barber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(message),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
    );
  }
}
