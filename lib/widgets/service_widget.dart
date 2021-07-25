import 'package:cuts/dummy_data/products_data.dart';
import 'package:cuts/providers/state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Service extends ConsumerWidget {
  Product element;
  Service({Key key, this.element}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
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
            borderRadius: BorderRadius.circular(20),
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
                        radius: 25,
                        backgroundColor: Colors.orange[50],
                        child: element.icon),
                    SizedBox(width: 30),
                    Text(
                      element.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                  ],
                ),
                Container(
                  height: 40,
                  width: 70,
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
                            fontSize: 17),
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
