import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingSessionPopupMenu extends StatelessWidget {
  const BookingSessionPopupMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 55.0,
            horizontal: 55.0,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Booking Session",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 32,
                  color: Color(0xffE78938),
                ),
              ),
              SizedBox(height: 35),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Mastering Modern Web Development with Node.js and React",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 55),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: Colors.orange,
                      ),
                      SizedBox(width: 15),
                      Text(
                        "24 November 2024",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                      Spacer(), // Uses Spacer to push the following text to the right.
                      Text(
                        "14:00 WIB",
                        style: GoogleFonts.poppins(
                          color: Colors.orange,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 55),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Color(0xffE78938),
                          ), // Border color
                          padding: EdgeInsets.symmetric(
                            vertical: 35.0,
                            horizontal: 135.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        child: Text(
                          "Batal",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 32,
                            color: Color(0xffE78938),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 45,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Kirim button functionality
                          // Add your logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Color(0xffE78938), // Background color
                          padding: EdgeInsets.symmetric(
                            vertical: 35.0,
                            horizontal: 135.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        child: Text(
                          "Booking",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 32,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
