import 'dart:typed_data';

import 'package:cuts/dummy_data/barber_shops_data.dart';
import 'package:cuts/dummy_data/user_dummy_data.dart';
import 'package:cuts/screens/barber_detail_screen.dart';
import 'package:flutter/material.dart';

class BarberDetailModalSheet extends StatelessWidget {
  Barber barber;
  BarberDetailModalSheet({Key key, this.barber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      //height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          bottom: 30,
          top: height > 800 ? 100 : 70,
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              //backgroundImage: AssetImage(barber.image),
              child: Image.memory(
                Uint8List.fromList(barber.image),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 20),
            Text(
              barber.name,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "2972 Westheimer Rd. Illinois",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            SizedBox(height: width > 600 ? 120 : 40),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BarberDetailScreen(
                              barber: barber,
                            )));
              },
              child: Container(
                height: height > 800 ? 80 : 60,
                width: MediaQuery.of(context).size.width -
                    (width > 600 ? 200 : 100),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: Text(
                      "Details",
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
    );
  }
}
