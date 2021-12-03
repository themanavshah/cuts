import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:cuts/common_scaffold.dart';
import 'package:cuts/dummy_data/barber_shops_data.dart';
import 'package:cuts/dummy_data/user_dummy_data.dart';
import 'package:cuts/providers/stream_controller.dart';
import 'package:cuts/screens/initScreens/forgotpass_screen.dart';
import 'package:cuts/screens/initScreens/register_screen.dart';
import 'package:cuts/screens/loading_screen.dart';
import 'package:cuts/services/auth.dart';
import 'package:cuts/services/barber_api_calls.dart';
import 'package:cuts/widgets/mapWidgets/get_user_location.dart';
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
                            print("continue");
                            Auth()
                                .getDecodedToken(val.data['token'])
                                .then((user) {
                              List<Barber> tempfavBarbLis = [];
                              print("barb list: " +
                                  user.data["user"]["favBarber"].toString());
                              int favbarbcounter = 1;
                              for (var i = 0;
                                  i < user.data["user"]["favBarber"].length;
                                  i++) {
                                BarberApi()
                                    .getBarber(
                                        user.data["user"]["favBarber"][i])
                                    .then((barb) {
                                  print("barb" + barb.toString());
                                  List<Slot> slotLis = [];
                                  for (var slt = 0;
                                      slt < barb.data["data"]["slots"].length;
                                      slt++) {
                                    print(barb.data["data"]["slots"][slt]);
                                    slotLis.add(Slot(
                                      hour: barb.data["data"]["slots"][slt]
                                          ["hour"],
                                      isOccupied: barb.data["data"]["slots"]
                                          [slt]["isOcuupied"],
                                      min: barb.data["data"]["slots"][slt]
                                          ["min"],
                                    ));
                                  }
                                  print("__________barbname____________" +
                                      barb.data["data"]["name"].toString());
                                  tempfavBarbLis.add(Barber(
                                    name: barb.data["data"]["name"],
                                    description: barb.data["data"]
                                        ["description"],
                                    image: barb.data["data"]["image"]["data"]
                                        .cast<int>(),
                                    openingTime: barb.data["data"]
                                        ["openingTime"],
                                    slots: slotLis,
                                    tags: barb.data["data"]["tags"],
                                    distance: "2.3",
                                  ));
                                  if (favbarbcounter ==
                                      user.data["user"]["favBarber"].length) {
                                    currentUser.favBarbers = tempfavBarbLis;
                                    print("cufb" +
                                        currentUser.favBarbers.toString());
                                    favBarberStreamController.sink
                                        .add(tempfavBarbLis);
                                    print(" tfb: " +
                                        tempfavBarbLis[0].name.toString());
                                  }
                                  favbarbcounter++;
                                });
                              }

                              // List<ChatBarber> tempchatBarbLis = [];
                              // for (var i = 0;
                              //     i < user.data["user"]["chatBarber"].length;
                              //     i++) {
                              //   BarberApi()
                              //       .getBarber(
                              //           user.data["user"]["chatBarber"][i])
                              //       .then((barb) {
                              //     tempfavBarbLis.add(Barber(
                              //       name: barb.data["name"],
                              //       description: barb.data["description"],
                              //       image: barb.data["data"]["image"]["data"].cast<int>()
                              //       openingTime: barb.data["openingTime"],
                              //       slots: barb.data["slots"],
                              //       tags: barb.data["tags"],
                              //     ));
                              //   });
                              // }
                              //currentUser.chatbarber = tempchatBarbLis;
                              // chatBarberStreamController.sink
                              //     .add(tempchatBarbLis);

                              List<Barber> tempnearbyBarbLis = [];
                              int nearbybarbCounter = 1;
                              for (var i = 0;
                                  i < user.data["user"]["nearbyBarber"].length;
                                  i++) {
                                BarberApi()
                                    .getBarber(
                                        user.data["user"]["nearbyBarber"][i])
                                    .then((barb) {
                                  tempfavBarbLis.add(Barber(
                                    name: barb.data["name"],
                                    description: barb.data["description"],
                                    image: barb.data["data"]["image"]["data"]
                                        .cast<int>(),
                                    openingTime: barb.data["openingTime"],
                                    slots: barb.data["slots"],
                                    tags: barb.data["tags"],
                                    distance: "2.3",
                                  ));
                                });
                                if (nearbybarbCounter ==
                                    user.data["user"]["nearbyBarber"].length) {
                                  currentUser.nearbyBarber = tempnearbyBarbLis;
                                  nearbyBarberStreamController.sink
                                      .add(tempnearbyBarbLis);
                                }
                              }
                              user.data["user"]["favBarber"] ??
                                  BarberApi()
                                      .getBarber(
                                          user.data["user"]["favBarber"][0])
                                      .then((barb) {
                                    print(barb);
                                    void addData() async {
                                      var image = barb.data["data"]["image"];
                                      List<int> imgdata =
                                          image["data"].cast<int>();
                                      Uint8List imageuint8lis =
                                          Uint8List.fromList(imgdata);
                                      imageStreamController.sink
                                          .add(imageuint8lis);
                                    }

                                    addData();
                                  });
                            });
                            context.read(tokenProvider).state =
                                val.data['token'];

                            //determinePosition();
                            // userLocation = dpn;
                            // userLocationStreamController.sink.add(dpn);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StreamBuilder<Object>(
                                        stream:
                                            favBarberStreamController.stream,
                                        builder: (context, snapshot) {
                                          if (snapshot.hasError)
                                            return snapshot.error;
                                          else if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            print("waiting for data!");
                                            return LoadingScreen();
                                          }
                                          print(snapshot.data);
                                          return CommonScaffold();
                                        })));
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
