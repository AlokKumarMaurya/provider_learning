import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learning/provider/counter_provider.dart';
import 'package:provider_learning/provider/upperCaseProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UpperCaseProvider(),
      child: const MaterialApp(
        home: CaseChanger(),
      ),
    );
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
