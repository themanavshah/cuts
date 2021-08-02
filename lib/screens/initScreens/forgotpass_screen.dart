import 'package:flutter/material.dart';

class ForgotPassScreen extends StatelessWidget {
  ForgotPassScreen({Key key}) : super(key: key);

  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
          right: 40,
          left: 40,
          bottom: 20,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                      height: height > 700
                          ? width > 600
                              ? 60
                              : 190
                          : 140),
                  Text(
                    'Forgot Password',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: height > 700
                            ? width > 600
                                ? 30
                                : 25
                            : 20),
                  ),
                  SizedBox(height: height > 700 ? 30 : 20),
                  Container(
                    width: 290,
                    child: Text(
                      'Enter email address associated with your account and we’ll send an email with instructions to reset your password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: height > 700
                              ? width > 600
                                  ? 18
                                  : 15
                              : 12),
                    ),
                  ),
                  SizedBox(height: height > 700 ? 80 : 60),
                  Container(
                    height: height > 700 ? 80 : 60,
                    width: MediaQuery.of(context).size.width -
                        (width > 600 ? 200 : 0),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(height > 700 ? 20 : 15),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 30.0),
                        child: TextFormField(
                          cursorColor: Colors.orange,
                          controller: _emailController,
                          decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "Email address",
                            fillColor: Colors.grey.withOpacity(0.2),
                          ),
                          validator: (val) {
                            if (val.length == 0) {
                              return;
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height > 700 ? 130 : 120),
                  GestureDetector(
                    onTap: () {
                      //send instructions to it's mail
                      if (_emailController.text.length != 0) {
                        _emailController.clear();
                      }
                    },
                    child: Container(
                      height: height > 700 ? 75 : 60,
                      width: MediaQuery.of(context).size.width -
                          (width > 600 ? 200 : 0),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(height > 700 ? 20 : 15),
                        color: Colors.orange,
                      ),
                      child: Center(
                        child: Text(
                          'Send Instruction',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: height > 700 ? 20 : 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: height > 700
                          ? width > 600
                              ? 60
                              : 50
                          : 30),
                  GestureDetector(
                    onTap: () {
                      //switch to register...
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Back',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: height > 700
                            ? width > 600
                                ? 20
                                : 18
                            : 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
