import 'package:cuts/dummy_data/barber_shops_data.dart';
import 'package:cuts/dummy_data/barber_shops_data.dart';
import 'package:cuts/dummy_data/user_dummy_data.dart';
import 'package:cuts/providers/state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BarberWidget extends ConsumerWidget {
  //int index;
  //var requiredList;
  Barber barber;
  BarberWidget(this.barber);

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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var favlist = watch(favListProv);
    print("rebuild of barbWidget");
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: height > 700 ? 110 : 100,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.withOpacity(0.2),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(barber.image),
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
                    barber.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: height > 700 ? 20 : 16),
                  ),
                  SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        'open now',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w300,
                            fontSize: height > 700 ? 15 : 12),
                      ),
                      SizedBox(width: 15),
                      Icon(
                        Icons.access_time_rounded,
                        size: height > 700 ? 10 : 8,
                      ),
                      SizedBox(width: 5),
                      Text(
                        barber.openingTime,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                            fontSize: height > 700 ? 10 : 9),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: height > 700 ? 14 : 12,
                        color: Colors.yellow,
                      ),
                      SizedBox(width: 5),
                      Text(
                        barber.rating.toString(),
                        style: TextStyle(
                            color: Colors.yellow,
                            fontWeight: FontWeight.w300,
                            fontSize: 12),
                      ),
                      SizedBox(width: 9),
                      Icon(
                        Icons.location_pin,
                        size: height > 700 ? 14 : 12,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 5),
                      Text(
                        barber.distance + 'km away',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                            fontSize: height > 700 ? 12 : 10),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          IconButton(
            icon: Icon(
              barberCheck(favlist, barber)
                  ? Icons.favorite
                  : Icons.favorite_border,
              size: height > 700 ? 22 : 18,
              color: barberCheck(favlist, barber) ? Colors.red : Colors.grey,
            ),
            onPressed: () {
              print(barber.name);
              print(context.read(favListProv.notifier).displayState());
              barberCheck(favlist, barber)
                  ? context.read(favListProv.notifier).remove(barber.id)
                  : context.read(favListProv.notifier).add(barber);
            },
          ),
        ],
      ),
    );
  }
}
