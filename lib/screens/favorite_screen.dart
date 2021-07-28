import 'package:cuts/providers/state_provider.dart';
import 'package:cuts/widgets/barber_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'barber_detail_screen.dart';

class FavoriteScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var favlist = watch(favListProv);
    print(favlist);
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 90,
            left: 30,
            right: 30,
            top: 15,
          ),
          child: Column(
            children: [
              SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.black,
                        size: 18,
                      ),
                      onPressed: () {
                        context.read(pageindex).state = page.home;
                      },
                    ),
                  ),
                  Text(
                    'Liked',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 25),
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
              SizedBox(height: 30),
              favlist.length == 0
                  ? Padding(
                      padding: const EdgeInsets.only(top: 120),
                      child: Container(
                        child: Center(
                            child: Container(
                                child: Image.asset(
                                    "assets/dummies/no_favorite.png"))),
                      ),
                    )
                  : Container(
                      height: ((120 * favlist.length) + (15 * favlist.length))
                              .toDouble() +
                          50,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        //shrinkWrap: true,
                        //scrollDirection: Axis.horizontal,
                        itemCount: favlist.length,
                        itemBuilder: (BuildContext context, int index) =>
                            Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BarberDetailScreen(
                                                    barber: favlist[index],
                                                  )));
                                    },
                                    child: BarberWidget(favlist[index]))),
                      ),
                    ),
              Container(
                height: MediaQuery.of(context).size.height,
                //color: Colors.grey.withOpacity(0.2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
