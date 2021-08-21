import 'package:cuts/dummy_data/barber_shops_data.dart';
import 'package:cuts/widgets/barbers_partdetail_ms.dart';
import 'package:flutter/material.dart';

class MarkerWidget extends StatelessWidget {
  Barber barber;
  MarkerWidget({Key key, this.barber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height > 700 ? 100 : 60,
      width: height > 700 ? 230 : 170,
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
              width: height > 700 ? 60 : 40,
              height: height > 700 ? 60 : 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(height > 700 ? 15 : 10),
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(barber.image),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(width: height > 700 ? 20 : 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height > 700 ? 18 : 5),
                Text(
                  barber.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: height > 700 ? 22 : 16),
                ),
                SizedBox(height: height > 700 ? 5 : 2),
                Text(
                  '${barber.distance} km away',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: height > 700 ? 18 : 12),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
