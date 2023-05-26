// To parse this JSON data, do
//
//     final earrings = earringsFromMap(jsonString);

import 'dart:convert';

class Earrings {
  Earrings({
    required this.earring,
  });

  final Earring earring;

  factory Earrings.fromJson(String str) => Earrings.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Earrings.fromMap(Map<String, dynamic> json) => Earrings(
        earring: Earring.fromMap(json["arete"]),
      );

  Map<String, dynamic> toMap() => {
        "arete": earring.toMap(),
      };
}

class Earring {
  Earring({
    required this.available,
    required this.descripcion,
    required this.img,
    required this.material,
    required this.price,
    required this.quantity,
    required this.title,
    required this.id,
  });

  final bool available;
  final String descripcion;
  final List<String> img;
  final String material;
  final String price;
  final int quantity;
  final String title;
  final String id;
  List<String> _imgFireBase = [];

  factory Earring.fromJson(String str) => Earring.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Earring.fromMap(Map<String, dynamic> json) => Earring(
        available: json["available"],
        descripcion: json["descripcion"],
        img: List<String>.from(json["img"].map((x) => x)),
        material: json["material"],
        price: json["price"],
        quantity: json["quantity"],
        title: json["title"],
        id: json["id"].toString(),
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "descripcion": descripcion,
        "img": List<dynamic>.from(img.map((x) => x)),
        "material": material,
        "price": price,
        "quantity": quantity,
        "title": title,
        "id": id,
      };

  set imgFireBase(List<String> img) {
    _imgFireBase = img;
  }

  List<String> get imgFireBase => _imgFireBase;
}
