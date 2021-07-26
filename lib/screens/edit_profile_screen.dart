import 'package:cuts/dummy_data/user_dummy_data.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key key}) : super(key: key);

  final _fullnameController = TextEditingController();
  final _phonenumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 25.0,
          right: 25.0,
          top: 30,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          size: 18,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.transparent,
                      ),
                      onPressed: null),
                ],
              ),
              SizedBox(height: 65),
              CircleAvatar(
                radius: 65,
                backgroundImage: AssetImage(currentUser.image),
              ),
              SizedBox(height: 30),
              Text(
                currentUser.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "+91 ${currentUser.phoneNumber}",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
              SizedBox(height: 70),
              Row(
                children: [
                  Text(
                    "Full name",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 15),
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
                      controller: _fullnameController,
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: currentUser.name,
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
              SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    "phone number",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 15),
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
                      controller: _phonenumberController,
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "+91 ${currentUser.phoneNumber}",
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
              SizedBox(height: 75),
              GestureDetector(
                onTap: () {
                  if (_phonenumberController.text.isNotEmpty) {
                    if (!(_phonenumberController.text.length <= 9 ||
                        int.parse(_phonenumberController.text).isNaN)) {
                      currentUser.phoneNumber =
                          int.parse(_phonenumberController.text);
                      _phonenumberController.clear();
                      Navigator.of(context).pop();
                    } else {
                      print("not a right number");
                    }
                  } else if (_fullnameController.text.isNotEmpty) {
                    currentUser.name = _fullnameController.text;
                    _fullnameController.clear();
                    Navigator.of(context).pop();
                  } else {
                    print("both fields are emopty");
                  }
                },
                child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: Text(
                        "Save changes",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.orange,
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
