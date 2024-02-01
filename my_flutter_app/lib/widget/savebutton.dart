import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SaveButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildSimpanButton();
  }

  Widget _buildSimpanButton() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Add functionality for the "Simpan" button
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 8,
          ),
          child: Text(
            "Simpan",
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
          backgroundColor: Colors.orange,
          padding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 6,
          ),
        ),
      ),
    );
  }
}
