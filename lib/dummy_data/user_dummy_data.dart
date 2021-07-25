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

enum CardType {
  MASTERCARD,
  VISA,
  AMEX,
}

class Card {
  int cardNumber;
  int cvv;
  int expMonth;
  int expYear;
  String holderName;
  CardType cardType;
  Card({
    this.cardNumber,
    this.cardType,
    this.cvv,
    this.expMonth,
    this.expYear,
    this.holderName,
  });
}

class NotificationModel {
  String title;
  String mainName;
  String description;
  bool seen;
  String time;
  NotificationModel({
    this.title,
    this.mainName,
    this.description,
    this.seen,
    this.time,
  });
}

class User {
  int userId;
  String name;
  String image;
  List<Barber> favBarbers;
  List<Barber> nearbyBarber;
  List<ChatBarber> chatbarber;
  List<NotificationModel> notification;
  Card card;
  User({
    this.userId,
    this.name,
    this.image,
    this.favBarbers,
    this.chatbarber,
    this.nearbyBarber,
    this.notification,
    this.card,
  });
}

var currentUser = User(
    userId: 254542,
    name: "John Snow",
    card: Card(
        cardNumber: 1234567890123456,
        cardType: CardType.VISA,
        cvv: 123,
        expMonth: 12,
        expYear: 26,
        holderName: "John J. Snow"),
    image: "assets/dummies/mancuts.jpg",
    favBarbers: [
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
          "Coloring",
          "Beard",
        ],
        slots: [
          Slot(
            hour: 8,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 9,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 10,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 11,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 12,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 13,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 14,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 16,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 18,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 19,
            min: 00,
            isOccupied: false,
          ),
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
          "Coloring",
          "Hair",
          "Weird",
        ],
        slots: [
          Slot(
            hour: 8,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 9,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 10,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 11,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 12,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 13,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 14,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 16,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 18,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 19,
            min: 00,
            isOccupied: false,
          ),
        ],
      ),
    ],
    nearbyBarber: [
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
          "Hair",
          "Coloring",
          "Beard",
        ],
        slots: [
          Slot(
            hour: 8,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 9,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 10,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 11,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 12,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 13,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 14,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 16,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 18,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 19,
            min: 00,
            isOccupied: false,
          ),
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
          "Hair",
          "Coloring",
          "Beard",
        ],
        slots: [
          Slot(
            hour: 8,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 9,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 10,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 11,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 12,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 13,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 14,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 16,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 18,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 19,
            min: 00,
            isOccupied: false,
          ),
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
          "Coloring",
          "Hair",
          "Weird",
        ],
        slots: [
          Slot(
            hour: 8,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 9,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 10,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 11,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 12,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 13,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 14,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 16,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 18,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 19,
            min: 00,
            isOccupied: false,
          ),
        ],
      ),
      Barber(
        id: 4,
        name: 'Braber kong',
        openingTime: '7:00 - 22:00',
        rating: 4.7,
        distance: '2.3',
        favorite: false,
        image: 'assets/barbers/barberkong.png',
        description:
            "Barber kong is specialsed in cuttings and other stuffs. What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        tags: [
          "Barber kong",
          "Weird",
          "Beard",
        ],
        slots: [
          Slot(
            hour: 8,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 9,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 10,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 11,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 12,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 13,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 14,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 16,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 18,
            min: 00,
            isOccupied: false,
          ),
          Slot(
            hour: 19,
            min: 00,
            isOccupied: false,
          ),
        ],
      ),
    ],
    chatbarber: [],
    notification: [
      NotificationModel(
        title: "verification",
        mainName: "email verification successful",
        description: "Your email is confirmed at johnshnow@gmail.com",
        seen: false,
        time: "17:15",
      ),
      NotificationModel(
        title: "barber appoinment",
        mainName: "your appointment is fixed",
        description:
            "There will be a sit available for you at 10:00 says barberX.",
        seen: false,
        time: "20:15",
      ),
    ]);
