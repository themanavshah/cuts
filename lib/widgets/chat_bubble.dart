import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  var message;
  var barber;
  var sentBy;
  ChatBubble({Key key, this.message, this.barber, this.sentBy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(message.length);
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Align(
        alignment: barber.id == sentBy ? Alignment.topLeft : Alignment.topRight,
        child: Container(
          width: !(message.length > 30)
              ? ((message.length * 8) + 50).toDouble()
              : 280,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
                bottom: 15,
                right: 20,
                left: 20,
              ),
              child: Text(
                message,
                //softWrap: false,
                style: TextStyle(
                  color: barber.id == sentBy ? Colors.white : Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
                bottomLeft: barber.id == sentBy
                    ? Radius.circular(0)
                    : Radius.circular(18),
                bottomRight: barber.id == sentBy
                    ? Radius.circular(18)
                    : Radius.circular(0)),
            color: !(barber.id == sentBy) ? Colors.white : Colors.orange,
          ),
        ),
      ),
    );
  }
}
