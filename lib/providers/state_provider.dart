import 'package:cuts/dummy_data/barber_shops_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageindex = StateProvider<int>((ref) {
  return 0;
});

var favList = [];

void addingFavorite() {
  for (var i = 0; i < barberslist.length; i++) {
    if (barberslist[i].favorite == true) {
      favList.add(barberslist[i]);
    }
  }
}

var favlistprovider = StateProvider<List>((ref) {
  addingFavorite();
  return favList;
});
