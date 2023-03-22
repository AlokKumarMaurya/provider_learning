import 'package:flutter/cupertino.dart';

class ConsumerProvider extends ChangeNotifier{

  int count=0;

  void increment(){
    count++;
    notifyListeners();
  }
}