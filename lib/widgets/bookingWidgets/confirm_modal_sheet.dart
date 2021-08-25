import 'package:cuts/common_scaffold.dart';
import 'package:cuts/dummy_data/barber_shops_data.dart';
import 'package:cuts/providers/state_provider.dart';
import 'package:cuts/screens/bookingScreens/rating_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfirmModalSheet extends ConsumerWidget {
  Barber barber;
  ConfirmModalSheet({Key key, this.barber}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    //also adding the logic if request was not processed...
    final hourProvider = watch(selectedHourProvider);
    final minProvider = watch(selectedMinProvider);
    final dateProvider = watch(selectedDateProvider);
    final amountProvider = watch(checkoutAmountProvider);

    var now = new DateTime.now().toString();
    var dateParse = DateTime.parse(now);

    void setToInit() {
      hourProvider.state = null;
      minProvider.state = null;
      dateProvider.state = dateParse.day;
      amountProvider.state = 0;
    }

    return Container(
      //height: 450,
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
          top: width > 600
              ? height > 1050
                  ? 70
                  : 50
              : height > 700
                  ? 50
                  : 30,
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                height: height > 850
                    ? width > 600
                        ? height > 1050
                            ? 220
                            : 180
                        : 160
                    : height > 700
                        ? 150
                        : 120,
                child: Image.asset("assets/dummies/clap.png"),
              ),
              SizedBox(height: height > 850 ? 10 : 5),
              Text(
                'Congratulations',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: height > 850
                        ? width > 600
                            ? height > 1050
                                ? 26
                                : 24
                            : 22
                        : 18),
              ),
              SizedBox(height: height > 850 ? 25 : 18),
              Container(
                width: MediaQuery.of(context).size.width -
                    (height > 1050 ? 300 : 170),
                child: Text(
                  'You have successfully ordered our services. For further information, you can see at the notification',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                      fontSize: height > 850
                          ? width > 600
                              ? height > 1050
                                  ? 20
                                  : 16
                              : 14
                          : 12),
                ),
              ),
              SizedBox(
                  height: height > 850
                      ? width > 600
                          ? height > 1050
                              ? 70
                              : 70
                          : 50
                      : 35),
              GestureDetector(
                onTap: () {
                  context.read(pageindex).state = page.home;
                  setToInit();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RatingScreen(barber: barber),
                    ),
                  );
                },
                child: Container(
                  height: height > 850 ? 80 : 60,
                  width: MediaQuery.of(context).size.width -
                      (height > 1050 ? 160 : 120),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(
                      child: Text(
                        "Next",
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
