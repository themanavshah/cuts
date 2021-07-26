import 'package:google_maps_flutter/google_maps_flutter.dart';

class Slot {
  int hour;
  int min;
  bool isOccupied;
  Slot({this.hour, this.min, this.isOccupied});
}

class Barber {
  String name;
  String openingTime;
  double rating;
  String distance;
  String image;
  bool favorite = false;
  int id;
  String description;
  List tags;
  List<Slot> slots;
  LatLng location;

  Barber({
    this.name,
    this.openingTime,
    this.rating,
    this.distance,
    this.favorite,
    this.image,
    this.id,
    this.description,
    this.tags,
    this.slots,
    this.location,
  });
}

List<Barber> barberslist = [
  Barber(
    id: 1,
    name: 'BarberX',
    openingTime: '9:00 - 22:00',
    rating: 4.6,
    distance: '1.5',
    favorite: false,
    image: 'assets/barbers/barberX.png',
    location: const LatLng(23.004285, 72.610163),
    description:
        "BarberX is specialsed in cuttings and other stuffs. What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
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
    location: const LatLng(22.987396, 72.600517),
    description:
        "Barber cuts is specialsed in cuttings and other stuffs. What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    tags: [
      "Barber cust",
      "Hair",
      "Coloring",
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
    id: 3,
    name: 'Braber king',
    openingTime: '8:00 - 21:00',
    rating: 4.5,
    distance: '2.1',
    favorite: true,
    image: 'assets/barbers/barberking.png',
    location: const LatLng(22.999665, 72.625233),
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
    id: 4,
    name: 'Braber kong',
    openingTime: '7:00 - 22:00',
    rating: 4.7,
    distance: '2.3',
    favorite: false,
    image: 'assets/barbers/barberkong.png',
    location: const LatLng(22.994880, 72.608653),
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
  Barber(
    id: 5,
    name: 'top cutter',
    openingTime: '9:00 - 22:00',
    rating: 4.6,
    distance: '1.5',
    favorite: true,
    image: 'assets/barbers/topcutter.png',
    location: const LatLng(22.995407, 72.623146),
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
];
