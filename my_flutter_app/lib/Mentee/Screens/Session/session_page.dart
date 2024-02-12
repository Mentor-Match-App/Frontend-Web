import 'package:flutter/material.dart';
import 'package:my_flutter_app/widget/searchbar.dart';
import 'package:my_flutter_app/widget/navbaruser.dart';
import 'package:my_flutter_app/widget/mentorcard.dart';
import 'package:my_flutter_app/widget/menucategory.dart';
import 'package:my_flutter_app/widget/footer.dart';

class SessionPage extends StatefulWidget {
  const SessionPage({Key? key}) : super(key: key);

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: NavbarWidgetUser(),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(55),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SearchBarWidget(
                  title: 'Search by name, role, company',
                  onPressed: () {},
                ),
                SizedBox(
                  height: 100,
                  child: Center(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 55.0),
                          child: CustomCategoryWidget(
                            text: categoryList[index],
                            img: getCategoryImage(index),
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const FirstScreen(),
                              //   ),
                              // );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Center(
                    child: Column(
                      children: List.generate(3, (index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(3, (cardIndex) {
                                final mentorIndex = index * 3 + cardIndex + 1;
                                return MentorCard(
                                  imageUrl: 'Handoff/ilustrator/profile.png',
                                  name: 'Mentor $mentorIndex',
                                  workTitle: 'Job Title $mentorIndex',
                                  workplace: 'Workplace $mentorIndex',
                                  status: 'Available',
                                );
                              }),
                            ),
                            SizedBox(
                                height: 16.0), // Add space between MentorCards
                          ],
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
          FooterWidget(), //
        ],
      ),
    );
  }

  String getCategoryImage(int index) {
    List<String> imagePaths = [
      'Handoff/icon/categoryIcon/Karier/all.png',
      'Handoff/icon/categoryIcon/Karier/Back_End.png',
      'Handoff/icon/categoryIcon/Karier/data_analys.png',
      'Handoff/icon/categoryIcon/Karier/design.png',
      'Handoff/icon/categoryIcon/Karier/finance.png',
      'Handoff/icon/categoryIcon/Karier/Front_End.png',
      'Handoff/icon/categoryIcon/Karier/marketing.png',
      'Handoff/icon/categoryIcon/Karier/Quality_Assurance.png',
      'Handoff/icon/categoryIcon/Karier/Security_Engineer.png',
    ];

    if (index >= 0 && index < imagePaths.length) {
      return imagePaths[index];
    } else {
      return 'assets/Handoff/icon/categoryIcon/SD/all.png';
    }
  }

  List<String> categoryList = [
    "All Mentor",
    "BE Engineer",
    "Data Analys",
    "Design",
    "Finance",
    "FE Engineer",
    "Marketing",
    "QA Engineer",
    "Security Engineer",
  ];
}
