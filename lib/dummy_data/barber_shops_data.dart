class Barber {
  String name;
  String openingTime;
  var rating;
  String distance;
  String image;
  bool favorite = false;
  int id;
  String description;
  List tags;

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
    description:
        "BarberX is specialsed in cuttings and other stuffs. What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
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
        "Barber cuts is specialsed in cuttings and other stuffs. What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    tags: [
      "Barber cust",
      "Man's haircut",
      "Coloring",
      "Shaving",
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
    description:
        "Barber king is specialsed in cuttings and other stuffs. What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    tags: [
      "Barber king",
      "Man's haircut",
      "Shaving",
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
      "Man's haircut",
      "Beard trim",
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
];
