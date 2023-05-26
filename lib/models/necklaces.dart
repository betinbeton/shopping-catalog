// To parse this JSON data, do
//
//     final earrings = earringsFromMap(jsonString);

import 'dart:convert';

class Necklaces {
  Necklaces({
    required this.necklace,
  });

  final Necklace necklace;

  factory Necklaces.fromJson(String str) => Necklaces.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Necklaces.fromMap(Map<String, dynamic> json) => Necklaces(
        necklace: Necklace.fromMap(json["collar"]),
      );

  Map<String, dynamic> toMap() => {
        "collar": necklace.toMap(),
      };
}

class Necklace {
  Necklace({
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

  factory Necklace.fromJson(String str) => Necklace.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Necklace.fromMap(Map<String, dynamic> json) => Necklace(
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
