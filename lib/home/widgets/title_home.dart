import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget get titleHome => RichText(
        text: TextSpan(children: [
      TextSpan(
          text: 'Break',
          style: GoogleFonts.nunitoSans(
              color: const Color(0xff666666),
              fontSize: 24,
              fontWeight: FontWeight.w600)),
      TextSpan(
          text: 'fast',
          style: GoogleFonts.nunitoSans(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold))
    ]));
