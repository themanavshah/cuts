import 'package:cuts/dummy_data/barber_shops_data.dart';
import 'package:cuts/providers/state_provider.dart';
import 'package:cuts/screens/chat_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BarberDetailScreen extends ConsumerWidget {
  List reqlist;
  int index;

  BarberDetailScreen({this.reqlist, this.index});

  bool barberCheck(var favlis, Barber element) {
    for (var i = 0; i < favlis.length; i++) {
      if (favlis[i].id == element.id) return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var favlist = watch(favListProv);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(reqlist[this.index].image),
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.black.withOpacity(0.8),
                        Colors.transparent
                      ])),
                ),
                Positioned(
                  left: 20,
                  top: 50,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 40.0,
                right: 40,
                left: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            reqlist[index].name,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            '250 taptoid street',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              SizedBox(width: 5),
                              Container(
                                width: 80,
                                height: 20,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: reqlist[index].rating.floor(),
                                    itemBuilder:
                                        (BuildContext context, int index) =>
                                            Icon(
                                              Icons.star,
                                              size: 16,
                                              color: Colors.yellow,
                                            )),
                              ),
                              Text(
                                reqlist[index].rating.toString(),
                                style: TextStyle(
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.chat_outlined,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                print('chat');
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ChatDetailScreen(
                                    barber: reqlist[index],
                                  );
                                }));
                              }),
                          IconButton(
                            icon: Icon(
                              barberCheck(favlist, reqlist[index])
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: barberCheck(favlist, reqlist[index])
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                            onPressed: () {
                              print(reqlist[index].name);
                              print(context
                                  .read(favListProv.notifier)
                                  .displayState());
                              barberCheck(favlist, reqlist[index])
                                  ? context
                                      .read(favListProv.notifier)
                                      .remove(reqlist[index].id)
                                  : context
                                      .read(favListProv.notifier)
                                      .add(reqlist[index]);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  //SizedBox(height: 20),
                  // Container(
                  //   height: 120,
                  //   width: MediaQuery.of(context).size.width,
                  //   child: Center(child: Text('grid logic of tags')),
                  //   color: Colors.orange.withOpacity(0.2),
                  // ),
                  Container(
                    height: ((55 + 10) * 2).toDouble(),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: reqlist[index].tags.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 8,
                        childAspectRatio: (10 / 2),
                      ),
                      itemBuilder: (
                        context,
                        indexx,
                      ) {
                        return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.orange[50],
                            ),
                            height: 10,
                            width: 90,
                            child: Center(
                                child: Text(
                              reqlist[index].tags[indexx],
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            )));
                      },
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    reqlist[index].description,
                    style: TextStyle(
                      height: 1.6,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      print('payment screens and logic will be added');
                    },
                    child: Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.orange,
                      ),
                      child: Center(
                        child: Text(
                          'Book now',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
