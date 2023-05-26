import 'dart:convert';

import 'package:berry_catalog/global/global.dart';
import 'package:berry_catalog/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NecklacesServices extends ChangeNotifier {
  final String _baseUrl = ConfigApp.baseUrl;
  final List<Necklaces> necklaces = [];
  bool isLoading = false;
  bool _show = true;

  NecklacesServices() {
    loadNecklaces();
  }

  Future<List<Necklaces>> loadNecklaces() async {
    _cleanNecklaces();

    this.isLoading = true;
    notifyListeners();
    //TODO quitar este loading
    //Check loading
    // await Future.delayed(Duration(seconds: 10));

    final url = Uri.https(_baseUrl, 'berrys/products/collares.json');
    final resp = await http.get(url);

    final Map<String, dynamic> necklacesMap = json.decode(resp.body);
    necklacesMap.forEach((key, value) {
      final temp = Necklaces.fromMap(value);

      if (temp.necklace.available) {
        //Adding to a map
        this.necklaces.add(temp);
      }
    });
    this.isLoading = false;
    notifyListeners();

    // print(earrings[0].earring.title);

    return this.necklaces;
  }

  void _cleanNecklaces() {
    this.necklaces.clear();
  }

  bool get showNecklaces {
    return _show;
  }

  set showNecklaces(bool show) {
    // print('collar' + show.toString());
    if (show) {
      _show = true;
    } else {
      _show = show;
    }
    notifyListeners();
  }
}
