import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learning/provider/theme_changer.dart';

class LearnProvider extends ChangeNotifier {
  int count = 0;

  void update() {
    count++;
    notifyListeners();
  }
}

class LearnView extends StatelessWidget {
  const LearnView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LearnProvider learn = Provider.of<LearnProvider>(context, listen: true);
    ThemeChangerProvider themeChangerProvider=Provider.of<ThemeChangerProvider>(context);
    //if the listen is false then the first one will not update but second one does;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            learn.count.toString(),
            style: const TextStyle(fontSize: 50),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () => learn.update(), child: const Text("Update")),
          const SizedBox(
            height: 50,
          ),
          Consumer<LearnProvider>(
            builder: (context, value, child) => Text(value.count.toString()),
          ),
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
