import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> skills = [];
  String newSkill = '';
  TextEditingController _skillController = TextEditingController();

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
          children: [
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  color: Colors.white,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(150.0),
                    child: Image.network(
                      'https://picsum.photos/250?image=9',
                      fit: BoxFit.cover,
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
                          _buildForm("Your Email", "Steven@gmail.com"),
                          _buildForm("Your Name", "Steven Jobs"),
                          _buildForm("Job", "Student"),
                          _buildForm("School/University/Company",
                              "Enter your address"),
                          _buildSkillForm("Skill", "Add your skill"),
                          _buildForm("Location", "Jakarta"),
                          _buildForm("About", "Tell about you"),
                          SizedBox(height: 50),
                          _buildSimpanButton(),
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

  Widget _buildForm(String title, String subtitle) {
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

  Widget _buildSkillForm(String title, String subtitle) {
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
          Row(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: TextField(
                    onChanged: (value) {
                      newSkill = value;
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          if (newSkill.isNotEmpty) {
                            setState(() {
                              skills.add(newSkill);
                              newSkill = '';
                              _skillController.clear();
                            });
                          }
                        },
                      ),
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
                    controller: _skillController,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          _buildSkillChips(),
        ],
      ),
    );
  }

  Widget _buildSkillChips() {
    return Wrap(
      spacing: 16.0,
      runSpacing: 8.0,
      children: skills.map((skill) => _buildSkillChip(skill)).toList(),
    );
  }

  Widget _buildSkillChip(String skill) {
    Color chipColor = Colors.orange; // Set the desired color for the chips
    Color deleteButtonColor =
        Colors.white; // Set the color for the delete button

    return Chip(
      labelPadding: EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 12.0,
      ), // Adjust padding as needed
      label: Text(
        skill,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 17.0, // Adjust the font size as needed
        ),
      ),
      backgroundColor: chipColor,
      deleteIconColor: deleteButtonColor,
      onDeleted: () {
        setState(() {
          skills.remove(skill);
        });
      },
    );
  }

  Widget _buildSimpanButton() {
    return Container(
      width: double.infinity, // Set the width to match the form elements
      child: ElevatedButton(
        onPressed: () {
          // Add functionality for the "Simpan" button
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 24, // Adjust the vertical padding as needed
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
            borderRadius:
                BorderRadius.circular(8.0), // Adjust the radius as needed
          ),
          backgroundColor: Colors.orange, // Set the button color to orange
          padding: EdgeInsets.symmetric(
              horizontal: 8), // Adjust the horizontal padding
        ),
      ),
    );
  }
}
