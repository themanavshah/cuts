import 'package:cuts/dummy_data/products_data.dart';
import 'package:cuts/providers/state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Service extends ConsumerWidget {
  Product element;
  Service({Key key, this.element}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final amount = watch(checkoutAmountProvider);
    return GestureDetector(
      onTap: () {
        print("SERV SCREE:  tapped");
        if (element.choosen) {
          print(element.choosen);
          print("SERV SCREE:  true");
          if (amount.state >= element.price) {
            amount.state -= element.price;
          }
        } else if (!element.choosen) {
          print("SERV SCREE:  flase");
          amount.state += element.price;
        } else {
          print("something is not right!");
        }
        element.choosen = !element.choosen;
      },
      child: Container(
        height: 80,
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(height > 700 ? 20 : 10),
            color: element.choosen
                ? Colors.orange.withOpacity(0.2)
                : Colors.transparent,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        radius: height > 700 ? 25 : 23,
                        backgroundColor: Colors.orange[50],
                        child: element.icon),
                    SizedBox(width: height > 700 ? 30 : 20),
                    Text(
                      element.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: height > 700 ? 17 : 14),
                    ),
                  ],
                ),
                Container(
                  height: height > 700 ? 40 : 30,
                  width: height > 700 ? 70 : 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: element.choosen
                        ? Colors.white
                        : Colors.orange.withOpacity(0.2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "₹ ${element.price}",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: height > 700 ? 17 : 13),
                      ),
                    ),
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
