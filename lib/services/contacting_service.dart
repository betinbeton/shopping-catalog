import 'dart:convert';

import 'package:berry_catalog/global/global.dart';
import 'package:berry_catalog/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ContactingService extends ChangeNotifier {
  final String _baseUrl = ConfigApp.baseUrl;
  Contacts _contacts = Contacts(initMsg: '', phone: 0, whatsappUrl: '', idMsg: '', nombreMsg: '');

  bool isLoading = false;

  ContactingService() {
    this.loadContacts();
  }

  Future<Contacts> loadContacts() async {
    //Aqui les digo a otras widgets que esten escuchando el isloading
    this.isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'berrys/contact.json');
    final resp = await http.get(url);

    final Map<String, dynamic> contactsMap = json.decode(resp.body);
    final tempContats = Contacts.fromMap(contactsMap);
    _contacts = tempContats;
    this.isLoading = false;
    notifyListeners();

    //  print(_contacts.initMsg + _contacts.phone.toString() + _contacts.whatsappUrl);

    return tempContats;
  }

  Contacts get contacts {
    return _contacts;
  }
}
