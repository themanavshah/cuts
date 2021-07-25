import 'package:flutter/material.dart';

class Product {
  int price;
  String name;
  int id;
  bool choosen = false;
  Icon icon;
  Product({
    this.choosen,
    this.id,
    this.name,
    this.price,
    this.icon,
  });
}

List<Product> productsList = [
  Product(
    price: 100,
    name: "Hair cutting",
    id: 4837434,
    icon: Icon(
      Icons.cut_sharp,
      color: Colors.orange,
    ),
    choosen: false,
  ),
  Product(
    price: 40,
    name: "Beard trimming",
    id: 3959345,
    icon: Icon(
      Icons.history_edu_sharp,
      color: Colors.orange,
    ),
    choosen: false,
  ),
  Product(
    price: 60,
    name: "Shaving",
    id: 4894434,
    icon: Icon(
      Icons.face_rounded,
      color: Colors.orange,
    ),
    choosen: false,
  ),
  Product(
    price: 250,
    name: "Coloring",
    id: 2084346,
    icon: Icon(
      Icons.face_unlock_outlined,
      color: Colors.orange,
    ),
    choosen: false,
  ),
  Product(
    price: 20,
    name: "Hair wash",
    id: 935739,
    icon: Icon(
      Icons.water_damage_outlined,
      color: Colors.orange,
    ),
    choosen: false,
  ),
  Product(
    price: 100,
    name: "Man facial",
    id: 0248922,
    icon: Icon(
      Icons.face_retouching_natural,
      color: Colors.orange,
    ),
    choosen: false,
  ),
];
