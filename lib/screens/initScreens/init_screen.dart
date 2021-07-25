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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 30.0,
          right: 30,
          top: 15,
          bottom: 20,
        ),
        child: Column(
          children: [
            SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Container(
                    height: 30,
                    child: Text(
                      "Skip",
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 120),
            Container(
              height: 220,
              child: Image.asset(widget.currentscreen == screen.initscreen1
                  ? "assets/dummies/initscreen1.png"
                  : widget.currentscreen == screen.initscreen2
                      ? "assets/dummies/initscreen2.png"
                      : "assets/dummies/initscreen3.png"),
            ),
            SizedBox(height: 80),
            Container(
              width: widget.currentscreen != screen.initscreen2 ? 250 : 300,
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
                    fontSize: 22),
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: widget.currentscreen != screen.initscreen2 ? 280 : 320,
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
                    fontSize: 16),
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.currentscreen == screen.initscreen1
                    ? Container(
                        height: 8,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.orange,
                        ),
                      )
                    : CircleAvatar(
                        radius: 4,
                        backgroundColor: Colors.orange[100],
                      ),
                SizedBox(width: 3),
                widget.currentscreen == screen.initscreen2
                    ? Container(
                        height: 8,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.orange,
                        ),
                      )
                    : CircleAvatar(
                        radius: 4,
                        backgroundColor: Colors.orange[100],
                      ),
                SizedBox(width: 3),
                widget.currentscreen == screen.initscreen3
                    ? Container(
                        height: 8,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.orange,
                        ),
                      )
                    : CircleAvatar(
                        radius: 4,
                        backgroundColor: Colors.orange[100],
                      ),
              ],
            ),
            SizedBox(
                height: widget.currentscreen != screen.initscreen3 ? 80 : 60),
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
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                }
              },
              child: widget.currentscreen != screen.initscreen3
                  ? CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.orange,
                      child: Icon(
                        Icons.arrow_forward,
                        size: 28,
                        color: Colors.white,
                      ),
                    )
                  : Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width - 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.orange,
                      ),
                      child: Center(
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
