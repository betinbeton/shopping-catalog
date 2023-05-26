// To parse this JSON data, do
//
//     final contacts = contactsFromMap(jsonString);

import 'dart:convert';

class Contacts {
  Contacts({
    required this.initMsg,
    required this.phone,
    required this.whatsappUrl,
    required this.nombreMsg,
    required this.idMsg,
  });

  final String initMsg;
  final int phone;
  final String whatsappUrl;
  final String nombreMsg;
  final String idMsg;

  factory Contacts.fromJson(String str) => Contacts.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Contacts.fromMap(Map<String, dynamic> json) =>
      Contacts(initMsg: json["initMsg"], phone: json["phone"], whatsappUrl: json["whatsappUrl"], nombreMsg: json["nombreMsg"], idMsg: json["idMsg"]);

  Map<String, dynamic> toMap() => {
        "initMsg": initMsg,
        "phone": phone,
        "whatsappUrl": whatsappUrl,
        "nombreMsg": nombreMsg,
        "idMsg": idMsg,
      };
}
