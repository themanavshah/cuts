import 'package:cuts/dummy_data/barber_shops_data.dart';
import 'package:cuts/providers/state_provider.dart';

class ChatBarber {
  Barber barber;
  List<Message> messageList = [];
  ChatBarber({this.barber});

  void addMessage(Message message) {
    messageList.add(message);
  }
}

class User {
  int userId;
  List<Barber> favBarbers;
  List<Barber> nearbyBarber;
  List<ChatBarber> chatbarber;
  User({
    this.userId,
    this.favBarbers,
    this.chatbarber,
    this.nearbyBarber,
  });
}

var currentUser = User(userId: 254542, favBarbers: [
  Barber(
    id: 3,
    name: 'Barber king',
    openingTime: '8:00 - 21:00',
    rating: 4.5,
    distance: '2.1',
    favorite: true,
    image: 'assets/barbers/barberking.png',
    description:
        "Barber king is specialsed in cuttings and other stuffs. What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    tags: [
      "Barber king",
      "Man's haircut",
      "Shaving",
    ],
  ),
  Barber(
    id: 5,
    name: 'top cutter',
    openingTime: '9:00 - 22:00',
    rating: 4.6,
    distance: '1.5',
    favorite: true,
    image: 'assets/barbers/topcutter.png',
    description:
        "top cutter is specialsed in cuttings and other stuffs. What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    tags: [
      "top cutter",
      "Man's haircut",
      "Shaving",
    ],
  ),
], nearbyBarber: [
  Barber(
    id: 1,
    name: 'BarberX',
    openingTime: '9:00 - 22:00',
    rating: 4.6,
    distance: '1.5',
    favorite: false,
    image: 'assets/barbers/barberX.png',
    description:
        "Barber X is specialsed in cuttings and other stuffs. What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    tags: [
      "BarberX",
      "Man's haircut",
      "Coloring",
      "Shaving",
    ],
  ),
  Barber(
    id: 2,
    name: 'Braber cuts ',
    openingTime: '7:00 - 23:00',
    rating: 4.3,
    distance: '1.2',
    favorite: false,
    image: 'assets/barbers/barbercuts.png',
    description:
        "Braber cuts is specialsed in cuttings and other stuffs. What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    tags: [
      "Barber cust",
      "Man's haircut",
      "Coloring",
      "Shaving",
    ],
  ),
  Barber(
    id: 5,
    name: 'top cutter',
    openingTime: '9:00 - 22:00',
    rating: 4.6,
    distance: '1.5',
    favorite: true,
    image: 'assets/barbers/topcutter.png',
    description:
        "top cutter is specialsed in cuttings and other stuffs. What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    tags: [
      "top cutter",
      "Man's haircut",
      "Shaving",
    ],
  ),
], chatbarber: []);
