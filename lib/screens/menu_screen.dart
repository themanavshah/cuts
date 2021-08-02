import 'package:cuts/dummy_data/menu_data.dart';
import 'package:cuts/dummy_data/user_dummy_data.dart';
import 'package:cuts/providers/state_provider.dart';
import 'package:cuts/screens/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuScreen extends ConsumerWidget {
  const MenuScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                color: Colors.grey[100],
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 17.0,
                    right: 17.0,
                    top: height > 700 ? 50 : 25,
                    bottom: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            size: height > 700 ? 24 : 20,
                          ),
                          onPressed: () {
                            context.read(pageindex).state = page.home;
                          }),
                      Text(
                        "settings",
                        style: TextStyle(
                          fontSize: height > 700 ? 18 : 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.transparent,
                            size: height > 700 ? 24 : 18,
                          ),
                          onPressed: null),
                    ],
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(
                left: 17.0,
                right: 17.0,
                top: width > 600 ? 50 : 30,
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfileScreen()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: height > 700 ? 30 : 25,
                              backgroundImage: AssetImage(currentUser.image),
                            ),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentUser.name,
                                  style: TextStyle(
                                    fontSize: height > 700 ? 18 : 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 9),
                                Text(
                                  "+91 ${currentUser.phoneNumber}",
                                  style: TextStyle(
                                    fontSize: height > 700 ? 14 : 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  ),
                  SizedBox(
                      height: height > 700
                          ? width > 600
                              ? 40
                              : 10
                          : 30),
                  Container(
                    height: (((height > 700 ? 90 : 60) * menuList.length) +
                            (15 * menuList.length))
                        .toDouble(),
                    child: ListView.builder(
                      //physics: const NeverScrollableScrollPhysics(),
                      //shrinkWrap: true,
                      //scrollDirection: Axis.horizontal,
                      itemCount: menuList.length,
                      itemBuilder: (BuildContext context, int index) => Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: GestureDetector(
                              onTap: () {
                                print(menuList[index].name);
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => Row(
                                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //           children: [
                                //             Text("name"),
                                //             Icon(Icons.arrow_forward_ios_rounded),
                                //           ],
                                //         )));
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Container(
                                  height: height > 700 ? 80 : 60,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            // color: Colors.orange[50],
                                            child: menuList[index].icon,
                                          ),
                                          SizedBox(
                                              width: height > 700 ? 30 : 20),
                                          Text(
                                            menuList[index].name,
                                            style: TextStyle(
                                              fontSize: height > 700 ? 16 : 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: height > 700 ? 30 : 10),
                                      Divider(),
                                    ],
                                  ),
                                ),
                              ))),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
