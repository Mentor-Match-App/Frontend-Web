import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/style/color_style.dart';

class FontFamily {
  TextStyle titleText = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 40,
    color: ColorStyle().secondaryColors,
  );

  TextStyle regulerText = GoogleFonts.poppins(
      fontWeight: FontWeight.w300,
      fontSize: 18,
      color: ColorStyle().blackColors);
}
