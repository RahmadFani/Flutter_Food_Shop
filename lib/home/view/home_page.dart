import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_wallet/home/widgets/top_food_widget.dart';

import '../widgets/title_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        bottom: PreferredSize(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: titleHome,
            ),
            preferredSize: const Size.fromHeight(50)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Ionicons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Ionicons.grid_outline)),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: ListView(
          children: const [
            SizedBox(
              height: 16,
            ),
            TopFoodWidget()
          ],
        ),
      ),
    );
  }
}
