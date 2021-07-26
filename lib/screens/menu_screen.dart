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
    return Container(
      child: Center(
        child: Column(
          children: [
            Container(
                color: Colors.grey[100],
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 17.0,
                    right: 17.0,
                    top: 50,
                    bottom: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: Icon(Icons.arrow_back_ios_rounded),
                          onPressed: () {
                            context.read(pageindex).state = page.home;
                          }),
                      Text(
                        "settings",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
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
                )),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 17.0,
                  right: 17.0,
                  top: 30,
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
                                radius: 30,
                                backgroundImage: AssetImage(currentUser.image),
                              ),
                              SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentUser.name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "+91 ${currentUser.phoneNumber}",
                                    style: TextStyle(
                                      fontSize: 14,
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
                    SizedBox(height: 10),
                    Container(
                      height: ((80 * menuList.length) + (15 * menuList.length))
                          .toDouble(),
                      child: ListView.builder(
                        //physics: const NeverScrollableScrollPhysics(),
                        //shrinkWrap: true,
                        //scrollDirection: Axis.horizontal,
                        itemCount: menuList.length,
                        itemBuilder: (BuildContext context, int index) =>
                            Padding(
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
                                        height: 80,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  // color: Colors.orange[50],
                                                  child: menuList[index].icon,
                                                ),
                                                SizedBox(width: 30),
                                                Text(
                                                  menuList[index].name,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 30),
                                            Divider(),
                                          ],
                                        ),
                                      ),
                                    ))),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
