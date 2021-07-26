import 'package:cuts/dummy_data/barber_shops_data.dart';
import 'package:cuts/dummy_data/user_dummy_data.dart';
import 'package:cuts/providers/state_provider.dart';
import 'package:cuts/screens/barber_detail_screen.dart';
import 'package:cuts/widgets/action_barb_algo.dart';
import 'package:cuts/widgets/barber_widget.dart';
import 'package:flutter/material.dart';

class ActionScreen extends StatefulWidget {
  var element;
  ActionScreen({Key key, this.element}) : super(key: key);

  @override
  _ActionScreenState createState() => _ActionScreenState();
}

class _ActionScreenState extends State<ActionScreen> {
  List<Barber> reqAlgoBarb;

  @override
  void initState() {
    reqAlgoBarb = actionBarbAlgo(widget.element);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                SizedBox(height: 70),
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
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Text(
                      widget.element,
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
                // SizedBox(height: 40),
                // Row(
                //   children: [
                //     Text(
                //       "For you",
                //       style: TextStyle(
                //           color: Colors.black,
                //           fontWeight: FontWeight.w600,
                //           fontSize: 25),
                //     ),
                //   ],
                // ),
                SizedBox(height: 10),
                Container(
                  height:
                      ((120 * reqAlgoBarb.length) + (15 * reqAlgoBarb.length))
                              .toDouble() +
                          50,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    //shrinkWrap: true,
                    //scrollDirection: Axis.horizontal,
                    itemCount: reqAlgoBarb.length,
                    itemBuilder: (BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BarberDetailScreen(
                                            reqlist: reqAlgoBarb,
                                            index: index,
                                          )));
                            },
                            child: BarberWidget(index, reqAlgoBarb))),
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
