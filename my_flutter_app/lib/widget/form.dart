import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomForm extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomForm({
    required this.title,
    required this.subtitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color filledColor = Color.fromRGBO(249, 240, 241, 1.0);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: double.infinity,
            child: TextField(
              decoration: InputDecoration(
                hintText: subtitle,
                fillColor: filledColor,
                filled: true,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 12.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
