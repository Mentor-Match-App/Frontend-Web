import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/Mentee/screen/profile/edit_profile_mentee_screen.dart';
import 'package:my_flutter_app/Mentee/service/profile_service.dart';
import 'package:my_flutter_app/mentee/model/profile_model.dart';
import 'package:my_flutter_app/mentee/screen/notification_mentee_screen.dart';
import 'package:my_flutter_app/mentor/service/notification_service.dart';
import 'package:my_flutter_app/style/fontStyle.dart';
import 'package:my_flutter_app/widget/logo_button.dart';
import 'package:my_flutter_app/widget/menucategory.dart';
import 'package:my_flutter_app/widget/profileavatar.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileMenteeScreen extends StatefulWidget {
  ProfileMenteeScreen({Key? key}) : super(key: key);

  @override
  State<ProfileMenteeScreen> createState() => _ProfileMenteeScreenState();
}

class _ProfileMenteeScreenState extends State<ProfileMenteeScreen> {
  int _unreadNotificationsCount = 0;

  final NotificationService _notificationService = NotificationService();

  Future<void> _fetchUnreadNotificationsCount() async {
    try {
      final notifications =
          await _notificationService.fetchNotificationsForCurrentUser();
      final unreadCount =
          notifications.where((notification) => !notification.isRead!).length;
      setState(() {
        _unreadNotificationsCount = unreadCount;
      });
    } catch (e) {
      print(e); // Handle error appropriately
    }
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Tidak dapat membuka $url';
    }
  }

  @override
  void initState() {
    super.initState();
    _loadData();
    _fetchUnreadNotificationsCount();
  }

  void _loadData() async {
    final profileData = await menteeService.getMenteeProfile();
    setState(() {});
  }

  final ProfileService menteeService = ProfileService();

  void _navigateToEditProfile() async {
    final mentee = await menteeService.getMenteeProfile();

    if (!mounted) return;

    if (mentee != null && mentee.user != null) {
      List<Map<String, String>> experiencesMaps = mentee.user!.experiences!
          .where((experience) =>
              experience.isCurrentJob ==
              false) // Filter experiences where isCurrentJob is false
          .map((experience) => {
                "jobTitle": experience.jobTitle ?? '',

                "company": experience.company ?? '',
                // Add other fields as necessary
              })
          .toList();

      // Navigate to EditProfileMenteeScreen with the converted experiences
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditProfileMenteeScreen(
            linkedin: mentee.user!.linkedin ?? '',
            about: mentee.user!.about ?? '',
            location: mentee.user!.location ?? '',
            currentJob: mentee.user!.experiences
                    ?.firstWhere((element) => element.isCurrentJob == true,
                        orElse: () => ExperienceMentee())
                    .jobTitle ??
                '',
            currentCompany: mentee.user!.experiences
                    ?.firstWhere((element) => element.isCurrentJob == true,
                        orElse: () => ExperienceMentee())
                    .company ??
                '',
            experiences: experiencesMaps,
            skills: mentee.user!.skills ?? [],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle().whiteColors,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonLogoMenteeMatch(),
            Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationMenteeScreen(),
                      ),
                    ).then((_) {
                      _fetchUnreadNotificationsCount(); // Fetch the unread count when returning to this screen
                    });
                  },
                  icon: Icon(
                    Icons.notifications_none_outlined,
                    size: 30,
                  ),
                  color: ColorStyle().secondaryColors,
                ),
                if (_unreadNotificationsCount > 0)
                  Positioned(
                    right: 11,
                    top: 11,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 14,
                        minHeight: 14,
                      ),
                      child: Text(
                        '$_unreadNotificationsCount',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
      body: FutureBuilder<MenteeProfile>(
        future: menteeService.getMenteeProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final mentee = snapshot.data;

            return ListView(
              children: [
                Container(
                  height: 60,
                  color: ColorStyle().tertiaryColors,
                ),
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFf8f0f0), // #F8F0F0
                        Colors.white,
                      ],
                      stops: [0.5, 0.5],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 50,
                      right: 50,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ProfileAvatar(
                          imageUrl: mentee?.user!.photoUrl ?? '',
                          radius: 80,
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    mentee?.user!.name ?? '',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color:
                                          Colors.black, // Text color adjusted
                                    ),
                                  ),
                                  Expanded(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: _navigateToEditProfile,
                                        icon: Icon(Icons.edit),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.work_outline_outlined,
                                        size: 20,
                                        color: const Color(0xffE78938),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        mentee?.user!.experiences!
                                                .firstWhere((element) =>
                                                    element.isCurrentJob ==
                                                    true)
                                                .jobTitle ??
                                            '',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          size: 20,
                                          color: const Color(0xffE78938),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          mentee?.user!.location ?? '',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(
                                    Icons.home_work_outlined,
                                    size: 20,
                                    color: const Color(0xffE78938),
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    mentee?.user!.experiences!
                                            .firstWhere((element) =>
                                                element.isCurrentJob == true)
                                            .company ??
                                        '',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color(0xffE78938),
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            mentee?.user!.about ?? '',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xff313030),
                            ),
                          ),
                          SizedBox(height: 12),
                          SizedBox(
                            width: 200,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Color(0xffE78938), // Primary color
                                padding: EdgeInsets.symmetric(
                                  vertical: 20.0,
                                  horizontal: 34.0,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              ),
                              onPressed: () {
                                final linkedlnlink =
                                    mentee?.user!.linkedin ?? '';
                                _launchURL(linkedlnlink);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/Handoff/icon/social-icons/linkedin.png',
                                    width: 20.0,
                                    height: 20.0,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 8.0),
                                  Text(
                                    "Linkedin",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Skill",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color(0xffE78938),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: mentee?.user!.skills
                                      ?.map((skill) => SkillCard(skill: skill))
                                      .toList() ??
                                  [Text('No skills')],
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Experience",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color(0xffE78938),
                            ),
                          ),
                          SizedBox(height: 20),
                          Column(
                            children: mentee?.user!.experiences
                                    ?.where((experience) =>
                                        experience.isCurrentJob == false)
                                    .map((experience) {
                                  return ExperienceWidget(
                                    role: experience.jobTitle ?? 'No Job Title',
                                    company: experience.company ?? 'No Company',
                                  );
                                }).toList() ??
                                [Text('No experiences')],
                          ),
                        ]),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}

class SkillCard extends StatelessWidget {
  final String skill;
  SkillCard({Key? key, required this.skill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: ColorStyle().secondaryColors,
              width: 1.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(skill,
                style: FontFamily().regularText.copyWith(
                      fontSize: 14,
                    )),
          ),
        ),
      ),
    );
  }
}

class ExperienceWidget extends StatelessWidget {
  final String role;
  final String company;
  ExperienceWidget({Key? key, required this.role, required this.company})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.work_outline_outlined,
              size: 20, color: ColorStyle().primaryColors),
          SizedBox(width: 8), // Sesuaikan sesuai dengan kebutuhan Anda
          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Atur sesuai kebutuhan
            children: [
              Text(role, style: FontFamily().boldText.copyWith(fontSize: 16)),
              Text(company,
                  style: FontFamily().regularText.copyWith(fontSize: 14)),
            ],
          )
        ],
      ),
    );
  }
}
