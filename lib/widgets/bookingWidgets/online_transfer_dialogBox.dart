import 'package:cuts/payments/stripe_payment.dart';
import 'package:flutter/material.dart';
//import 'package:stripe_payment/stripe_payment.dart';

enum paymentMetod {
  paytm,
  creditcard,
}

class OTBottomSheet extends StatefulWidget {
  OTBottomSheet({Key key}) : super(key: key);

  @override
  _OTBottomSheetState createState() => _OTBottomSheetState();
}

bool _isSelcted = false;
paymentMetod paymentmethod;

class _OTBottomSheetState extends State<OTBottomSheet> {
  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    // StripePayment.setOptions(StripeOptions(
    //   publishableKey:
    //       "pk_test_51JFzWkSJFrMMx7cfl2SSroxTUBqem5xebftzHBcT1dNyTa9jdHkXd0AUrx8KSZ4fFnb2g7KvVJxdRPRUVT90Tnj600DpIWFqqI",
    //   //merchantId: "Test",
    // ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _isSelcted = false;
    paymentmethod = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      // height: 500,
      // width: 250,
      child: Center(
          child: Padding(
        padding: EdgeInsets.only(
          left: height > 1050 ? 80 : 35.0,
          right: height > 1050 ? 80 : 35.0,
          top: height > 1050 ? 160 : 60,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Choose platform",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: height > 1050 ? 28 : 20,
                  ),
                ),
              ],
            ),
            //...
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  paymentmethod = paymentMetod.paytm;
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
                            radius: height > 1050 ? 30 : 18,
                            backgroundColor: Colors.orange.withOpacity(0.1),
                            child: Icon(
                              Icons.pages_rounded,
                              size: height > 1050 ? 22 : 16,
                              color: Colors.orange,
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            "Paytm",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: height > 1050 ? 20 : 16,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: paymentmethod == paymentMetod.paytm
                            ? Colors.orange
                            : Colors.transparent,
                        radius: 10,
                        child: Icon(
                          Icons.check,
                          size: 8,
                          color: paymentmethod == paymentMetod.paytm
                              ? Colors.white
                              : Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: paymentmethod == paymentMetod.paytm
                      ? Colors.orange.withOpacity(0.1)
                      : Colors.transparent,
                ),
              ),
            ),
            SizedBox(height: height > 700 ? 20 : 8),
            GestureDetector(
              onTap: () {
                setState(() {
                  paymentmethod = paymentMetod.creditcard;
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
                            radius: height > 1050 ? 30 : 18,
                            backgroundColor: Colors.orange.withOpacity(0.1),
                            child: Icon(
                              Icons.payment_rounded,
                              size: height > 1050 ? 22 : 16,
                              color: Colors.orange,
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            "credit card",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: height > 1050 ? 20 : 16,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor:
                            paymentmethod == paymentMetod.creditcard
                                ? Colors.orange
                                : Colors.transparent,
                        radius: 10,
                        child: Icon(
                          Icons.check,
                          size: 8,
                          color: paymentmethod == paymentMetod.creditcard
                              ? Colors.white
                              : Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: paymentmethod == paymentMetod.creditcard
                      ? Colors.orange.withOpacity(0.1)
                      : Colors.transparent,
                ),
              ),
            ),
            SizedBox(
                height: height > 1050
                    ? 100
                    : height > 700
                        ? 50
                        : 20),
            GestureDetector(
              onTap: () {
                print("next");
                if (_isSelcted && paymentmethod == paymentMetod.creditcard) {
                  //startPayment();
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => StripePayment()));
                  print("right place");
                }
              },
              child: Container(
                height: height > 700 ? 80 : 60,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: _isSelcted ? Colors.white : Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(height > 700 ? 20 : 15),
                  color:
                      _isSelcted ? Colors.orange : Colors.grey.withOpacity(0.1),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
