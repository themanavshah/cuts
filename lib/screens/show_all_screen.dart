import 'package:cuts/dummy_data/user_dummy_data.dart';
import 'package:cuts/providers/state_provider.dart';
import 'package:cuts/screens/barber_detail_screen.dart';
import 'package:cuts/widgets/barber_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShowAllScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print("height: " + MediaQuery.of(context).size.height.toString());
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 90,
          left: height > 700 ? 30 : 20,
          right: height > 700 ? 30 : 20,
          top: 15,
        ),
        child: SingleChildScrollView(
          child: Container(
            height: height,
            child: Column(
              children: [
                SizedBox(height: height > 700 ? 50 : 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.black,
                          size: 18,
                        ),
                        onPressed: () {
                          context.read(pageindex).state = page.home;
                        },
                      ),
                    ),
                    Text(
                      'Nearby',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 25),
                    ),
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.more_vert,
                        color: Colors.transparent,
                        size: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: width > 600 ? 70 : 30),
                Container(
                  height: ((110 * currentUser.nearbyBarber.length) +
                              (15 * currentUser.nearbyBarber.length))
                          .toDouble() +
                      (height > 700 ? 50 : 0),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    //shrinkWrap: true,
                    //scrollDirection: Axis.horizontal,
                    itemCount: currentUser.nearbyBarber.length,
                    itemBuilder: (BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BarberDetailScreen(
                                            barber:
                                                currentUser.nearbyBarber[index],
                                          )));
                            },
                            child:
                                BarberWidget(currentUser.nearbyBarber[index]))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
