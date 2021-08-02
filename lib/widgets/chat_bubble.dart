import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  var message;
  var barber;
  var sentBy;
  ChatBubble({Key key, this.message, this.barber, this.sentBy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print(message.length);
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Align(
        alignment: barber.id == sentBy ? Alignment.topLeft : Alignment.topRight,
        child: Container(
          width: !(message.length > 30)
              ? ((message.length * 8) +
                      (height > 700
                          ? width > 600
                              ? 100
                              : 50
                          : 40))
                  .toDouble()
              : 280,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: height > 700
                    ? width > 600
                        ? 17
                        : 15.0
                    : 12,
                bottom: height > 700
                    ? width > 600
                        ? 17
                        : 15
                    : 12,
                right: 20,
                left: 20,
              ),
              child: Text(
                message,
                //softWrap: false,
                style: TextStyle(
                  color: barber.id == sentBy ? Colors.white : Colors.black,
                  fontSize: height > 700
                      ? width > 600
                          ? 18
                          : 15
                      : 14,
                ),
              ),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(height > 700 ? 18 : 14),
                topRight: Radius.circular(height > 700 ? 18 : 14),
                bottomLeft: barber.id == sentBy
                    ? Radius.circular(0)
                    : Radius.circular(height > 700 ? 18 : 14),
                bottomRight: barber.id == sentBy
                    ? Radius.circular(height > 700 ? 18 : 14)
                    : Radius.circular(0)),
            color: !(barber.id == sentBy) ? Colors.white : Colors.orange,
          ),
        ),
      ),
    );
  }
}
