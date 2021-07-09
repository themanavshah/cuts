import 'package:cuts/dummy_data/barber_shops_data.dart';
import 'package:cuts/providers/state_provider.dart';
import 'package:cuts/widgets/barber_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BarberFavWidget extends ConsumerWidget {
  int index;
  BarberFavWidget(this.index);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var favlist = watch(favListProv);
    print("BFV: " + favlist.length.toString());
    print(favlist[index].name);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 120,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.withOpacity(0.2),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(favlist[this.index].image),
                  ),
                ),
              ),
              SizedBox(width: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    favlist[this.index].name,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                  SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        'open now',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w300,
                            fontSize: 15),
                      ),
                      SizedBox(width: 15),
                      Icon(
                        Icons.access_time_rounded,
                        size: 10,
                      ),
                      SizedBox(width: 5),
                      Text(
                        favlist[index].openingTime,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                            fontSize: 10),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 14,
                        color: Colors.yellow,
                      ),
                      SizedBox(width: 5),
                      Text(
                        favlist[index].rating.toString(),
                        style: TextStyle(
                            color: Colors.yellow,
                            fontWeight: FontWeight.w300,
                            fontSize: 12),
                      ),
                      SizedBox(width: 9),
                      Icon(
                        Icons.location_pin,
                        size: 14,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 5),
                      Text(
                        favlist[index].distance + 'km away',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                            fontSize: 12),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            onPressed: () {
              //change this \/
              //barberslist[i].favorite = false;
              print(favlist[index].id);
              print(context.read(favListProv.notifier).displayState());
              context.read(favListProv.notifier).remove(favlist[index].id);
              print(context.read(favListProv.notifier).displayState());
              // context
              //     .read(favListProv.notifier)
              //     .addRemove(favList[index], favList[index].id);
            },
          ),
        ],
      ),
    );
  }
}
