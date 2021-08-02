import 'package:cuts/dummy_data/actions_option_data.dart';
import 'package:flutter/material.dart';

class HomeOptionWidget extends StatelessWidget {
  //const HomeOptionWidget({Key key}) : super(key: key);

  var index;
  HomeOptionWidget(this.index);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          CircleAvatar(
            radius: height > 700 ? 60 : 45,
            backgroundColor: Colors.grey.withOpacity(0.2),
            child: CircleAvatar(
              radius: height > 700 ? 30 : 25,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(actionList[index].path.toString()),
            ),
          ),
          SizedBox(height: 10),
          Text(actionList[index].name.toString(),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: height > 700 ? 16 : 13,
              ))
        ],
      ),
      // child: Text(
      //   this.integer.toString(),
      //   style: TextStyle(color: Colors.black),
      // ),
    );
  }
}
