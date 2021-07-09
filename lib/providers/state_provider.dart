import 'package:cuts/dummy_data/barber_shops_data.dart';
import 'package:cuts/dummy_data/user_dummy_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageindex = StateProvider<int>((ref) {
  return 0;
});

var favList = [];

bool barberCheck(var favlis, Barber element) {
  for (var i = 0; i < favlis.length; i++) {
    if (favlis[i].id == element.id) return true;
  }
  return false;
}

void addingFavorite() {
  for (var i = 0; i < barberslist.length; i++) {
    if (barberslist[i].favorite == true) {
      if (!barberCheck(favList, barberslist[i])) {
        favList.add(barberslist[i]);
      }
    }
  }
}

var favlistprovider = StateProvider<List>((ref) {
  addingFavorite();
  return favList;
});

class BarberFavsList extends StateNotifier<List<Barber>> {
  BarberFavsList([List<Barber> barbers]) : super(barbers ?? []);

  // void addingFavorite() {
  //   for (var i = 0; i < barberslist.length; i++) {
  //     if (barberslist[i].favorite == true) {
  //       if (!barberCheck(state, barberslist[i])) {
  //         state = [...state, barberslist[i]];
  //       }
  //     }
  //   }
  // }

  // void addRemove(Barber barber, int id) {
  //   !barberCheck(state, barber)
  //       ? state = [...state, barber]
  //       : state = state.where((barb) => barb.id != id).toList();
  // }

  void remove(int id) {
    state = state.where((barb) => barb.id != id).toList();
  }

  void add(Barber barber) {
    if (!barberCheck(state, barber)) state = [...state, barber];
  }

  displayState() {
    return state;
  }
}

final favListProv = StateNotifierProvider<BarberFavsList, List<Barber>>((ref) {
  return BarberFavsList(favBarbers);
});
