// import 'package:cuts/dummy_data/barber_shops_data.dart';
// import 'package:cuts/providers/state_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class BarberWidget extends ConsumerWidget {
//   int index;
//   BarberWidget(this.index);

//   bool barberCheck(var favlis, Barber element) {
//     for (var i = 0; i < favlis.length; i++) {
//       if (favlis[i] == element) return true;
//     }
//     return false;
//   }

//   @override
//   Widget build(BuildContext context, ScopedReader watch) {
//     watch(favlistprovider).addingFavorite();
//     var favList = watch(favlistprovider).favList;
//     return Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Container(
//                 height: 120,
//                 width: 80,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: Colors.grey.withOpacity(0.2),
//                   image: DecorationImage(
//                     fit: BoxFit.fill,
//                     image: AssetImage(barberslist[this.index].image),
//                   ),
//                 ),
//                 // child: ClipRRect(
//                 //   borderRadius: BorderRadius.circular(20),
//                 //   child: Image(
//                 //     image: AssetImage('assets/barbers/barberX.png'),
//                 //   ),
//                 // ),
//               ),
//               SizedBox(width: 25),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     barberslist[this.index].name,
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 20),
//                   ),
//                   SizedBox(height: 3),
//                   Row(
//                     children: [
//                       Text(
//                         'open now',
//                         style: TextStyle(
//                             color: Colors.blue,
//                             fontWeight: FontWeight.w300,
//                             fontSize: 15),
//                       ),
//                       SizedBox(width: 15),
//                       Icon(
//                         Icons.access_time_rounded,
//                         size: 10,
//                       ),
//                       SizedBox(width: 5),
//                       Text(
//                         barberslist[this.index].openingTime,
//                         style: TextStyle(
//                             color: Colors.grey,
//                             fontWeight: FontWeight.w300,
//                             fontSize: 10),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 12),
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.star,
//                         size: 14,
//                         color: Colors.yellow,
//                       ),
//                       SizedBox(width: 5),
//                       Text(
//                         barberslist[this.index].rating.toString(),
//                         style: TextStyle(
//                             color: Colors.yellow,
//                             fontWeight: FontWeight.w300,
//                             fontSize: 12),
//                       ),
//                       SizedBox(width: 9),
//                       Icon(
//                         Icons.location_pin,
//                         size: 14,
//                         color: Colors.grey,
//                       ),
//                       SizedBox(width: 5),
//                       Text(
//                         barberslist[this.index].distance + 'km away',
//                         style: TextStyle(
//                             color: Colors.grey,
//                             fontWeight: FontWeight.w300,
//                             fontSize: 12),
//                       ),
//                     ],
//                   )
//                 ],
//               )
//             ],
//           ),
//           IconButton(
//             icon: Icon(
//               barberslist[this.index].favorite
//                   ? Icons.favorite
//                   : Icons.favorite_border,
//               color:
//                   barberslist[this.index].favorite ? Colors.red : Colors.grey,
//             ),
//             onPressed: () {
//               barberCheck(favList, barberslist[this.index])
//                   ? favList.remove(barberslist[this.index])
//                   : favList.add(barberslist[this.index]);
//               barberslist[this.index].favorite =
//                   !barberslist[this.index].favorite;
//               watch(favlistprovider).addingFavorite();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
