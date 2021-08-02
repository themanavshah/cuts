import 'package:cuts/dummy_data/barber_shops_data.dart';
import 'package:cuts/providers/state_provider.dart';
import 'package:cuts/screens/booking_screen.dart';
import 'package:cuts/screens/chat_detail_screen.dart';
import 'package:cuts/widgets/days_in_month.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BarberDetailScreen extends ConsumerWidget {
  Barber barber;
  BarberDetailScreen({this.barber});

  bool barberCheck(var favlis, Barber element) {
    for (var i = 0; i < favlis.length; i++) {
      if (favlis[i].id == element.id) return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var favlist = watch(favListProv);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(bottom: 30.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: width > 600
                          ? height > 1100
                              ? 600
                              : 450
                          : 320,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(barber.image),
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.transparent
                          ])),
                    ),
                    Positioned(
                      left: 20,
                      top: 50,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: height > 700 ? 40.0 : 30,
                    right: height > 700 ? 40 : 25,
                    left: height > 700 ? 40 : 25,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                barber.name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: height > 700
                                      ? height > 1100
                                          ? 35
                                          : 25
                                      : 23,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                '250 taptoid street',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: height > 700
                                      ? height > 1100
                                          ? 20
                                          : 14
                                      : 12,
                                ),
                              ),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  //SizedBox(width: 5),
                                  Container(
                                    width: 90,
                                    height: 20,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: barber.rating.floor(),
                                        itemBuilder:
                                            (BuildContext context, int index) =>
                                                Icon(
                                                  Icons.star,
                                                  size: height > 700
                                                      ? height > 1100
                                                          ? 20
                                                          : 16
                                                      : 14,
                                                  color: Colors.yellow,
                                                )),
                                  ),
                                  Text(
                                    barber.rating.toString(),
                                    style: TextStyle(
                                        color: Colors.yellow,
                                        fontWeight: FontWeight.w300,
                                        fontSize: height > 700
                                            ? height > 1100
                                                ? 20
                                                : 16
                                            : 12),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                  icon: Icon(
                                    Icons.chat_outlined,
                                    color: Colors.grey,
                                    size: height > 700
                                        ? height > 1100
                                            ? 35
                                            : 24
                                        : 20,
                                  ),
                                  onPressed: () {
                                    print('chat');
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return ChatDetailScreen(
                                        barber: barber,
                                      );
                                    }));
                                  }),
                              SizedBox(width: height > 1100 ? 20 : 0),
                              IconButton(
                                icon: Icon(
                                  barberCheck(favlist, barber)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: barberCheck(favlist, barber)
                                      ? Colors.red
                                      : Colors.grey,
                                  size: height > 700
                                      ? height > 1100
                                          ? 35
                                          : 24
                                      : 20,
                                ),
                                onPressed: () {
                                  print(barber.name);
                                  print(context
                                      .read(favListProv.notifier)
                                      .displayState());
                                  barberCheck(favlist, barber)
                                      ? context
                                          .read(favListProv.notifier)
                                          .remove(barber.id)
                                      : context
                                          .read(favListProv.notifier)
                                          .add(barber);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                          height: height > 700
                              ? width > 600
                                  ? height > 1100
                                      ? 40
                                      : 20
                                  : 0
                              : 20),
                      // Container(
                      //   height: 120,
                      //   width: MediaQuery.of(context).size.width,
                      //   child: Center(child: Text('grid logic of tags')),
                      //   color: Colors.orange.withOpacity(0.2),
                      // ),
                      Container(
                        height: height > 700
                            ? width > 600
                                ? height > 1100
                                    ? 250
                                    : 180
                                : 130
                            : 100,
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: barber.tags.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: width > 600 ? 30 : 10,
                            mainAxisSpacing: width > 600 ? 20 : 8,
                            childAspectRatio: (5 / 1),
                          ),
                          itemBuilder: (
                            context,
                            indexx,
                          ) {
                            return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.orange[50],
                                ),
                                height: 10,
                                width: 90,
                                child: Center(
                                    child: Text(
                                  barber.tags[indexx],
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: height > 700
                                        ? width > 600
                                            ? 18
                                            : 15
                                        : 12,
                                  ),
                                )));
                          },
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        barber.description,
                        style: TextStyle(
                          height: 1.6,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: height > 700
                              ? width > 600
                                  ? height > 1100
                                      ? 20
                                      : 18
                                  : 15
                              : 14,
                        ),
                      ),
                      SizedBox(
                          height: height > 700
                              ? width > 600
                                  ? height > 1100
                                      ? 70
                                      : 50
                                  : 80
                              : 40),
                      GestureDetector(
                        onTap: () {
                          print('payment screens and logic will be added');
                        },
                        child: GestureDetector(
                          onTap: () {
                            var now = new DateTime.now().toString();
                            var dateParse = DateTime.parse(now);
                            var daylis = listdaysinmonth(
                                dateParse.year, dateParse.month);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookingScreen(
                                          days: daylis,
                                          month: dateParse.month,
                                          year: dateParse.year,
                                          currentDay: dateParse.day,
                                          barber: barber,
                                        )));
                            //print("day:" + dateParse.weekday.toString());
                            //var formatter = new DateFormat('MM');
                            //String month = formatter.format(now);
                            //print(dateParse.month);
                          },
                          child: Container(
                            height: height > 700
                                ? height > 1100
                                    ? 90
                                    : 70
                                : 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(height > 700 ? 20 : 15),
                              color: Colors.orange,
                            ),
                            child: Center(
                              child: Text(
                                'Book now',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: height > 700 ? 20 : 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
