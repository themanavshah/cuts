import 'package:cuts/dummy_data/barber_shops_data.dart';
import 'package:cuts/widgets/barbers_partdetail_ms.dart';
import 'package:flutter/material.dart';

class MarkerWidget extends StatelessWidget {
  Barber barber;
  MarkerWidget({Key key, this.barber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(barber.image),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 18),
                Text(
                  barber.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 22),
                ),
                SizedBox(height: 5),
                Text(
                  '${barber.distance} km away',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
