import 'dart:convert';
import 'dart:typed_data';

import 'package:cuts/common_scaffold.dart';
import 'package:cuts/dummy_data/user_dummy_data.dart';
import 'package:cuts/screens/initScreens/forgotpass_screen.dart';
import 'package:cuts/screens/initScreens/register_screen.dart';
import 'package:cuts/services/auth.dart';
import 'package:cuts/services/barber_api_calls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cuts/providers/state_provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _passvisible = true;
  var token;

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
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: height > 850
                        ? width > 600
                            ? 60
                            : 80
                        : 40),
                Text(
                  'cuts',
                  style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: height > 850
                          ? width > 600
                              ? 62
                              : 55
                          : 40),
                ),
                SizedBox(height: 10),
                Text(
                  'we guaranteed your handsome',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: height > 850
                          ? width > 600
                              ? 20
                              : 15
                          : 12),
                ),
                SizedBox(height: height > 850 ? 110 : 80),
                Container(
                  height: height > 850 ? 80 : 60,
                  width: MediaQuery.of(context).size.width -
                      (width > 600 ? 200 : 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(height > 850 ? 20 : 12),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 20.0),
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
                          // border: new OutlineInputBorder(
                          //   borderRadius: new BorderRadius.circular(25.0),
                          //   borderSide: new BorderSide(),
                          // ),
                          //fillColor: Colors.green
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return;
                          } else {
                            return null;
                          }
                        },
                        // style: new TextStyle(
                        //   fontFamily: "Poppins",
                        // ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height > 850 ? 30 : 15),
                Container(
                  height: height > 850 ? 80 : 60,
                  width: MediaQuery.of(context).size.width -
                      (width > 600 ? 200 : 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(height > 850 ? 20 : 12),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width -
                            150 -
                            (width > 600 ? 200 : 0),
                        color: Colors.transparent,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 20.0),
                            child: TextFormField(
                              obscureText: _passvisible,
                              cursorColor: Colors.orange,
                              controller: _passwordController,
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "password",
                                fillColor: Colors.grey.withOpacity(0.2),
                                // border: new OutlineInputBorder(
                                //   borderRadius: new BorderRadius.circular(25.0),
                                //   borderSide: new BorderSide(),
                                // ),
                                //fillColor: Colors.green
                              ),
                              validator: (val) {
                                if (val.length == 0) {
                                  return;
                                } else {
                                  return null;
                                }
                              },
                              // style: new TextStyle(
                              //   fontFamily: "Poppins",
                              // ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            _passvisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 20,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _passvisible = !_passvisible;
                            });
                          })
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("forgot password scrren!");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPassScreen()));
                      },
                      child: Row(
                        children: [
                          SizedBox(width: width > 600 ? 70 : 0),
                          Container(
                            height: 20,
                            //width: width - (width > 600 ? 200 : 0),
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: height > 850 ? 15 : 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height > 850 ? 80 : 60),
                Consumer(builder: (context, watch, _) {
                  return GestureDetector(
                    onTap: () {
                      if (_passwordController.text.length != 0 &&
                          _emailController.text.length != 0) {
                        //to the home screen fecthing the data from database and storing a copy in local phone storage
                        Auth()
                            .login(
                                _emailController.text, _passwordController.text)
                            .then((val) {
                          if (val.data['success']) {
                            //token = val.data['token'];
                            print("continue");
                            //print("val: " + val.toString());
                            //print(val.data['user']);
                            Auth()
                                .getDecodedToken(val.data['token'])
                                .then((user) {
                              print("barb list: " +
                                  user.data["user"]["favBarber"].toString());
                              BarberApi()
                                  .getBarber(user.data["user"]["favBarber"][0])
                                  .then((barb) {
                                print(barb);
                                var image = barb.data["data"]["image"];
                                print("_______________-" +
                                    image["data"].runtimeType.toString());
                                List<int> imgdata = image["data"].cast<int>();
                                //List<int> imgbytes = image.readAsBytesSync();
                                //print("+++++++++++++++=" + imgbytes.toString());
                                Image xyz =
                                    Image.memory(Uint8List.fromList(imgdata));
                                currentUser.image = Uint8List.fromList(imgdata);
                                print(xyz);
                              });
                              // context.read(useremailProvider).state =
                              //     user.data["user"]["email"];
                              // context.read(emailFavBarber).state =
                              //     user.data["user"]["favbarber"];
                              // context.read(emailchatBarber).state =
                              //     user.data["user"]["chatBarber"];
                              // context.read(emailnearbyBarber).state =
                              //     user.data["user"]["nearbyBarber"];
                            });
                            context.read(tokenProvider).state =
                                val.data['token'];
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CommonScaffold()));
                          } else {
                            print(val.data['msg']);
                            Fluttertoast.showToast(
                              msg: val.data['msg'],
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 15,
                            );
                          }
                        });
                      } else {
                        print("something is wrong!");
                        Fluttertoast.showToast(
                          msg: "Fields can't be empty!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 15,
                        );
                      }
                    },
                    child: Container(
                      height: height > 850 ? 75 : 65,
                      width: MediaQuery.of(context).size.width -
                          (width > 600 ? 200 : 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.orange,
                      ),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: height > 850 ? 20 : 18,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                SizedBox(
                    height: height > 850
                        ? width > 600
                            ? 60
                            : 50
                        : 40),
                GestureDetector(
                  onTap: () {
                    //switch to register...
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: height > 850
                          ? width > 600
                              ? 20
                              : 18
                          : 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
