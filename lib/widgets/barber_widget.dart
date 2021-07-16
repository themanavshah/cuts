import 'package:cuts/dummy_data/barber_shops_data.dart';
import 'package:cuts/dummy_data/user_dummy_data.dart';
import 'package:cuts/providers/state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BarberWidget extends ConsumerWidget {
  int index;
  var requiredList;
  BarberWidget(this.index, this.requiredList);

//   @override
//   _BarberWidgetState createState() => _BarberWidgetState();
// }

  bool barberCheck(var favlis, Barber element) {
    for (var i = 0; i < favlis.length; i++) {
      if (favlis[i].id == element.id) return true;
    }
    return false;
  }

//class _BarberWidgetState extends State<BarberWidget> {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var favlist = watch(favListProv);
    print("rebuild of barbWidget");
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
                    image:
                        AssetImage(currentUser.nearbyBarber[this.index].image),
                  ),
                ),
                // child: ClipRRect(
                //   borderRadius: BorderRadius.circular(20),
                //   child: Image(
                //     image: AssetImage('assets/barbers/barberX.png'),
                //   ),
                // ),
              ),
              SizedBox(width: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    requiredList[this.index].name,
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
                        requiredList[index].openingTime,
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
                        requiredList[index].rating.toString(),
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
                        requiredList[index].distance + 'km away',
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
              barberCheck(favlist, requiredList[index])
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: barberCheck(favlist, requiredList[index])
                  ? Colors.red
                  : Colors.grey,
            ),
            onPressed: () {
              //print("1 " + favBarbers.toString());
              print(requiredList[index].name);
              print(context.read(favListProv.notifier).displayState());
              // print(index);
              // context
              //     .read(favListProv.notifier)
              //     .remove(nearbyBrabers[index].id);
              //print(context.read(favListProv.notifier).displayState());
              //favBarbers.add(nearbyBrabers[index]);
              // barberCheck(favBarbers, nearbyBrabers[index])
              //     ? favBarbers
              //         .removeWhere((barb) => barb.id == nearbyBrabers[index].id)
              //     : favBarbers.add(nearbyBrabers[index]);
              barberCheck(favlist, requiredList[index])
                  ? context
                      .read(favListProv.notifier)
                      .remove(requiredList[index].id)
                  : context.read(favListProv.notifier).add(requiredList[index]);
              // // barberslist[index].favorite =
              //     !barberslist[index].favorite;
              //print("2 " + favBarbers.toString());
            },
          ),
        ],
      ),
    );
  }
}
