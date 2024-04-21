import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_flutter_app/mentee/model/session_model.dart';
import 'package:my_flutter_app/mentee/screen/session/detail_booking_session_screen.dart';
import 'package:my_flutter_app/mentee/service/bookSessionService/bookSesion.dart';
import 'package:my_flutter_app/preferences/%20preferences_helper.dart';
import 'package:my_flutter_app/widget/menucategory.dart';
import 'package:my_flutter_app/widget/navbaruser.dart';
import 'package:my_flutter_app/widget/profileavatar.dart';
import 'package:my_flutter_app/widget/reviewwidget.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailMentorSessionScreen extends StatefulWidget {
  final Mentor detailmentor;
  final int availableSlots;
  final int totalParticipants;
  final List<MentorReview> mentorReviews;

  DetailMentorSessionScreen(
      {Key? key,
      required this.totalParticipants,
      required this.availableSlots,
      required this.detailmentor,
      required this.mentorReviews})
      : super(key: key);

  @override
  State<DetailMentorSessionScreen> createState() =>
      _DetailMentorSessionScreenState();
}

class _DetailMentorSessionScreenState extends State<DetailMentorSessionScreen> {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Tidak dapat membuka $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final mentorDetail = widget.detailmentor;

    DateTime? parsedJadwal;
    if (mentorDetail.session != null && mentorDetail.session!.isNotEmpty) {
      parsedJadwal = DateTime.parse(mentorDetail.session!.first.dateTime!);
    }
    final DateFormat formatOutput = DateFormat("HH:mm");
    final String formattedStartTime = formatOutput
        .format(DateTime.parse(mentorDetail.session!.first.startTime!));
    final String formattedEndTime = formatOutput
        .format(DateTime.parse(mentorDetail.session!.first.endTime!));

    String formattedJadwal = parsedJadwal != null
        ? DateFormat('dd MMMM yyyy').format(parsedJadwal)
        : "No scheduled session";

    return Scaffold(
      backgroundColor: ColorStyle().whiteColors,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: NavbarWidgetMentee(),
      ),
      body: ListView(
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
                    imageUrl: mentorDetail.photoUrl,
                    radius: 80,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mentorDetail.name ?? "",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.black, // Text color adjusted
                          ),
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
                                  mentorDetail.experiences
                                          ?.firstWhere(
                                              (element) =>
                                                  element.isCurrentJob == true,
                                              orElse: () => Experience())
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
                                    mentorDetail.location ?? "",
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
                              mentorDetail.experiences
                                      ?.firstWhere(
                                          (element) =>
                                              element.isCurrentJob == true,
                                          orElse: () => Experience())
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

          // Red and Orange Sections side by side
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width / 2,
                padding: EdgeInsets.all(55.0),
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
                      mentorDetail.about ?? "",
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
                          backgroundColor: Color(0xffE78938), // Primary color
                          padding: EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 34.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                        onPressed: () {
                          final linkedlnlink = mentorDetail.linkedin ?? '';
                          _launchURL(linkedlnlink);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'Handoff/icon/social-icons/linkedin.png',
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
                        children: mentorDetail.skills!
                            .map((skill) => SkillCard(skill: skill))
                            .toList(),
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
                      children: mentorDetail.experiences?.map((experience) {
                            return ExperienceWidget(
                              role: experience.jobTitle ?? 'No Job Title',
                              company: experience.company ?? 'No Company',
                            );
                          }).toList() ??
                          [Text('No experiences')],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Review",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Color(0xffE78938),
                      ),
                    ),
                    SizedBox(height: 10),
                    // list of ReviewWidget
                    buildReviewWidgets(),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width / 2,
                padding: EdgeInsets.all(55),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Jadwal Session",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color(0xffE78938),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: mentorDetail.session != null &&
                              mentorDetail.session!.isNotEmpty
                          ? Column(
                              children: mentorDetail.session!.map((session) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 40),
                                  child: Container(
                                    width: 600,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: ColorStyle().tertiaryColors,
                                            blurRadius: 4,
                                            spreadRadius: 4,
                                            offset:
                                                Offset(0, 4), // Shadow position
                                          ),
                                        ],
                                        color: Colors.white,

                                        // border radius
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Padding(
                                        padding: const EdgeInsets.all(32.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.tag,
                                                  size: 40,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Flexible(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Topic",
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 14,
                                                          color:
                                                              Color(0xffE78938),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        session.title ?? "",
                                                        overflow: TextOverflow
                                                            .visible,
                                                        softWrap: true,
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.access_time,
                                                  size: 40,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Flexible(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Time",
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 14,
                                                          color:
                                                              Color(0xffE78938),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        formattedJadwal +
                                                            " " +
                                                            formattedStartTime +
                                                            " - " +
                                                            formattedEndTime,
                                                        overflow: TextOverflow
                                                            .visible,
                                                        softWrap: true,
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  size: 40,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Flexible(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Location",
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 14,
                                                          color:
                                                              Color(0xffE78938),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "Zoom Meeting",
                                                        overflow: TextOverflow
                                                            .visible,
                                                        softWrap: true,
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.person_add_alt_1,
                                                  size: 40,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Flexible(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Available Slot",
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 14,
                                                          color:
                                                              Color(0xffE78938),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        widget.availableSlots
                                                            .toString(),
                                                        overflow: TextOverflow
                                                            .visible,
                                                        softWrap: true,
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 40,
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: SizedBox(
                                                width: double.maxFinite,
                                                child: TextButton(
                                                  style: TextButton.styleFrom(
                                                    backgroundColor: Color(
                                                        0xffE78938), // Primary color
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      vertical: 20.0,
                                                      horizontal: 34.0,
                                                    ),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    _showDialog(context);
                                                  },
                                                  child: Text(
                                                    "Booking Session",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                );
                              }).toList(),
                            )
                          : Center(
                              child: Text(
                                'Belum ada program',
                                style: FontFamily().regularText,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showDialog(BuildContext context) {
    final mentorDetail = widget.detailmentor;

    DateTime? parsedJadwal;
    if (mentorDetail.session != null && mentorDetail.session!.isNotEmpty) {
      parsedJadwal = DateTime.parse(mentorDetail.session!.first.dateTime!);
    }
    final DateFormat formatOutput = DateFormat("HH:mm");
    final String formattedStartTime = formatOutput
        .format(DateTime.parse(mentorDetail.session!.first.startTime!));
    final String formattedEndTime = formatOutput
        .format(DateTime.parse(mentorDetail.session!.first.endTime!));

    String formattedJadwal = parsedJadwal != null
        ? DateFormat('dd MMMM yyyy').format(parsedJadwal)
        : "No scheduled session";

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.symmetric(
              horizontal: 24, vertical: 20), // Atur padding konten
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: ColorStyle().whiteColors,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Booking Class", style: FontFamily().titleText),
              SizedBox(width: 20),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.close_rounded,
                  color: ColorStyle().errorColors,
                ),
              )
            ],
          ),
          content: Container(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Apakah kamu yakin untuk memesan session ini, Kamu dapat memesan session ini secara gratis",
                  textAlign: TextAlign.center,
                  style: FontFamily().regularText.copyWith(
                        fontSize: 14,
                      ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SmallOutlinedButton(
                      style: FontFamily().regularText.copyWith(
                          color: ColorStyle().primaryColors, fontSize: 16),
                      height: 48,
                      width: 150,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      title: "Cancel",
                    ),
                    SmallElevatedButton(
                      style: FontFamily().regularText.copyWith(
                          color: ColorStyle().whiteColors, fontSize: 16),
                      height: 48,
                      width: 150,
                      onPressed: () async {
                        try {
                          String? userId = await UserPreferences.getUserId();
                          if (userId != null) {
                            var result = await bookSession(
                                widget.detailmentor.session!
                                    .map((session) => session.id)
                                    .join(","),
                                userId);
                            if (result.isSuccess) {

                              // ignore: use_build_context_synchronously
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailBookingSession(
                                          nama_mentor: widget.detailmentor.name
                                              .toString(),
                                          nama_session: widget
                                              .detailmentor.session!
                                              .map((session) => session.title)
                                              .join(", "),
                                          jadwal_session:
                                              formattedJadwal +
                                                            " " +
                                                            formattedStartTime +
                                                            " - " +
                                                            formattedEndTime,
                                        )),
                                (Route<dynamic> route) => false,
                              );
                            } else {
                              // Jika booking gagal, tampilkan pesan error
                              throw Exception(result.message);
                            }
                          } else {
                            throw Exception(
                                "Anda belum login, silahkan login terlebih dahulu.");
                          }
                        } catch (e) {
                          showTopSnackBar(context, e.toString());
                        }
                      },
                      title: "Booking",
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showTopSnackBar(BuildContext context, String message) {
    Flushbar(
      backgroundColor: ColorStyle().secondaryColors,
      message: message,
      icon: Icon(
        Icons.info_outline,
        size: 28.0,
        color: ColorStyle().whiteColors,
      ),
      duration: Duration(seconds: 3),
      leftBarIndicatorColor: ColorStyle().errorColors,
      margin: EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      flushbarPosition: FlushbarPosition.TOP, // Menampilkan di bagian atas
    ).show(context);
  }

  Widget buildReviewWidgets() {
    // Periksa apakah reviews ada dan tidak kosong
    if (widget.mentorReviews != null && widget.mentorReviews!.isNotEmpty) {
      return Column(
        children: widget.mentorReviews!.map((review) {
          return ReviewWidget(
            name: review.reviewer ?? "No Name",
            review: review.content ?? "No Review",
          );
        }).toList(),
      );
    } else {
      // Jika tidak ada review, tampilkan pesan
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Belum ada review",
            style: FontFamily().regularText,
          ),
        ),
      );
    }
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

class SmallOutlinedButton extends StatelessWidget {
  final Function()? onPressed;
  final double height;
  final double width;
  final String title;
  final Color color;
  final TextStyle? style;

  const SmallOutlinedButton({
    Key? key,
    this.onPressed,
    this.title = "",
    this.color = Colors.blue,
    this.style,
    this.height = 32,
    this.width = 72,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(
                color: ColorStyle().primaryColors), // Set the border color
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: style,
        ),
      ),
    );
  }
}

class ElevatedButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String? title;
  final Color? color;
  const ElevatedButtonWidget({Key? key, this.onPressed, this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            backgroundColor:
                MaterialStateProperty.all<Color>(ColorStyle().primaryColors)),

        onPressed: onPressed,
        // },
        child: Text(
          title!,
          style: FontFamily().buttonText.copyWith(
                fontSize: 16,
              ),
        ),
      ),
    );
  }
}

class SmallElevatedButton extends StatelessWidget {
  final Function()? onPressed;
  final double height;
  final double width;
  final String title;
  final Color color; // Keep this if you want to allow custom colors
  final TextStyle? style;

  const SmallElevatedButton({
    Key? key,
    this.onPressed,
    this.title = "", // Provide a default value for title
    this.color = Colors.blue, // This will be overridden if not used
    this.style, // You may provide a default style or handle it in the build method
    this.height = 32,
    this.width = 72,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine the color to use, defaulting to ColorStyle().primaryColors if color is Colors.blue
    final buttonColor = color == Colors.blue
        ? MaterialStateProperty.all<Color>(ColorStyle().primaryColors)
        : MaterialStateProperty.all<Color>(color);

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          backgroundColor: buttonColor, // Use the determined color
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: style, // Use the provided style or a default one
        ),
      ),
    );
  }
}
