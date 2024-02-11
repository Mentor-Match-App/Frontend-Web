import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MentorCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String workTitle;
  final String workplace;
  final String status;

  MentorCard({
    required this.imageUrl,
    required this.name,
    required this.workTitle,
    required this.workplace,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 10), // Adjust horizontal spacing between MentorCards
      child: Card(
        color: Color(0xFFF9F1F0),
        child: Container(
          height: 520,
          width: 375,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  height: 235,
                  width: 275,
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 15),
              ListTile(
                title: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Icon(
                          Icons.work_outline_rounded,
                          size: 20,
                          color: Colors.black,
                        ),
                        SizedBox(width: 10),
                        Text(
                          workTitle,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.business_rounded,
                          size: 20,
                          color: Colors.black,
                        ),
                        SizedBox(width: 10),
                        Text(
                          workplace,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 35),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: SizedBox(
                        width: 300,
                        child: Text(
                          status,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
