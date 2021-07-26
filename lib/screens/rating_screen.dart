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
            SizedBox(height: 50),
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
                      fontSize: 20),
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
            SizedBox(height: 115),
            CircleAvatar(
              radius: 65,
              backgroundImage: AssetImage(widget.barber.image),
            ),
            SizedBox(height: 30),
            Text(
              widget.barber.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 60),
            Container(
              height: 55,
              width: 280,
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
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
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
            SizedBox(height: 80),
            GestureDetector(
              onTap: () {
                //submitting logic should be instered;
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => CommonScaffold()));
              },
              child: Container(
                height: 75,
                width: MediaQuery.of(context).size.width - 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.orange,
                ),
                child: Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
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
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
