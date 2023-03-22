import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'consumerProvider.dart';

class ConsumerProviderView extends StatelessWidget {
  const ConsumerProviderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<ConsumerProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          Consumer<ConsumerProvider>(
            builder: (context, value, child) => Text(value.count.toString()),
          ),
          ElevatedButton(
              onPressed: () => provider.increment(), child: Text("update"))
        ],
      ),
    );
  }
}
