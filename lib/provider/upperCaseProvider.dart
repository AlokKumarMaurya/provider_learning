import 'package:flutter/cupertino.dart';

class UpperCaseProvider extends ChangeNotifier {
  String name = "Alok";

  void changeCase() {
    name = name.toUpperCase();
    notifyListeners();
    Future.delayed(const Duration(seconds: 5)).then((value) {
      name = name.toLowerCase();
      notifyListeners();
    });

  }
}
