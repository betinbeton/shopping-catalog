import 'package:flutter/material.dart';

import 'package:berry_catalog/screens/screen.dart';

const String homeScreen = 'home';
const String detailEarringsScreen = 'detailEarrings';
const String detailNecklacesScreen = 'detailNecklaces';
const String detailBraceletsScreen = 'detailBracelets';
const String loadingScreen = 'loadingScreen';
const String infoScreen = 'infoScreen';
const String imgFullScreen = 'imgFullScreen';

final Map<String, WidgetBuilder> appRoutes = {
  homeScreen: (_) => const HomeScreen(),
  detailEarringsScreen: (_) => const DetailsEarringsScreen(),
  detailNecklacesScreen: (_) => const DetailsNecklacesScreen(),
  detailBraceletsScreen: (_) => const DetailsBraceletsScreen(),
  loadingScreen: (_) => const LoadingScreen(),
  infoScreen: (_) => const InfoScreen(),
  imgFullScreen: (_) => const ImgFullScreen(),
};
