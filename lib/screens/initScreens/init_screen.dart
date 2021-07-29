import 'package:cuts/screens/initScreens/loginScreen.dart';
import 'package:flutter/material.dart';

enum screen {
  initscreen1,
  initscreen2,
  initscreen3,
}

class InitScreen extends StatefulWidget {
  InitScreen({Key key}) : super(key: key);

  screen currentscreen = screen.initscreen1;

  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    //in responsive ness ternary is used in which ot checks for
    //height greater than 700 which includes big phones and tabs
    //after that check for tab with width greater than 600 and
    //rest is history.
    print("width: " + MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 30.0,
          right: 30,
          top: 15,
          bottom: 20,
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                    height: height > 700
                        ? width > 600
                            ? 50
                            : 70
                        : 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Container(
                        height: 30,
                        child: Text(
                          "Skip",
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.w500,
                              fontSize: height > 700 ? 18 : 14),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height: height > 700
                        ? width > 600
                            ? height > 1250
                                ? 250
                                : 120
                            : 120
                        : 80),
                Container(
                  height: height > 700
                      ? width > 600
                          ? height > 1250
                              ? 350
                              : 300
                          : 220
                      : 150,
                  child: Image.asset(widget.currentscreen == screen.initscreen1
                      ? "assets/dummies/initscreen1.png"
                      : widget.currentscreen == screen.initscreen2
                          ? "assets/dummies/initscreen2.png"
                          : "assets/dummies/initscreen3.png"),
                ),
                SizedBox(height: height > 700 ? 80 : 50),
                Container(
                  width: widget.currentscreen != screen.initscreen2
                      ? height > 700
                          ? 250
                          : 180
                      : height > 700
                          ? 300
                          : 250,
                  child: Text(
                    widget.currentscreen == screen.initscreen1
                        ? "Find Your Best Barber Shop Nearby"
                        : widget.currentscreen == screen.initscreen2
                            ? "No Need to Do a Boring Queue, Just Stay Home!"
                            : "All you need for your barber needs",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.4,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: height > 700
                            ? width > 600
                                ? 25
                                : 22
                            : 16),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: widget.currentscreen != screen.initscreen2
                      ? height > 700
                          ? 280
                          : 230
                      : height > 700
                          ? 320
                          : 250,
                  child: Text(
                    widget.currentscreen == screen.initscreen1
                        ? "Easily search your best and favorite barber shops anywhere nearby"
                        : widget.currentscreen == screen.initscreen2
                            ? "Waiting for your turn comfortably at home and we will inform you for your turn"
                            : "Feel comfortable ordering and waiting for your turn with Barbar",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.2,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: width > 600 ? 16 : 12),
                  ),
                ),
                SizedBox(height: height > 700 ? 40 : 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.currentscreen == screen.initscreen1
                        ? Container(
                            height: height > 700 ? 8 : 4,
                            width: height > 700 ? 20 : 16,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.orange,
                            ),
                          )
                        : CircleAvatar(
                            radius: height > 700 ? 4 : 2,
                            backgroundColor: Colors.orange[100],
                          ),
                    SizedBox(width: 3),
                    widget.currentscreen == screen.initscreen2
                        ? Container(
                            height: height > 700 ? 8 : 4,
                            width: height > 700 ? 20 : 16,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.orange,
                            ),
                          )
                        : CircleAvatar(
                            radius: height > 700 ? 4 : 2,
                            backgroundColor: Colors.orange[100],
                          ),
                    SizedBox(width: 3),
                    widget.currentscreen == screen.initscreen3
                        ? Container(
                            height: height > 700 ? 8 : 4,
                            width: height > 700 ? 20 : 16,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.orange,
                            ),
                          )
                        : CircleAvatar(
                            radius: height > 700 ? 4 : 2,
                            backgroundColor: Colors.orange[100],
                          ),
                  ],
                ),
                SizedBox(
                    height: widget.currentscreen != screen.initscreen3
                        ? height > 700
                            ? 80
                            : 45
                        : height > 700
                            ? width > 600
                                ? 100
                                : 60
                            : 40),
                GestureDetector(
                  onTap: () {
                    if (widget.currentscreen == screen.initscreen1) {
                      setState(() {
                        widget.currentscreen = screen.initscreen2;
                      });
                    } else if (widget.currentscreen == screen.initscreen2) {
                      setState(() {
                        widget.currentscreen = screen.initscreen3;
                      });
                    } else {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    }
                  },
                  child: widget.currentscreen != screen.initscreen3
                      ? CircleAvatar(
                          radius: height > 700
                              ? width > 600
                                  ? 45
                                  : 40
                              : 25,
                          backgroundColor: Colors.orange,
                          child: Icon(
                            Icons.arrow_forward,
                            size: height > 700 ? 28 : 14,
                            color: Colors.white,
                          ),
                        )
                      : Container(
                          height: height > 700 ? 80 : 50,
                          width: MediaQuery.of(context).size.width -
                              (height > 700
                                  ? width > 600
                                      ? 200
                                      : 100
                                  : 120),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(height > 700 ? 20 : 14),
                            color: Colors.orange,
                          ),
                          child: Center(
                            child: Text(
                              'Get Started',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: height > 700 ? 20 : 14,
                              ),
                            ),
                          ),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
