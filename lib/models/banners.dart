// To parse this JSON data, do
//
//     final banners = bannersFromMap(jsonString);

import 'dart:convert';

class Banners {
      final BannerApp bannerApp;
    Banners({
        required this.bannerApp,
    });



    factory Banners.fromJson(String str) => Banners.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Banners.fromMap(Map<String, dynamic> json) => Banners(
        bannerApp: BannerApp.fromMap(json["bannerApp"]),
    );

    Map<String, dynamic> toMap() => {
        "bannerApp": bannerApp.toMap(),
    };
}

class BannerApp {
    BannerApp({
        required this.bannerName,
        required this.duration,
        this.imgPath,
        required this.order,
        required this.subTitle,
        required this.title,
        required this.show
    });

    final String bannerName;
    final String duration;
    final String? imgPath;
    final int order;
    final String subTitle;
    final String title;
    final bool show;

    factory BannerApp.fromJson(String str) => BannerApp.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory BannerApp.fromMap(Map<String, dynamic> json) => BannerApp(
        bannerName: json["bannerName"],
        duration: json["duration"],
        imgPath: json["imgPath"],
        order: json["order"],
        subTitle: json["subTitle"],
        title: json["title"],
        show: json["show"]
    );

    Map<String, dynamic> toMap() => {
        "bannerName": bannerName,
        "duration": duration,
        "imgPath": imgPath,
        "order": order,
        "subTitle": subTitle,
        "title": title,
        "show": show,
    };
}
