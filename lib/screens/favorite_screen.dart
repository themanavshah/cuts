import 'package:cuts/dummy_data/barber_shops_data.dart';
import 'package:cuts/providers/state_provider.dart';
import 'package:cuts/widgets/barber_fav_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    //adding it to favorite
    var favlist = watch(favlistprovider);
    //var pageindx = watch(pageindex);
    //print(favlist.state[0].name);
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
                        context.read(pageindex).state = 0;
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
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    child: Icon(
                      Icons.more_vert,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                height:
                    ((120 * favlist.state.length) + (15 * favlist.state.length))
                            .toDouble() +
                        50,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  //shrinkWrap: true,
                  //scrollDirection: Axis.horizontal,
                  itemCount: favlist.state.length,
                  itemBuilder: (BuildContext context, int index) => Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: BarberFavWidget(index)),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                //color: Colors.grey.withOpacity(0.2),
              )
            ],
          ),
        ),
      ),
    );
  }
}
