import 'dart:convert';

import 'package:berry_catalog/global/global.dart';
import 'package:berry_catalog/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EarringsServices extends ChangeNotifier {
  final String _baseUrl = ConfigApp.baseUrl;
  final List<Earrings> earrings = [];
  bool isLoading = false;
  bool _show = true;

  EarringsServices() {
    loadEarrings();
  }

  Future<List<Earrings>> loadEarrings() async {
    _cleanEarrings();

    this.isLoading = true;
    notifyListeners();
    //TODO quitar este loading
    //Check loading
    // await Future.delayed(Duration(seconds: 10));

    final url = Uri.https(_baseUrl, 'berrys/products/aretes.json');
    final resp = await http.get(url);
    final Map<String, dynamic> earringsMap = json.decode(resp.body);
    earringsMap.forEach((key, value) {
      final temp = Earrings.fromMap(value);
      if (temp.earring.available) {
        //TAdding to a map
        this.earrings.add(temp);
      }
    });
    this.isLoading = false;
    notifyListeners();

    // print(earrings[0].earring.title);

    return this.earrings;
  }

  void _cleanEarrings() {
    this.earrings.clear();
  }

  bool get showEarrings {
    return _show;
  }

  set showEarrings(bool show) {
    // print(show);
    if (show) {
      _show = true;
    } else {
      _show = show;
    }
    notifyListeners();
  }
}
