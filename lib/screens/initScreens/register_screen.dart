import 'package:cuts/common_scaffold.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _usernameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  var _passvisible = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            right: 40,
            left: 40,
            bottom: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    height: height > 700
                        ? width > 600
                            ? 30
                            : 60
                        : 30),
                Text(
                  'cuts',
                  style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w700,
                      fontSize: height > 700
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
                      fontSize: height > 700
                          ? width > 600
                              ? 20
                              : 15
                          : 12),
                ),
                SizedBox(height: height > 700 ? 80 : 50),
                Container(
                  width: width - (width > 600 ? 400 : 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: height > 700 ? 75 : 60,
                        width: height > 700 ? 160 : 140,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(height > 700 ? 20 : 15),
                          color: Colors.orange,
                        ),
                        child: Center(
                          child: Text(
                            'email',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: height > 700 ? 20 : 15,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: height > 700 ? 75 : 60,
                        width: height > 700 ? 160 : 140,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(height > 700 ? 20 : 15),
                          color: Colors.grey.withOpacity(0.2),
                        ),
                        child: Center(
                          child: Text(
                            'google',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: height > 700 ? 20 : 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    height: height > 700
                        ? width > 600
                            ? 60
                            : 50
                        : 40),
                Container(
                  height: height > 700 ? 80 : 60,
                  width: MediaQuery.of(context).size.width -
                      (width > 600 ? 200 : 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(height > 700 ? 20 : 12),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 20.0),
                      child: TextFormField(
                        cursorColor: Colors.orange,
                        controller: _usernameController,
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "Username",
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
                SizedBox(height: height > 700 ? 20 : 15),
                Container(
                  height: height > 700 ? 80 : 60,
                  width: MediaQuery.of(context).size.width -
                      (width > 600 ? 200 : 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(height > 700 ? 20 : 15),
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
                SizedBox(height: height > 700 ? 20 : 15),
                Container(
                  height: height > 700 ? 80 : 60,
                  width: MediaQuery.of(context).size.width -
                      (width > 600 ? 200 : 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(height > 700 ? 20 : 15),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: height > 700 ? 80 : 60,
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
                                hintText: "Password",
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
                SizedBox(
                    height: height > 700
                        ? width > 600
                            ? 70
                            : 60
                        : 40),
                GestureDetector(
                  onTap: () {
                    if (_passwordController.text.length != 0 &&
                        _usernameController.text.length != 0 &&
                        _emailController.text.length != 0) {
                      //to the home screen fecthing the data from database and storing a copy in local phone storage
                      print("continue");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CommonScaffold()));
                    } else {
                      print("something is wrong!");
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
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: height > 700
                              ? width > 600
                                  ? 22
                                  : 20
                              : 15,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height > 700 ? 50 : 30),
                GestureDetector(
                  onTap: () {
                    //switch to register...
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: height > 700
                          ? width > 600
                              ? 22
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
    );
  }
}
