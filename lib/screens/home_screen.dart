import 'package:cuts/dummy_data/actions_option_data.dart';
import 'package:cuts/dummy_data/barber_shops_data.dart';
import 'package:cuts/dummy_data/user_dummy_data.dart';
import 'package:cuts/providers/state_provider.dart';
import 'package:cuts/widgets/barber_widget.dart';
import 'package:cuts/widgets/home_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  // int index;
  // HomeScreen({this.index});

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    //final index = watch(pageindex);
    //print(index.state);
    return Container(
        //backgroundColor: Colors.white,
        child: Padding(
      padding: const EdgeInsets.only(
        bottom: 90,
        left: 30,
        right: 30,
        top: 15,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/dummies/mancuts.jpg'),
                    ),
                    SizedBox(width: 20),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'welcome',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                //fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                          Text(
                            'john snow',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        ]),
                  ],
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  child: Stack(
                    children: [
                      Icon(
                        Icons.notifications_none_rounded,
                        color: Colors.black,
                      ),
                      Positioned(
                        right: 0,
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 70),
            Container(
              //height: 70,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.withOpacity(0.2),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: TextFormField(
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                    // focusedBorder: InputBorder.none,
                    // enabledBorder: InputBorder.none,
                    // errorBorder: InputBorder.none,
                    // disabledBorder: InputBorder.none,
                    labelText: "Search barber",
                    fillColor: Colors.grey.withOpacity(0.2),
                    // border: new OutlineInputBorder(
                    //   borderRadius: new BorderRadius.circular(25.0),
                    //   borderSide: new BorderSide(),
                    // ),
                    //fillColor: Colors.green
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "Email cannot be empty";
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
            SizedBox(height: 30),
            Container(
              height: 180,
              //width: 60,
              child: ListView.builder(
                //shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: actionList.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Center(child: HomeOptionWidget(index))),
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nearby',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 25),
                ),
                Text(
                  'show all',
                  style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
              ],
            ),
            Container(
              height:
                  ((120 * nearbyBrabers.length) + (15 * nearbyBrabers.length))
                          .toDouble() +
                      50,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                //shrinkWrap: true,
                //scrollDirection: Axis.horizontal,
                itemCount: nearbyBrabers.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: BarberWidget(index)),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
