import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/widget/card_mentor.dart';
import 'package:my_flutter_app/widget/menucategory.dart';

class DashboardMentee extends StatefulWidget {
  const DashboardMentee({super.key});

  @override
  State<DashboardMentee> createState() => _DashboardMenteeState();
}

class _DashboardMenteeState extends State<DashboardMentee> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Mentor Premium Class",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: Color(0xff0A1737),
                  fontSize: 16,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See All",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: ColorStyle().disableColors,
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  height: 350,
                  width: 250,
                  child: CardItemMentor(
                    title: "available",
                    imagePath:
                        "https://xsgames.co/randomusers/assets/avatars/female/1.jpg",
                    name: "Mentor Name",
                    job: "Job",
                    company: "Company",
                    onPressesd: () {},
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  height: 350,
                  width: 250,
                  child: CardItemMentor(
                    title: "available",
                    imagePath:
                        "https://xsgames.co/randomusers/assets/avatars/female/1.jpg",
                    name: "Mentor Name",
                    job: "Job",
                    company: "Company",
                    onPressesd: () {},
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  height: 350,
                  width: 250,
                  child: CardItemMentor(
                    title: "available",
                    imagePath:
                        "https://xsgames.co/randomusers/assets/avatars/female/1.jpg",
                    name: "Mentor Name",
                    job: "Job",
                    company: "Company",
                    onPressesd: () {},
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  height: 350,
                  width: 250,
                  child: CardItemMentor(
                    title: "available",
                    imagePath:
                        "https://xsgames.co/randomusers/assets/avatars/female/1.jpg",
                    name: "Mentor Name",
                    job: "Job",
                    company: "Company",
                    onPressesd: () {},
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  height: 350,
                  width: 250,
                  child: CardItemMentor(
                    title: "available",
                    imagePath:
                        "https://xsgames.co/randomusers/assets/avatars/female/1.jpg",
                    name: "Mentor Name",
                    job: "Job",
                    company: "Company",
                    onPressesd: () {},
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  height: 350,
                  width: 250,
                  child: CardItemMentor(
                    title: "available",
                    imagePath:
                        "https://xsgames.co/randomusers/assets/avatars/female/1.jpg",
                    name: "Mentor Name",
                    job: "Job",
                    company: "Company",
                    onPressesd: () {},
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  height: 350,
                  width: 250,
                  child: CardItemMentor(
                    title: "available",
                    imagePath:
                        "https://xsgames.co/randomusers/assets/avatars/female/1.jpg",
                    name: "Mentor Name",
                    job: "Job",
                    company: "Company",
                    onPressesd: () {},
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 26,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Mentor Premium Class",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: Color(0xff0A1737),
                  fontSize: 16,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See All",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: ColorStyle().disableColors,
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  height: 350,
                  width: 250,
                  child: CardItemMentor(
                    title: "available",
                    imagePath:
                        "https://xsgames.co/randomusers/assets/avatars/female/1.jpg",
                    name: "Mentor Name",
                    job: "Job",
                    company: "Company",
                    onPressesd: () {},
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  height: 350,
                  width: 250,
                  child: CardItemMentor(
                    title: "available",
                    imagePath:
                        "https://xsgames.co/randomusers/assets/avatars/female/1.jpg",
                    name: "Mentor Name",
                    job: "Job",
                    company: "Company",
                    onPressesd: () {},
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  height: 350,
                  width: 250,
                  child: CardItemMentor(
                    title: "available",
                    imagePath:
                        "https://xsgames.co/randomusers/assets/avatars/female/1.jpg",
                    name: "Mentor Name",
                    job: "Job",
                    company: "Company",
                    onPressesd: () {},
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  height: 350,
                  width: 250,
                  child: CardItemMentor(
                    title: "available",
                    imagePath:
                        "https://xsgames.co/randomusers/assets/avatars/female/1.jpg",
                    name: "Mentor Name",
                    job: "Job",
                    company: "Company",
                    onPressesd: () {},
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  height: 350,
                  width: 250,
                  child: CardItemMentor(
                    title: "available",
                    imagePath:
                        "https://xsgames.co/randomusers/assets/avatars/female/1.jpg",
                    name: "Mentor Name",
                    job: "Job",
                    company: "Company",
                    onPressesd: () {},
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  height: 350,
                  width: 250,
                  child: CardItemMentor(
                    title: "available",
                    imagePath:
                        "https://xsgames.co/randomusers/assets/avatars/female/1.jpg",
                    name: "Mentor Name",
                    job: "Job",
                    company: "Company",
                    onPressesd: () {},
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  height: 350,
                  width: 250,
                  child: CardItemMentor(
                    title: "available",
                    imagePath:
                        "https://xsgames.co/randomusers/assets/avatars/female/1.jpg",
                    name: "Mentor Name",
                    job: "Job",
                    company: "Company",
                    onPressesd: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
