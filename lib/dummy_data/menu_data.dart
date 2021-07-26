import 'package:flutter/material.dart';

class Menu {
  String name;
  int id;
  Icon icon;
  Menu({
    this.id,
    this.name,
    this.icon,
  });
}

List<Menu> menuList = [
  Menu(
    name: "profile",
    id: 037562,
    icon: Icon(
      Icons.person_outline_rounded,
      color: Colors.orange,
      size: 28,
    ),
  ),
  Menu(
    name: "Favorite",
    id: 105739,
    icon: Icon(
      Icons.star_border_rounded,
      color: Colors.orange,
      size: 28,
    ),
  ),
  Menu(
    name: "cut's barber points",
    id: 027424,
    icon: Icon(
      Icons.theater_comedy,
      color: Colors.orange,
      size: 28,
    ),
  ),
  Menu(
    name: "blockchain details",
    id: 544543,
    icon: Icon(
      Icons.account_tree_rounded,
      color: Colors.orange,
      size: 28,
    ),
  ),
  Menu(
    name: "Offers/discounts",
    id: 027364,
    icon: Icon(
      Icons.local_offer_outlined,
      color: Colors.orange,
      size: 28,
    ),
  ),
  Menu(
    name: "About",
    id: 027412,
    icon: Icon(
      Icons.all_inbox_outlined,
      color: Colors.orange,
      size: 28,
    ),
  ),
];
