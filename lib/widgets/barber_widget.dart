import 'package:cuts/dummy_data/barber_shops_data.dart';
import 'package:cuts/providers/state_provider.dart';
import 'package:flutter/material.dart';

class BarberWidget extends StatefulWidget {
  int index;
  BarberWidget(this.index);

  @override
  _BarberWidgetState createState() => _BarberWidgetState();
}

bool barberCheck(var favlis, Barber element) {
  for (var i = 0; i < favlis.length; i++) {
    if (favlis[i] == element) return true;
  }
  return false;
}

class _BarberWidgetState extends State<BarberWidget> {
  @override
  Widget build(BuildContext context) {
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
                    image: AssetImage(barberslist[this.widget.index].image),
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
                    barberslist[this.widget.index].name,
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
                        barberslist[widget.index].openingTime,
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
                        barberslist[widget.index].rating.toString(),
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
                        barberslist[widget.index].distance + 'km away',
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
              barberslist[widget.index].favorite
                  ? Icons.favorite
                  : Icons.favorite_border,
              color:
                  barberslist[widget.index].favorite ? Colors.red : Colors.grey,
            ),
            onPressed: () {
              setState(() {
                barberCheck(favList, barberslist[widget.index])
                    ? favList.remove(barberslist[widget.index])
                    : favList.add(barberslist[widget.index]);
                barberslist[widget.index].favorite =
                    !barberslist[widget.index].favorite;
              });
            },
          ),
        ],
      ),
    );
  }
}
