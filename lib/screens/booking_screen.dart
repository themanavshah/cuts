import 'package:cuts/dummy_data/barber_shops_data.dart';
import 'package:cuts/providers/state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class BookingScreen extends ConsumerWidget {
  List<int> days;
  int year;
  int month;
  int currentDay;
  Barber barber;
  BookingScreen(
      {Key key, this.days, this.month, this.year, this.currentDay, this.barber})
      : super(key: key);

  DateTime itsnow = new DateTime.now();

  final monthList = [
    "##",
    "January",
    "Feburary",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  // Color returnstextColor(index, cd) {
  //   if ( index % 7 == 0 || index + 1 < currentDay) return Colors.grey;
  //   else if () ;
  // }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    //String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(itsnow);
    var currentHour = DateTime.parse(itsnow.toString()).hour;
    var currentDay = DateTime.parse(itsnow.toString()).day;
    //print("xD: " + datex.hour.toString());
    //print("yD: " + datey.hour.toString());
    final selectedDate = watch(selectedDateProvider);
    final selectedHour = watch(selectedHourProvider);
    final selectedMinute = watch(selectedMinProvider);
    print(currentDay);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          bottom: 20,
          left: 30,
          right: 30,
          top: 15,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
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
                        context.read(selectedHourProvider).state = null;
                        context.read(selectedMinProvider).state = null;
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Text(
                    'Booking',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
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
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        monthList[month],
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.black,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.white,
                            size: 8,
                          ),
                          onPressed: () {
                            //Navigator.of(context).pop();
                            print(monthList[month - 1]);
                          },
                        ),
                      ),
                      SizedBox(width: 4),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.black,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            size: 8,
                          ),
                          onPressed: () {
                            //Navigator.of(context).pop();
                            print(monthList[month + 1]);
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                height: 270,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: days.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 8,
                    childAspectRatio: (5 / 4),
                  ),
                  itemBuilder: (
                    context,
                    indexx,
                  ) {
                    var index = indexx == days.length ? indexx : indexx + 1;
                    return GestureDetector(
                      onTap: () {
                        print("prev SD: " + selectedDate.state.toString());
                        if (index < currentDay) {
                          print("day not available");
                        } else if (index % 7 == 0) {
                          print("it's sunday bitch");
                        } else {
                          context.read(selectedDateProvider).state =
                              days[index - 1];
                          context.read(selectedHourProvider).state = null;
                          context.read(selectedMinProvider).state = null;
                        }
                        print("curr SD: " + selectedDate.state.toString());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: index == selectedDate.state
                              ? Colors.black
                              : Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            days[index - 1].toString(),
                            style: TextStyle(
                                color: (index % 7 == 0 ||
                                        index < currentDay ||
                                        index == selectedDate.state)
                                    ? Colors.grey
                                    : Colors.black),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 55),
              Row(
                children: [
                  Text(
                    'Set Time',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ],
              ),
              //SizedBox(height: 10),
              Container(
                height: 250,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: barber.slots.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 14,
                    childAspectRatio: (8 / 2),
                  ),
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    return GestureDetector(
                      onTap: () {
                        if (barber.slots[index].isOccupied) {
                          print("it's occupied DA");
                        } else if (!(selectedDate.state == currentDay)) {
                          context.read(selectedHourProvider).state =
                              barber.slots[index].hour;
                          context.read(selectedMinProvider).state =
                              barber.slots[index].min;
                        } else if (currentHour >= barber.slots[index].hour) {
                          print("it's gone");
                        } else {
                          context.read(selectedHourProvider).state =
                              barber.slots[index].hour;
                          context.read(selectedMinProvider).state =
                              barber.slots[index].min;
                        }
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: barber.slots[index].hour > currentHour ||
                                        (barber.slots[index].isOccupied) ||
                                        !(selectedDate.state == currentDay)
                                    ? Colors.black
                                    : Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                            color:
                                selectedHour.state == barber.slots[index].hour
                                    ? Colors.black
                                    : Colors.white,
                          ),
                          height: 10,
                          width: 90,
                          child: Center(
                              child: Text(
                            barber.slots[index].hour.toString() +
                                ":" +
                                barber.slots[index].min.toString() +
                                "0",
                            style: TextStyle(
                              color: barber.slots[index].hour > currentHour ||
                                      (barber.slots[index].isOccupied) ||
                                      !(selectedDate.state == currentDay)
                                  ? (selectedHour.state ==
                                          barber.slots[index].hour)
                                      ? Colors.white
                                      : Colors.black
                                  : Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ))),
                    );
                  },
                ),
              ),
              //SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  print("stripe integration && furthure paymnet screen");
                },
                child: Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: selectedHour.state == null
                        ? Colors.grey.withOpacity(0.2)
                        : Colors.orange,
                  ),
                  child: Center(
                    child: Text(
                      'Confirm booking',
                      style: TextStyle(
                        color: selectedHour.state == null
                            ? Colors.black.withOpacity(0.5)
                            : Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
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
