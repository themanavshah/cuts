import 'dart:typed_data';

import 'package:cuts/common_scaffold.dart';
import 'package:cuts/dummy_data/barber_shops_data.dart';
import 'package:flutter/material.dart';

class Rating {
  bool rated;
  Rating(this.rated);
}

List<Rating> rating5 = new List<Rating>.generate(5, (i) => Rating(false));

class RatingScreen extends StatefulWidget {
  Barber barber;
  RatingScreen({Key key, this.barber}) : super(key: key);

  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  void rateIt(int index) {
    for (var i = 0; i < rating5.length; i++) {
      if (i <= index) {
        rating5[i].rated = true;
      } else {
        rating5[i].rated = false;
      }
    }
    // for (var i = index; i >= index; i--) {
    //   rating5[i].rated = true;
    // }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print(rating5);
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
            SizedBox(
                height: height > 850
                    ? height > 1050
                        ? 100
                        : 50
                    : 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.transparent,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.transparent,
                      size: 18,
                    ),
                    onPressed: null,
                  ),
                ),
                Text(
                  'Rating',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: height > 1050 ? 28 : 20),
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
            SizedBox(
                height: height > 850
                    ? height > 1050
                        ? 250
                        : 115
                    : 60),
            CircleAvatar(
              radius: height > 850 ? 65 : 40,
              //backgroundImage: AssetImage(widget.barber.image),
              child: Image.memory(
                Uint8List.fromList(widget.barber.image),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: height > 850 ? 30 : 20),
            Text(
              widget.barber.name,
              style: TextStyle(
                fontSize: height > 850 ? 24 : 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 60),
            Container(
              height: height > 850 ? 55 : 45,
              width: height > 850 ? 280 : 235,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: rating5.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          rateIt(index);
                          print(index + 1);
                          setState(() {});
                        },
                        child: Container(
                          height: height > 850 ? 40 : 30,
                          width: height > 850 ? 40 : 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          child: Icon(
                            Icons.star_rounded,
                            color: rating5[index].rated
                                ? Colors.orange[300]
                                : Colors.grey,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(height: height > 850 ? 80 : 60),
            GestureDetector(
              onTap: () {
                //submitting logic should be instered;
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => CommonScaffold()));
              },
              child: Container(
                height: height > 850 ? 75 : 60,
                width: MediaQuery.of(context).size.width -
                    (height > 1050 ? 250 : 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(height > 850 ? 20 : 15),
                  color: Colors.orange,
                ),
                child: Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: height > 850 ? 20 : 16,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height > 850 ? 50 : 35),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => CommonScaffold()));
              },
              child: Text(
                'back to home',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: height > 850 ? 18 : 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
