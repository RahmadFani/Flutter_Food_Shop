import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class TopFoodWidget extends StatefulWidget {
  const TopFoodWidget({Key? key}) : super(key: key);

  @override
  State<TopFoodWidget> createState() => _TopFoodWidgetState();
}

class _TopFoodWidgetState extends State<TopFoodWidget> {
  late PageController pageController;

  double page = 0;

  @override
  void initState() {
    super.initState();

    pageController = PageController(initialPage: 0, viewportFraction: 0.9);

    pageController.addListener(() {
      setState(() {
        page = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 400,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: list.length,
        controller: pageController,
        itemBuilder: (_, index) {
          TopFoodModel food = list[index];
          final lerp = lerpDouble(1, 0, (index - page).abs())!;
          double opacity = lerpDouble(1.0, 0.0, (index - page).abs())!.abs();
          double right = lerpDouble(
              MediaQuery.of(context).size.width * .10 - 10,
              MediaQuery.of(context).size.width * .4,
              (index - page).abs())!;

          double margin = lerpDouble(0, 30, (index - page).abs())!;

          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(clipBehavior: Clip.none, children: [
              Positioned(
                  width: MediaQuery.of(context).size.width * .5,
                  right: right,
                  top: 16,
                  bottom: 16,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: margin),
                    decoration: BoxDecoration(
                      color: Color(int.parse(food.color ?? "0xffd69545")),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                          offset: Offset(16, 9),
                          blurRadius: 10,
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Opacity(
                      opacity: opacity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            food.title ?? "",
                            textAlign: TextAlign.end,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.nunitoSans(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            food.description ?? "",
                            textAlign: TextAlign.end,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.nunitoSans(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  )),
              Positioned(
                top: 30,
                right: MediaQuery.of(context).size.width * .3,
                child: Opacity(
                  opacity: opacity,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                        height: 160,
                        padding: const EdgeInsets.all(8),
                        width: 160,
                        child: Transform.scale(
                          scale: lerp,
                          child: Image.network(
                            food.image ?? "",
                            fit: BoxFit.cover,
                          ),
                        )),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 12,
                child: Opacity(
                  opacity: opacity,
                  child: Material(
                      elevation: 6,
                      color: Colors.deepOrange,
                      type: MaterialType.circle,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Ionicons.heart),
                        color: Colors.white,
                      )),
                ),
              )
            ]),
          );
        },
      ),
    );
  }
}

List<TopFoodModel> list = [
  TopFoodModel(
      id: "1",
      title: 'Taco Salad Tortilla Bowl',
      image: "https://www.pngmart.com/files/1/Taco-Salad-Tortilla-Bowl-PNG.png",
      color: "0xff3e2c91",
      description:
          "Make Amazing Taco Salad Recipes at home with these ultra-crispy Bubbly Taco Salad Bowls. Learn How To Make Tortilla Bowls just like your favorite Mexican restaurant… Without deep frying!"),
  TopFoodModel(
      id: "2",
      title: 'Habit Burger Salad',
      image: "https://www.pngmart.com/files/1/Habit-Burger-Salad-PNG.png",
      color: "0xffffaaaa",
      description:
          "Make Amazing Taco Salad Recipes at home with these ultra-crispy Bubbly Taco Salad Bowls. Learn How To Make Tortilla Bowls just like your favorite Mexican restaurant… Without deep frying!"),
  TopFoodModel(
      id: "3",
      title: 'Tobaco',
      image: "https://www.pngmart.com/files/1/Taco-Salad-Tortilla-Bowl-PNG.png",
      color: "0xff2f8f6d",
      description:
          "Make Amazing Taco Salad Recipes at home with these ultra-crispy Bubbly Taco Salad Bowls. Learn How To Make Tortilla Bowls just like your favorite Mexican restaurant… Without deep frying!"),
];

class TopFoodModel {
  String? id;
  String? title;
  String? description;
  String? image;
  String? color;

  TopFoodModel({this.id, this.title, this.description, this.image, this.color});

  TopFoodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['id'] = id;
    data['description'] = description;
    data['image'] = image;
    data['color'] = color;
    return data;
  }
}
