import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorStyle {
  Color primaryColors = const Color(0xffE78938);
  Color secondaryColors = const Color(0xff0A1737);
  Color tertiaryColors = const Color(0xffF8F1F1);
  Color textColors = const Color(0xff313030);
  Color blackColors = const Color(0xff000000);
  Color whiteColors = const Color(0xffFFFFFF);
  Color disableColors = const Color (0xff949090);
  Color errorColors = const Color(0xffC51818);
  Color succesColors = const Color (0xff27D024);
    Color pendingColors = const Color (0xffF1DA0D);
    Color fullbookedColors = const Color (0xff5D5FEF);  
}

class FontFamily {
  TextStyle titleText = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 20,
    color: ColorStyle().secondaryColors,
  );
  TextStyle buttonText = GoogleFonts.poppins(
    fontWeight: FontWeight.w300,
    fontSize: 14,
    color: ColorStyle().whiteColors,
  );
  TextStyle regularText = GoogleFonts.poppins(
    fontWeight: FontWeight.w300,
    fontSize: 14,
    color: ColorStyle().textColors,
  );
  TextStyle boldText = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: ColorStyle().textColors,
  );
}

class CustomCategoryWidget extends StatelessWidget {
  final String text;
  final String img;
  final VoidCallback? onTap;

  CustomCategoryWidget({required this.text, required this.img, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            width: 40,
            child: Image.asset(img),
          ),
          const SizedBox(height: 4),
          Text(text, style: FontFamily().regularText),
        ],
      ),
    );
  }
}
