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
    return Scaffold(
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10.0, right: 40, left: 40, bottom: 20),
          child: Column(
            children: [
              SizedBox(height: 60),
              Text(
                'cuts',
                style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.w700,
                    fontSize: 55),
              ),
              SizedBox(height: 10),
              Text(
                'we guaranteed your handsome',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
              ),
              SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 75,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.orange,
                    ),
                    child: Center(
                      child: Text(
                        'email',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 75,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: Center(
                      child: Text(
                        'google',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
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
                        hintText: "username",
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
              SizedBox(height: 20),
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
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
                        hintText: "email",
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
              SizedBox(height: 20),
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width - 150,
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
                        ),
                        onPressed: () {
                          setState(() {
                            _passvisible = !_passvisible;
                          });
                        })
                  ],
                ),
              ),
              SizedBox(height: 60),
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
                  height: 75,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.orange,
                  ),
                  child: Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
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
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
