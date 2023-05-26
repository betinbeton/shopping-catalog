import 'dart:convert';

import 'package:berry_catalog/global/global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:berry_catalog/models/models.dart';

class BannerService extends ChangeNotifier {
   final String _baseUrl = ConfigApp.baseUrl;
 // final token = 'AIzaSyDNiNBG_clEQVF0ABDsk4UD2MetnWZXLU4';
  final List<BannerApp> banners = [];
  bool isLoading = false;

  BannerService() {
    loadBanners();
  }
  Future<List<BannerApp>> loadBanners() async {
    //clean the list
    _cleanBanners();
    //Aqui les digo a otras widgets que esten escuchando el isloading
    isLoading = true;
    notifyListeners();
    //Check loading
    //await Future.delayed(Duration(seconds: 2));

    final url = Uri.https(_baseUrl, 'berrys/banners.json');
    final resp = await http.get(url);

    final Map<String, dynamic> bannersMap = json.decode(resp.body);
    // print(bannersMap);
    //key NRjIaL7cvl3sQnDKBlq value es la data
    bannersMap.forEach((key, value) {
      final tempBanner = BannerApp.fromMap(value["bannerApp"]);
      //Adding to a general map
      banners.add(tempBanner);
    });

    //Cuando terminamos de traer todos los datos, ponemos el isloading en false, ya termino la carga de datos.
    isLoading = false;
    notifyListeners();

    return banners;
  }

  void _cleanBanners() {
    banners.clear();
  }
}




