import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(lightTheme);

  void changeTheme() {
    state == darkTheme ? emit(lightTheme) : emit(darkTheme);
  }
}

ThemeData darkTheme = ThemeData.dark();

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0,
        actionsIconTheme: const IconThemeData(color: Color(0xff666666)),
        iconTheme: const IconThemeData(color: Color(0xff666666)),
        toolbarTextStyle: GoogleFonts.nunitoSans(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600)));
