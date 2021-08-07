import 'package:cuts/dummy_data/barber_shops_data.dart';
import 'package:cuts/dummy_data/user_dummy_data.dart';
import 'package:cuts/widgets/confirm_modal_sheet.dart';
import 'package:cuts/widgets/online_transfer_dialogBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dotted_decoration/dotted_decoration.dart';

enum selectedThing {
  onlineTransfer,
  directPayment,
}

class PaymentScreen extends StatefulWidget {
  Barber barber;
  PaymentScreen({Key key, this.barber}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool _isSelcted = false;

  selectedThing selectedthing;

  String _cardNumberFormatter(int cardn) {
    String finalcardn = "";
    String initcardn = cardn.toString();
    for (var i = 0; i < initcardn.length; i++) {
      if (i == 0) {
        finalcardn = finalcardn + initcardn[i];
        continue;
      }
      if (i % 4 == 0) {
        finalcardn = finalcardn + " ";
      }
      finalcardn = finalcardn + initcardn[i];
    }
    //print(finalcardn.length);
    return finalcardn;
  }

  String cardTypere(CardType cardtp) {
    if (cardtp == CardType.MASTERCARD) {
      return "MASTERCARD";
    } else if (cardtp == CardType.VISA) {
      return "VISA";
    } else {
      return "AMEX";
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    _cardNumberFormatter(1234567890123456);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          bottom: 40,
          left: height > 1050 ? 60 : 30,
          right: height > 1050 ? 60 : 30,
          top: 15,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: height > 850
                      ? 50
                      : height > 700
                          ? 40
                          : 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: height > 850 ? 22 : 18,
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.black,
                        size: height > 850 ? 18 : 14,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Text(
                    'Payment',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: height > 850 ? 20 : 18),
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
              SizedBox(height: height > 1050 ? 130 : 50),
              Row(
                children: [
                  Text(
                    "Your Card",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: width > 600 ? 24 : 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Container(
                height: height > 850
                    ? width > 600
                        ? height > 1050
                            ? 340
                            : 250
                        : 200
                    : 180,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: Center(
                    child: currentUser.card == null
                        ? Container(
                            height: width > 600
                                ? height > 1050
                                    ? 260
                                    : 200
                                : 160,
                            width: MediaQuery.of(context).size.width -
                                (height > 1050 ? 190 : 110),
                            child: Center(
                              child: Text(
                                "Add a card",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: width > 600 ? 18 : 16,
                                ),
                              ),
                            ),
                            decoration: DottedDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey,
                                shape: Shape.box,
                                strokeWidth: 2,
                                dash: <int>[12, 8]))
                        : Container(
                            height: height > 850
                                ? width > 600
                                    ? height > 1050
                                        ? 340
                                        : 250
                                    : 200
                                : 180,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                                child: Stack(
                              children: [
                                Positioned(
                                  top: 40,
                                  left: 40,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Balance",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: height > 1050 ? 16 : 14,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "\$10,343",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: height > 1050 ? 28 : 22,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: height > 1050 ? 60 : 45,
                                  left: 40,
                                  child: Container(
                                      height: height > 1050 ? 35 : 25,
                                      width: height > 1050 ? 50 : 32,
                                      decoration: BoxDecoration(
                                        image: new DecorationImage(
                                          image: new ExactAssetImage(
                                              'assets/dummies/microchip.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                ),
                                Positioned(
                                  left: 40,
                                  bottom: 20,
                                  child: Text(
                                    _cardNumberFormatter(
                                        currentUser.card.cardNumber),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: height > 1050 ? 20 : 13,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 40,
                                  top: height > 1050 ? 60 : 40,
                                  child: Text(
                                    cardTypere(currentUser.card.cardType),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: height > 1050 ? 32 : 23,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: new DecorationImage(
                                image: new ExactAssetImage(
                                    'assets/dummies/cardbg.png'),
                                fit: BoxFit.cover,
                              ),
                            ))),
              ),
              SizedBox(
                  height: width > 600
                      ? height > 1050
                          ? 100
                          : 80
                      : 50),
              Row(
                children: [
                  Text(
                    "Payment method",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: width > 600 ? 25 : 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height > 850 ? 40 : 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedthing = selectedThing.onlineTransfer;
                    _isSelcted = true;
                  });
                },
                child: Container(
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: height > 1050 ? 30 : 22,
                              backgroundColor: Colors.orange.withOpacity(0.1),
                              child: Icon(
                                Icons.online_prediction_rounded,
                                size: height > 1050 ? 22 : 18,
                                color: Colors.orange,
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "Online Transfer",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: width > 600
                                    ? height > 1050
                                        ? 22
                                        : 18
                                    : 16,
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          backgroundColor:
                              selectedthing == selectedThing.onlineTransfer
                                  ? Colors.orange
                                  : Colors.transparent,
                          radius: 10,
                          child: Icon(
                            Icons.check,
                            size: 8,
                            color: selectedthing == selectedThing.onlineTransfer
                                ? Colors.white
                                : Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: selectedthing == selectedThing.onlineTransfer
                        ? Colors.orange.withOpacity(0.1)
                        : Colors.transparent,
                  ),
                ),
              ),
              SizedBox(height: height > 850 ? 20 : 5),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedthing = selectedThing.directPayment;
                    _isSelcted = true;
                  });
                },
                child: Container(
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: height > 1050 ? 30 : 22,
                              backgroundColor: Colors.orange.withOpacity(0.1),
                              child: Icon(
                                Icons.payment_rounded,
                                size: height > 1050 ? 22 : 18,
                                color: Colors.orange,
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "Direct Payment",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: width > 600
                                    ? height > 1050
                                        ? 22
                                        : 18
                                    : 16,
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          backgroundColor:
                              selectedthing == selectedThing.directPayment
                                  ? Colors.orange
                                  : Colors.transparent,
                          radius: 10,
                          child: Icon(
                            Icons.check,
                            size: 8,
                            color: selectedthing == selectedThing.directPayment
                                ? Colors.white
                                : Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: selectedthing == selectedThing.directPayment
                        ? Colors.orange.withOpacity(0.1)
                        : Colors.transparent,
                  ),
                ),
              ),
              SizedBox(
                  height: height > 850
                      ? width > 600
                          ? 80
                          : 60
                      : 40),
              GestureDetector(
                onTap: () {
                  if (_isSelcted) {
                    if (selectedthing == selectedThing.onlineTransfer) {
                      //logic of onln Trnsf...
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return OTBottomSheet();
                        },
                      );
                      print("online trnsf");
                    } else if (selectedthing == selectedThing.directPayment) {
                      //logic of drct pymt...
                      print("drct pymnet");
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return ConfirmModalSheet(
                            barber: widget.barber,
                          );
                        },
                      );
                    } else {
                      print("something is not right!");
                    }
                  }
                },
                child: Container(
                  height: height > 850
                      ? height > 1050
                          ? 100
                          : 80
                      : 60,
                  width: MediaQuery.of(context).size.width -
                      (height > 850 ? 0 : 50),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: _isSelcted ? Colors.white : Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: height > 850 ? 16 : 14,
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: _isSelcted
                        ? Colors.orange
                        : Colors.grey.withOpacity(0.1),
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
