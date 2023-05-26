import 'package:flutter/material.dart';

class FilterServices extends ChangeNotifier {
  bool _all = true;
  bool _earrings = false;
  bool _necklaces = false;
  bool _bracelets = false;

  bool get showAll {
    return _all;
  }
  set showAll(bool show) {
    _all = true;
    _earrings = false;
    _necklaces = false;
    _bracelets = false;
    notifyListeners();
  }
  bool get showEarrings {
    return _earrings;
  }
  set showEarrings(bool show) {
    _all = false;
    _earrings = true;
    _necklaces = false;
    _bracelets = false;
    notifyListeners();
  }
  bool get showNecklaces {
    return _necklaces;
  }
  set showNecklaces(bool show) {
    _all = false;
    _earrings = false;
    _necklaces = true;
    _bracelets = false;
    notifyListeners();
  }
  bool get showBracelets {
    return _bracelets;
  }
  set showBracelets(bool show) {
    _all = false;
    _earrings = false;
    _necklaces = false;
    _bracelets = true;
    notifyListeners();
  }
}
