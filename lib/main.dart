import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learning/provider/counter_provider.dart';
import 'package:provider_learning/provider/learn.dart';
import 'package:provider_learning/provider/theme_changer.dart';
import 'package:provider_learning/provider/upperCaseProvider.dart';
import 'package:provider_learning/provider/valueNotifier.dart';
import 'package:provider_learning/usingConsumer/consumerProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //for multiple provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ConsumerProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UpperCaseProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LearnProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeChangerProvider(),
        )
      ],
      child: Builder(
        builder: (context) {
          final ThemeChangerProvider themeChangerProvider=Provider.of<ThemeChangerProvider>(context);
          return  MaterialApp(
            darkTheme: ThemeData.dark(),
            themeMode: themeChangerProvider.themeMode,
            home:  ValueNotifierView(),
          );
        }
      ),
    );

    //this is for the single prvider
    /* ChangeNotifierProvider(
        create: (context) => ConsumerProvider(),
        child: const MaterialApp(
          home: ConsumerProviderView(),
        ),
      );*/
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CounterProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            countProvider.count.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => countProvider.setCount(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CaseChanger extends StatelessWidget {
  const CaseChanger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chaseProvider = Provider.of<UpperCaseProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text(chaseProvider.name),
          ),
          ElevatedButton(
              onPressed: () => chaseProvider.changeCase(),
              child: const Text("Chnage case"))
        ],
      ),
    );
  }
}
