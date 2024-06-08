import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/widget/custombutton.dart';
import 'package:my_flutter_app/widget/form.dart';

class MenteeProfilePage extends StatefulWidget {
  const MenteeProfilePage({Key? key}) : super(key: key);

  @override
  _MenteeProfilePageState createState() => _MenteeProfilePageState();
}

class _MenteeProfilePageState extends State<MenteeProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(width: 20),
                Image.asset(
                  'Handoff/logo/LogoWeb.png',
                  height: 150,
                  width: 150,
                ),
                const SizedBox(width: 20),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Container(
                    color: Colors.white,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(150.0),
                      child: CachedNetworkImage(
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        imageUrl: 'https://picsum.photos/250?image=9',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Lengkapi Profile",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomForm(
                              title: "Your Email",
                              subtitle: "Steven@gmail.com"),
                          CustomForm(
                              title: "Your Name", subtitle: "Steven Jobs"),
                          CustomForm(title: "Job", subtitle: "Student"),
                          CustomForm(
                              title: "School/University/Company",
                              subtitle: "Enter your address"),
                          SkillForm(),
                          CustomForm(title: "Location", subtitle: "Jakarta"),
                          CustomForm(
                              title: "About", subtitle: "Tell about you"),
                          SizedBox(height: 50),
                          CustomButton(
                            buttonText: "Simpan",
                            onPressed: () {
                              // Add your custom functionality here
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
                height: 300, // Adjust the height as needed
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'Handoff/ilustrator/looking_mentor.png',
                      height: 300, // Adjust the height as needed
                      width: 300, // Adjust the width as needed
                      fit: BoxFit.cover, // Adjust the BoxFit property as needed
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
