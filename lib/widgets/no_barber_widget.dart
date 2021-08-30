import 'package:flutter/material.dart';

class NoBarberWidget extends StatelessWidget {
  NoBarberWidget({Key key}) : super(key: key);

  Widget greyNoBarberWidget() {
    return Row(
      children: [
        Container(
          height: 100,
          width: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
        SizedBox(width: 20),
        Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 10,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 10,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 10,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            SizedBox(height: 10),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        greyNoBarberWidget(),
        SizedBox(height: 20),
        greyNoBarberWidget(),
        SizedBox(height: 20),
      ],
    );
  }
}
