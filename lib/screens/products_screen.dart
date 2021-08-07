import 'package:cuts/dummy_data/barber_shops_data.dart';
import 'package:cuts/dummy_data/products_data.dart';
import 'package:cuts/dummy_data/user_dummy_data.dart';
import 'package:cuts/providers/state_provider.dart';
import 'package:cuts/screens/payment_screen.dart';
import 'package:cuts/widgets/service_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductScreen extends ConsumerWidget {
  Barber barber;
  ProductScreen({Key key, this.barber}) : super(key: key);

  void setToFalse(List<Product> pl) {
    for (var i = 0; i < pl.length; i++) {
      pl[i].choosen = false;
    }
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final amount = watch(checkoutAmountProvider);
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
              SizedBox(height: height > 850 ? 50 : 30),
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
                        amount.state = 0;
                        setToFalse(productsList);
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Text(
                    'Service',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: height > 850 ? 20 : 16),
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
              SizedBox(height: height > 1050 ? 120 : 30),
              Container(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Note',
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: height > 850
                                ? height > 1050
                                    ? 28
                                    : 20
                                : 16,
                          ),
                        ),
                        SizedBox(width: height > 1050 ? 25 : 15),
                        Container(
                          width: MediaQuery.of(context).size.width -
                              (height > 1050 ? 260 : 165),
                          child: Text(
                            'Additional charges may apply in the shop if you want something to be diffrent or additional. Those are the basic charges',
                            style: TextStyle(
                              height: height > 850 ? 1 : 1.25,
                              color: Colors.orange,
                              fontWeight: FontWeight.w500,
                              fontSize: height > 850
                                  ? height > 1050
                                      ? 18
                                      : 13
                                  : 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  //color: Colors.orange.withOpacity(0.2),
                  color: Colors.orange[50],
                ),
              ),
              SizedBox(
                  height: height > 850
                      ? height > 1050
                          ? 40
                          : 0
                      : 10),
              Container(
                height:
                    ((85 * productsList.length) + (15 * productsList.length))
                        .toDouble(),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  //shrinkWrap: true,
                  //scrollDirection: Axis.horizontal,
                  itemCount: productsList.length,
                  itemBuilder: (BuildContext context, int index) => Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => BarberDetailScreen(
                            //               reqlist: currentUser.nearbyBarber,
                            //               index: index,
                            //             )));
                          },
                          child: Service(
                            element: productsList[index],
                          ))),
                ),
              ),
              SizedBox(height: height > 1050 ? 100 : 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      print("payment screen");
                      if (amount.state > 0) {
                        setToFalse(productsList);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PaymentScreen(barber: barber)));
                      } else {
                        print("value = 0");
                      }
                    },
                    child: Container(
                      height: height > 850 ? 70 : 50,
                      width: MediaQuery.of(context).size.width -
                          (height > 1050 ? 240 : 160),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(height > 850 ? 20 : 10),
                        color: amount.state > 0
                            ? Colors.orange
                            : Colors.grey.withOpacity(0.2),
                      ),
                      child: Center(
                        child: Text(
                          'Proceed',
                          style: TextStyle(
                            color:
                                amount.state > 0 ? Colors.white : Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: height > 850 ? 20 : 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //SizedBox(width: 10),
                  Container(
                    height: height > 850 ? 70 : 50,
                    width: height > 850 ? 80 : 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.orange,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "₹ ${amount.state}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: height > 850 ? 17 : 14),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
