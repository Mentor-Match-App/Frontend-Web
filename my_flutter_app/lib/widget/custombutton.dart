import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;

  CustomButton({required this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return _buildCustomButton();
  }

  Widget _buildCustomButton() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 8,
          ),
          child: Text(
            buttonText,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          backgroundColor: Color(0xFFE78839),
          padding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 6,
          ),
        ),
      ),
    );
  }
}
