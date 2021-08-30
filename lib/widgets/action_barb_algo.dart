import 'package:cuts/dummy_data/barber_shops_data.dart';
import 'package:cuts/dummy_data/user_dummy_data.dart';

List<Barber> actionBarbAlgo(String action) {
  bool barberCheck(var favlis, Barber element) {
    for (var i = 0; i < favlis.length; i++) {
      if (favlis[i].id == element.id) return true;
    }
    return false;
  }

  List<Barber> finalBarb = [];
  List tempBarb = currentUser.nearbyBarber + currentUser.favBarbers;
  print(currentUser.favBarbers[0].name);
  List<Barber> distTempBarb = tempBarb.toSet().toList();
  print("sdsd" + distTempBarb.toString());
  if (distTempBarb.isNotEmpty) {
    for (var i = 0; i < distTempBarb.length; i++) {
      print(distTempBarb[i].name);
      var tagList = distTempBarb[i].tags;
      for (var j = 0; j < tagList.length; j++) {
        if (action == tagList[j]) {
          if (!barberCheck(finalBarb, distTempBarb[i])) {
            finalBarb.add(distTempBarb[i]);
          }
        }
      }
    }
  }

  print(finalBarb.length);
  return finalBarb;
}
