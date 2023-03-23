import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeChangerProvider extends ChangeNotifier{

  ThemeMode _themeMode=ThemeMode.light;

  ThemeMode get themeMode=>_themeMode;


  changeTheme({required ThemeMode themeMode}){
    _themeMode=themeMode;
    notifyListeners();
  }

}


class ThemeChangerView extends StatelessWidget {
  const ThemeChangerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeChangerProvider themeChangerProvider=Provider.of<ThemeChangerProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () =>
                  themeChangerProvider.changeTheme(themeMode:ThemeMode.dark),
              child: const Text("Change theme to Dark")),
          ElevatedButton(
              onPressed: () =>
                  themeChangerProvider.changeTheme(themeMode:ThemeMode.light),
              child: const Text("Change theme to light")),
        ],
      ),
    );
  }
}
