import 'package:cuts/dummy_data/user_dummy_data.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key key}) : super(key: key);

  final _fullnameController = TextEditingController();
  final _phonenumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 25.0,
          right: 25.0,
          top: height > 850 ? 30 : 0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: height > 850
                      ? 30
                      : height > 700
                          ? 80
                          : 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: height > 850 ? 25 : 20,
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          size: height > 850 ? 18 : 14,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: height > 850 ? 22 : 18,
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
              SizedBox(
                  height: height > 850
                      ? height > 1050
                          ? 130
                          : 65
                      : 35),
              CircleAvatar(
                radius: height > 850 ? 65 : 45,
                //backgroundImage: AssetImage(currentUser.image),
                // child: Image.memory(
                //     Uint8List.fromList(barber.image),
                //     fit: BoxFit.fill,
                //   ),
              ),
              SizedBox(height: 30),
              Text(
                currentUser.name,
                style: TextStyle(
                  fontSize: height > 850 ? 24 : 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: height > 850 ? 10 : 6),
              Text(
                "+91 ${currentUser.phoneNumber}",
                style: TextStyle(
                    fontSize: height > 850 ? 13 : 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
              SizedBox(
                  height: height > 850
                      ? height > 1050
                          ? 100
                          : 70
                      : 50),
              Container(
                width: MediaQuery.of(context).size.width -
                    (height > 1000 ? 200 : 0),
                child: Row(
                  children: [
                    Text(
                      "Full name",
                      style: TextStyle(
                          fontSize: height > 850 ? 15 : 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height > 850 ? 15 : 12),
              Container(
                height: height > 850 ? 80 : 60,
                width: MediaQuery.of(context).size.width -
                    (height > 1000 ? 200 : 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(height > 850 ? 20 : 15),
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
              SizedBox(height: height > 850 ? 30 : 20),
              Container(
                width: MediaQuery.of(context).size.width -
                    (height > 1000 ? 200 : 0),
                child: Row(
                  children: [
                    Text(
                      "phone number",
                      style: TextStyle(
                          fontSize: height > 850 ? 15 : 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height > 850 ? 15 : 12),
              Container(
                height: height > 850 ? 80 : 60,
                width: MediaQuery.of(context).size.width -
                    (height > 1000 ? 200 : 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(height > 850 ? 20 : 15),
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
              SizedBox(
                  height: height > 850
                      ? height > 1150
                          ? 95
                          : 75
                      : 55),
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
                  height: height > 850 ? 80 : 60,
                  width: MediaQuery.of(context).size.width -
                      (height > 1000 ? 200 : 0),
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
                    borderRadius: BorderRadius.circular(height > 850 ? 20 : 15),
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
