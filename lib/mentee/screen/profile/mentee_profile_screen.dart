import 'package:flutter/material.dart';
import 'package:my_flutter_app/Mentee/screen/profile/edit_profile_mentee_screen.dart';
import 'package:my_flutter_app/Mentee/service/profile_service.dart';
import 'package:my_flutter_app/login/login_screen.dart';
import 'package:my_flutter_app/mentee/model/profile_model.dart';
import 'package:my_flutter_app/style/text.dart';
import 'package:my_flutter_app/widget/category_card.dart';
import 'package:my_flutter_app/widget/experiencewidget.dart';
import 'package:my_flutter_app/widget/menucategory.dart';
import 'package:my_flutter_app/widget/profileavatar.dart';
import 'package:my_flutter_app/widget/show_dialog_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../preferences/ preferences_helper.dart';

class ProfileMenteeScreen extends StatefulWidget {
  ProfileMenteeScreen({Key? key}) : super(key: key);

  @override
  State<ProfileMenteeScreen> createState() => _ProfileMenteeScreenState();
}

class _ProfileMenteeScreenState extends State<ProfileMenteeScreen> {
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
  }

  void _loadData() async {
    final profileData = await menteeService.getMenteeProfile();
    setState(() {});
  }

  final ProfileService menteeService = ProfileService();

  void _navigateToEditProfile() async {
    final mentee = await menteeService
        .getMenteeProfile(); // Assuming you fetch the mentee profile here

    if (!mounted) return; // Check if the widget is still in the widget tree

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
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/Handoff/logo/LogoMobile.png'),
            IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => NotificationMenteeScreen(),
                //   ),
                // );
              },
              icon: Icon(Icons.notifications_none_outlined),
              color: ColorStyle().secondaryColors,
            )
          ],
        ),
      ),
      body: FutureBuilder<MenteeProfile>(
        future: menteeService
            .getMenteeProfile(), // Call the asynchronous fetchMentee method here
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.20,
                      decoration: BoxDecoration(
                          color: ColorStyle()
                              .tertiaryColors // Warna latar belakang yang diinginkan
                          ),
                    ),
                    Transform.translate(
                      offset: Offset(0.0, -120 / 2.0),
                      child: Center(
                        child: Column(
                          children: [
                            ProfileAvatar(
                              imageUrl: mentee?.user!.photoUrl ?? '',
                            ),
                            SizedBox(
                              height:
                                  40, // Adjust the height to ensure enough space for the Stack
                              child: Stack(
                                children: [
                                  Center(
                                    child: Text(
                                      mentee!.user?.name ?? '',
                                      style: FontFamily().boldText.copyWith(
                                            fontSize: 16,
                                          ),
                                    ),
                                  ),
                                  Positioned(
                                      right: 0,
                                      top:
                                          0, // Adjust as needed to position the edit icon correctly
                                      child: IconButton(
                                        icon: Icon(Icons.edit),
                                        onPressed: _navigateToEditProfile,
                                      )),
                                ],
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                // Check if there are experiences and if any of them is marked as a current job.
                                var hasCurrentJob = mentee.user?.experiences
                                        ?.any((element) =>
                                            element.isCurrentJob == true) ??
                                    false;

                                // Only display the Row widget if there is a current job experience.
                                if (hasCurrentJob) {
                                  var currentExperience =
                                      mentee.user!.experiences!.firstWhere(
                                    (element) => element.isCurrentJob == true,
                                  );

                                  String jobTitle =
                                      currentExperience.jobTitle ??
                                          "No Job Title";
                                  String company =
                                      currentExperience.company ?? "No Company";

                                  return Center(
                                    child: Row(
                                      mainAxisSize: MainAxisSize
                                          .min, // Ensures the Row only takes up necessary space
                                      children: [
                                        Icon(
                                          Icons.work,
                                          color: ColorStyle().primaryColors,
                                        ),
                                        SizedBox(
                                            width:
                                                8), // Provides a small gap between the icon and the text
                                        Text(
                                          "$jobTitle at $company",
                                          style: FontFamily().regularText,
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  // Return an empty Container if there's no current job experience.
                                  return Container();
                                }
                              },
                            ),

// For Location Information Row
                            Center(
                              child: Row(
                                mainAxisSize: MainAxisSize
                                    .min, // This ensures the Row only takes up necessary space
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: ColorStyle().primaryColors,
                                  ),
                                  SizedBox(
                                      width:
                                          8), // Provides a small gap between the icon and the text
                                  Text(
                                    mentee.user?.location ?? '',
                                    style: FontFamily().regularText,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TitleProfile(
                                  title: "About",
                                  color: ColorStyle().primaryColors,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Text(
                                    mentee.user?.about ?? '',
                                    style: FontFamily().regularText,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 12.0, top: 8.0),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      width: 120,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: ColorStyle().primaryColors,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: TextButton.icon(
                                        style: TextButton.styleFrom(
                                          primary: ColorStyle().whiteColors,
                                        ),
                                        onPressed: () {
                                          final linkedlnlink =
                                              mentee?.user!.linkedin ?? '';
                                          _launchURL(linkedlnlink);
                                        },
                                        icon: Icon(Icons.link),
                                        label: Text('Linkedln',
                                            style: FontFamily()
                                                .regularText
                                                .copyWith(
                                                  color:
                                                      ColorStyle().whiteColors,
                                                )),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TitleProfile(
                                    title: 'Experience',
                                    color: ColorStyle().primaryColors,
                                  ),
                                  Column(
                                    children: mentee.user!.experiences
                                            ?.where((experience) =>
                                                experience.isCurrentJob ==
                                                false)
                                            .map((experience) {
                                          return ExperienceWidget(
                                            role: experience.jobTitle ??
                                                'No Job Title',
                                            company: experience.company ??
                                                'No Company',
                                          );
                                        }).toList() ??
                                        [
                                          Text('No experiences')
                                        ], // Jika tidak ada pengalaman atau list kosong, tampilkan 'No experiences'
                                  )
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TitleProfile(
                                title: 'Skills',
                                color: ColorStyle().primaryColors,
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: mentee.user!.skills
                                          ?.map((skill) => SkillCard(
                                                skill: skill,
                                              ))
                                          .toList() ??
                                      [Text('No skills')]),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton.icon(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CustomConfirmationDialog(
                                        aksi: 'Keluar',
                                        aksi2: 'Batal',
                                        title: "Konfirmasi",
                                        content:
                                            "Apakah kamu yakin ingin keluar dari aplikasi MentorMatch?",
                                        onConfirm: () async {
                                          // Tulis logika logout Anda di sini
                                          // Misalnya, membersihkan shared preferences dan navigasi ke halaman login
                                          await UserPreferences
                                              .clearPreferences();
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen()),
                                            (Route<dynamic> route) => false,
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                                icon: Icon(Icons.logout,
                                    color: ColorStyle().secondaryColors),
                                label: Text(
                                  'Logout',
                                  style: FontFamily().regularText.copyWith(
                                      color: ColorStyle().secondaryColors),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
