import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_wallet/food_detail/widgets/app_bar_widget.dart';
import 'package:my_wallet/home/widgets/top_food_widget.dart';

class FoodDetailPage extends StatelessWidget {
  const FoodDetailPage({Key? key, required this.food}) : super(key: key);

  final FoodModel food;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Hero(
            tag: 'hero_background_${food.id}',
            child: Container(color: Color(int.parse(food.color ?? "0xff")))),
        Positioned(
            top: MediaQuery.of(context).size.width * .5,
            right: 30,
            width: MediaQuery.of(context).size.width * .5,
            height: MediaQuery.of(context).size.width * .5,
            child: Hero(
              tag: 'hero_image_${food.id}',
              child: Stack(children: [
                Opacity(
                    child: Image.network(food.image ?? "", color: Colors.black),
                    opacity: 0.5),
                ClipRect(
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 15.0),
                        child: Image.network(
                          food.image ?? "",
                        )))
              ]),
            )),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: [FoodDetailAppBarWidget(food: food)],
          ),
        )
      ],
    );
  }
}
