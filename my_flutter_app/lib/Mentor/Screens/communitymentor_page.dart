import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/widget/footer.dart';
import 'package:my_flutter_app/widget/searchbar.dart';
import 'package:my_flutter_app/widget/navbaruser.dart';
import 'package:my_flutter_app/widget/mentorcard.dart';
import 'package:url_launcher/url_launcher.dart';

class CommunityMentorPage extends StatelessWidget {
  final List<String> communityImages = [
    'Handoff/communityLogo/Flutter.png',
    'Handoff/communityLogo/HTMLCSS.png',
    'Handoff/communityLogo/JS.png',
    'Handoff/communityLogo/Kotlin.png',
    'Handoff/communityLogo/Python.png',
    'Handoff/communityLogo/UIUX.png',
  ];

  final List<String> communityNames = [
    'FlutterXperience \nCommunity',
    'HTMLCSS Innovate \nNetwork',
    'ReactXperience \nCommunity',
    'Kotlin Innovate \nCommunity',
    'Python.org \nForum',
    'UIUXXperience \nCommunity',
  ];

  // List of links corresponding to each community
  final List<String> communityLinks = [
    'https://t.me/flutter_community_link',
    'https://t.me/htmlcss_community_link',
    'https://t.me/react_community_link',
    'https://t.me/kotlin_community_link',
    'https://t.me/python_community_link',
    'https://t.me/uiux_community_link',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: NavbarWidgetMentor(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 150, vertical: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mari bergabung di dalam Komunitas kami',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: 28),
                        Text(
                          'Dengan bergabung kedalam komunitas kamu akan mendapatkan banyak pengetahuan dan dapat berinteraksi dengan sesama rekan ataupun mentor kamu',
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w200,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 80),
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: SizedBox(
                        width: 202.12,
                        child: Image.asset(
                          'Handoff/ilustrator/community.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 150, vertical: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Choose a community, find support, and achieve success together',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 35),
                      SearchBarWidget(
                        title: 'Search by name of community',
                        onPressed: () {},
                      ),
                      SizedBox(height: 35),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children:
                              List.generate(communityImages.length, (index) {
                            return MentorCard(
                              imageUrl: communityImages[index],
                              name: communityNames[index],
                              status: 'Join Community',
                              onStatusTap: () async {
                                // Use the url_launcher package to open the corresponding link
                                final url = communityLinks[index];
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 28),
            FooterWidget(),
          ],
        ),
      ),
    );
  }
}
