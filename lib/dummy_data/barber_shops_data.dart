class Barber {
  String name;
  String openingTime;
  var rating;
  String distance;
  bool favorite = false;

  Barber({
    this.name,
    this.openingTime,
    this.rating,
    this.distance,
    this.favorite,
  });
}

List<Barber> barberslist = [
  Barber(
    name: 'BraberX',
    openingTime: '9:00 - 22:00',
    rating: 4.6,
    distance: '1.5',
    favorite: false,
  ),
  Barber(
    name: 'Braber cuts ',
    openingTime: '7:00 - 23:00',
    rating: 4.3,
    distance: '1.2',
    favorite: false,
  ),
  Barber(
    name: 'Braber king',
    openingTime: '8:00 - 21:00',
    rating: 4.5,
    distance: '2.1',
    favorite: true,
  ),
  Barber(
    name: 'Braber kong',
    openingTime: '7:00 - 22:00',
    rating: 4.7,
    distance: '2.3',
    favorite: false,
  ),
  Barber(
    name: 'top cutter',
    openingTime: '9:00 - 22:00',
    rating: 4.6,
    distance: '1.5',
    favorite: true,
  ),
];
