import 'package:flutter/material.dart';

class ValueNotifierView extends StatelessWidget {
  ValueNotifierView({Key? key}) : super(key: key);

  ValueNotifier<int> counter=ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ValueListenableBuilder(
              valueListenable: counter,
            builder: (context, value, child) => Text(value.toString(),style:const TextStyle(
              fontSize: 50
            ),),),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>counter.value++,
        child:const Icon(Icons.add),
      ),
    );
  }
}
