import 'package:flutter/material.dart';
import 'package:my_wallet/food_detail/food_detail.dart';
import 'package:my_wallet/home/view/home_page.dart';
import 'package:my_wallet/home/widgets/top_food_widget.dart';

part './app_routes.dart';

abstract class AppPages {
  static final Map<String, WidgetBuilder> pages = {
    Routes.INITIAL: (context) => const HomePage(),
    Routes.FOOD_DETAIL: (context) {
      assert(ModalRoute.of(context)!.settings.arguments != null &&
          ModalRoute.of(context)!.settings.arguments is FoodModel);
      final food = ModalRoute.of(context)!.settings.arguments as FoodModel;
      return FoodDetailPage(food: food);
    },
  };
}
