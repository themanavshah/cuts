class Barber {
  String name;
  String openingTime;
  var rating;
  String distance;
  String image;
  bool favorite = false;

  Barber({
    this.name,
    this.openingTime,
    this.rating,
    this.distance,
    this.favorite,
    this.image,
  });
}

List<Barber> barberslist = [
  Barber(
    name: 'BarberX',
    openingTime: '9:00 - 22:00',
    rating: 4.6,
    distance: '1.5',
    favorite: false,
    image: 'assets/barbers/barberX.png',
  ),
  Barber(
    name: 'Braber cuts ',
    openingTime: '7:00 - 23:00',
    rating: 4.3,
    distance: '1.2',
    favorite: false,
    image: 'assets/barbers/barbercuts.png',
  ),
  Barber(
    name: 'Braber king',
    openingTime: '8:00 - 21:00',
    rating: 4.5,
    distance: '2.1',
    favorite: true,
    image: 'assets/barbers/barberking.png',
  ),
  Barber(
    name: 'Braber kong',
    openingTime: '7:00 - 22:00',
    rating: 4.7,
    distance: '2.3',
    favorite: false,
    image: 'assets/barbers/barberkong.png',
  ),
  Barber(
    name: 'top cutter',
    openingTime: '9:00 - 22:00',
    rating: 4.6,
    distance: '1.5',
    favorite: true,
    image: 'assets/barbers/topcutter.png',
  ),
];
