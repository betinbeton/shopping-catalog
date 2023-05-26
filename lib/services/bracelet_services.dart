import 'dart:convert';

import 'package:berry_catalog/global/global.dart';
import 'package:berry_catalog/models/bracelets.dart';
import 'package:berry_catalog/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BraceletsServices extends ChangeNotifier {
  final String _baseUrl = ConfigApp.baseUrl;
  final List<Bracelets> bracelets = [];
  bool isLoading = false;
  bool _show = true;

  BraceletsServices() {
    loadBracelets();
  }

  Future<List<Bracelets>> loadBracelets() async {
    _cleanBracelets();

    this.isLoading = true;
    notifyListeners();
    //TODO quitar este loading
    //Check loading
    // await Future.delayed(Duration(seconds: 10));

    final url = Uri.https(_baseUrl, 'berrys/products/pulseras.json');
    final resp = await http.get(url);
    final Map<String, dynamic> braceletsMap = json.decode(resp.body);
    braceletsMap.forEach((key, value) {
      final temp = Bracelets.fromMap(value);
      if (temp.bracelet.available) {
        //TAdding to a map
        this.bracelets.add(temp);
      }
    });
    this.isLoading = false;
    notifyListeners();
    return this.bracelets;
  }

  void _cleanBracelets() {
    this.bracelets.clear();
  }

  bool get showBracelets {
    return _show;
  }

  set showBracelets(bool show) {
    // print('pulcera' + show.toString());
    if (show) {
      _show = true;
    } else {
      _show = show;
    }
    notifyListeners();
  }
}
