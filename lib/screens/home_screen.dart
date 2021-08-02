import 'package:cuts/dummy_data/actions_option_data.dart';
import 'package:cuts/dummy_data/barber_shops_data.dart';
import 'package:cuts/dummy_data/user_dummy_data.dart';
import 'package:cuts/providers/state_provider.dart';
import 'package:cuts/screens/actions_screen.dart';
import 'package:cuts/screens/barber_detail_screen.dart';
import 'package:cuts/widgets/barber_widget.dart';
import 'package:cuts/widgets/home_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  // int index;
  // HomeScreen({this.index});

  var _searchController = TextEditingController();

  bool notificationChecker(List<NotificationModel> lis) {
    for (var i = 0; i < lis.length; i++) {
      if (!lis[i].seen) return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    //final index = watch(pageindex);
    //print(index.state);
    return Container(
        //backgroundColor: Colors.white,
        child: Padding(
      padding: EdgeInsets.only(
        bottom: 10,
        left: height > 700 ? 30 : 25,
        right: height > 700 ? 30 : 25,
        //top: 15,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height > 700 ? 80 : 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read(pageindex).state = page.menu;
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: height > 700 ? 25 : 18,
                        backgroundImage: AssetImage(currentUser.image),
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
                                  fontSize: height > 700 ? 12 : 10),
                            ),
                            SizedBox(height: 5),
                            Text(
                              currentUser.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: height > 700 ? 18 : 14),
                            ),
                          ]),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.read(pageindex).state = page.notification;
                  },
                  child: CircleAvatar(
                    radius: height > 700 ? 25 : 18,
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    child: Stack(
                      children: [
                        Icon(
                          Icons.notifications_none_rounded,
                          color: Colors.black,
                          size: height > 700 ? 22 : 16,
                        ),
                        Positioned(
                          right: 0,
                          child: CircleAvatar(
                            radius: height > 700 ? 3 : 2,
                            backgroundColor:
                                notificationChecker(currentUser.notification)
                                    ? Colors.red
                                    : Colors.transparent,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height > 1050 ? 70 : 50),
            Container(
              height: height > 1050 ? 70 : 70,
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
                    controller: _searchController,
                    decoration: new InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: "Search barber",
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
            SizedBox(height: height > 1050 ? 80 : 30),
            Container(
              width: width,
              child: Center(
                child: Container(
                  height: height > 700 ? 180 : 150,
                  //width: 60,
                  child: ListView.builder(
                    //shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: actionList.length,
                    itemBuilder: (BuildContext context, int index) => Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Container(
                          width: width > 600
                              ? height > 1050
                                  ? 190
                                  : 160
                              : 120,
                          child: Center(
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ActionScreen(
                                                  element:
                                                      actionList[index].name,
                                                )));
                                  },
                                  child: HomeOptionWidget(index))),
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(height: height > 700 ? 30 : 20),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: width > 600 ? 250 : 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.orange,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/dummies/orange.png'),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Get free beard oil from barberX',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width > 600 ? 24 : 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Claim it till 6th sept',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width > 600 ? 18 : 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: -26,
                    left: MediaQuery.of(context).size.width / 2 - 26 - 30,
                    child: CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.white,
                    )),
                Positioned(
                    top: -18,
                    left: MediaQuery.of(context).size.width / 2 - 18 - 30,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.orange,
                      child: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.transparent,
                          child: Image.asset('assets/dummies/emote.png')),
                    )),
              ],
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
                      fontSize: height > 700 ? 25 : 20),
                ),
                GestureDetector(
                  onTap: () {
                    context.read(pageindex).state = page.show_all;
                    //Navigator.of(context).pop();
                  },
                  child: Text(
                    'show all',
                    style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w400,
                        fontSize: height > 700 ? 16 : 13),
                  ),
                ),
              ],
            ),
            SizedBox(height: height > 1050 ? 40 : 10),
            Container(
              height: ((107 * currentUser.nearbyBarber.length) +
                      (15 * currentUser.nearbyBarber.length))
                  .toDouble(),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                //shrinkWrap: true,
                //scrollDirection: Axis.horizontal,
                itemCount: !(currentUser.nearbyBarber.length > 3)
                    ? currentUser.nearbyBarber.length
                    : 3,
                itemBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BarberDetailScreen(
                                        barber: currentUser.nearbyBarber[index],
                                      )));
                        },
                        child: BarberWidget(currentUser.nearbyBarber[index]))),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
