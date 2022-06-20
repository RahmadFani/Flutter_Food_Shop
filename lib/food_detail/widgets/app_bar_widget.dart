import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_wallet/home/widgets/top_food_widget.dart';

class FoodDetailAppBarWidget extends StatefulWidget {
  const FoodDetailAppBarWidget({Key? key, required this.food})
      : super(key: key);

  final FoodModel food;

  @override
  State<FoodDetailAppBarWidget> createState() => _FoodDetailAppBarWidgetState();
}

class _FoodDetailAppBarWidgetState extends State<FoodDetailAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      actionsIconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Ionicons.search)),
        IconButton(onPressed: () {}, icon: const Icon(Ionicons.grid_outline)),
        const SizedBox(
          width: 10,
        )
      ],
      bottom: PreferredSize(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: Hero(
              tag: 'hero_title_${widget.food.id}',
              child: Material(
                type: MaterialType.transparency,
                child: Text(widget.food.title ?? "",
                    style: GoogleFonts.nunitoSans(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ),
          preferredSize: const Size.fromHeight(50)),
    );
  }
}
