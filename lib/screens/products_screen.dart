import 'package:cuts/dummy_data/products_data.dart';
import 'package:cuts/dummy_data/user_dummy_data.dart';
import 'package:cuts/providers/state_provider.dart';
import 'package:cuts/screens/payment_screen.dart';
import 'package:cuts/widgets/service_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductScreen extends ConsumerWidget {
  ProductScreen({Key key}) : super(key: key);

  void setToFalse(List<Product> pl) {
    for (var i = 0; i < pl.length; i++) {
      pl[i].choosen = false;
    }
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final amount = watch(checkoutAmountProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          bottom: 40,
          left: 30,
          right: 30,
          top: 15,
        ),
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
            SizedBox(height: 30),
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
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 15),
                      Container(
                        width: MediaQuery.of(context).size.width - 165,
                        child: Text(
                          'Additional charges may apply in the shop if you want something to be diffrent or additional. Those are the basic charges',
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
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
            SizedBox(height: 20),
            Container(
              height: ((70 * productsList.length) + (15 * productsList.length))
                  .toDouble(),
              child: ListView.builder(
                //physics: const NeverScrollableScrollPhysics(),
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
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    print("payment screen");
                    if (amount.state > 0) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentScreen()));
                    } else {
                      print("value = 0");
                    }
                  },
                  child: Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width - 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: amount.state > 0
                          ? Colors.orange
                          : Colors.grey.withOpacity(0.2),
                    ),
                    child: Center(
                      child: Text(
                        'Proceed',
                        style: TextStyle(
                          color: amount.state > 0 ? Colors.white : Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                //SizedBox(width: 10),
                Container(
                  height: 70,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
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
                            fontSize: 17),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
