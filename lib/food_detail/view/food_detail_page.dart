import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                iconTheme: const IconThemeData(color: Colors.white),
                backgroundColor: Colors.transparent,
                elevation: 0,
                bottom: PreferredSize(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      width: double.infinity,
                      child: Hero(
                        tag: 'hero_title_${food.id}',
                        child: Material(
                          type: MaterialType.transparency,
                          child: Text(food.title ?? "",
                              style: GoogleFonts.nunitoSans(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                    preferredSize: const Size.fromHeight(50)),
              )
            ],
          ),
        )
      ],
    );
  }
}
