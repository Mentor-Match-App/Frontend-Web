import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/mentee/screen/homepage_mentee.dart';
import 'package:my_flutter_app/mentee/screen/landing_page.dart';
import 'package:my_flutter_app/mentee/screen/myclassmentee_page.dart';
import 'package:my_flutter_app/mentee/screen/notificationmentee_page.dart';
import 'package:my_flutter_app/mentee/screen/premium_class/premiumclass_page.dart';
import 'package:my_flutter_app/mentee/screen/profile/mentee_profile_screen.dart';
import 'package:my_flutter_app/mentee/screen/session/session_screen.dart';
import 'package:my_flutter_app/mentor/Screens/communitymentor_page.dart';
import 'package:my_flutter_app/mentor/Screens/homepage_mentor.dart';
import 'package:my_flutter_app/mentor/Screens/notificationmentor_page.dart';
import 'package:my_flutter_app/mentor/screens/profile/mentor_profile_screen.dart';
import 'package:my_flutter_app/preferences/%20preferences_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDropdown extends StatefulWidget {
  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Future.delayed(Duration.zero, () {
            _showDropdown(context);
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.arrow_drop_down,
                color: Colors.black,
              ),
              const SizedBox(width: 8),
              Text(
                selectedValue ?? 'Program dan Layanan',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showDropdown(BuildContext context) async {
    try {
      final RenderBox box = context.findRenderObject() as RenderBox;
      final Offset target = box.localToGlobal(Offset(0.0, box.size.height));
      final RenderBox overlay =
          Overlay.of(context).context.findRenderObject() as RenderBox;

      final RelativeRect position = RelativeRect.fromRect(
        Rect.fromPoints(
          target,
          target.translate(box.size.width, 0),
        ),
        Offset.zero & overlay.size,
      );

      final String? result = await showMenu<String>(
        context: context,
        position: position,
        items: [
          PopupMenuItem<String>(
            value: 'Premium Class',
            child: SizedBox(
              width: 200,
              child: Text('Premium Class'),
            ),
          ),
          PopupMenuItem<String>(
            value: 'Sessions',
            child: SizedBox(
              width: 200,
              child: Text('Sessions'),
            ),
          ),
        ],
      );

      if (result == 'Premium Class') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PremiumClassPage()),
        );
      } else if (result == 'Sessions') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SessionScreen()),
        );
      }

      setState(() {
        if (result != 'Program dan Layanan' && result != 'Sessions') {
          selectedValue = result;
        }
      });
    } catch (error) {
      print('Error navigating to PremiumClassPage: $error');
    }
  }
}

class NavbarWidgetMentee extends StatefulWidget {
  const NavbarWidgetMentee({Key? key}) : super(key: key);

  @override
  State<NavbarWidgetMentee> createState() => _NavbarWidgetMenteeState();
}

class _NavbarWidgetMenteeState extends State<NavbarWidgetMentee> {
    String _photoUrl = "";

  Future<void> _loadProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      /// photourl
      _photoUrl = prefs.getString('photoUrl') ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  // Redirect to the homepage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenteeHomePage()),
                  );
                },
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        'Handoff/logo/LogoWeb.png',
                        height: 150,
                        width: 150,
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
          Row(
            children: [
              CustomDropdown(),
              const SizedBox(width: 20),
              IconButton(
                icon: Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationMenteePage()),
                  );
                },
              ),
              const SizedBox(width: 20),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileMenteeScreen()),
                      );
                    },
                    child: _buildCircularImage(
                      _photoUrl,
                      40,
                      40,
                      null,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCircularImage(
    String imageUrl,
    double height,
    double width,
    Color? color,
  ) {
    return ClipOval(
      child: Image.network(
        imageUrl,
        height: height,
        width: width,
        fit: BoxFit.cover,
        color: color,
        colorBlendMode: color != null ? BlendMode.modulate : null,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: height,
            width: width,
            color: Colors.grey,
          );
        },
      ),
    );
  }
}

class NavbarWidgetMentor extends StatefulWidget {
  const NavbarWidgetMentor({Key? key}) : super(key: key);

  @override
  State<NavbarWidgetMentor> createState() => _NavbarWidgetMentorState();
  
}

class _NavbarWidgetMentorState extends State<NavbarWidgetMentor> {
    String _photoUrl = "";

  Future<void> _loadProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      /// photourl
      _photoUrl = prefs.getString('photoUrl') ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MentorHomePage()),
              );
            },
            child: Image.asset(
              'Handoff/logo/LogoWeb.png',
              height: 150,
              width: 150,
            ),
          ),
          Row(
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CommunityMentorPage()),
                  );
                },
                icon: Icon(Icons.people_outline_outlined, color: Colors.black),
                label: Text(
                  'Community',
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.black),
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyClassMenteePage()),
                  );
                },
                icon: Icon(Icons.book_outlined, color: Colors.black),
                label: Text(
                  'My Class',
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.black),
                ),
              ),
              IconButton(
                icon: Icon(Icons.notifications_outlined, color: Colors.black),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationMentorPage()),
                  );
                },
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileMentorScreen()),
                  );
                },
                child: ClipOval(
                  child: Image.network(
                    _photoUrl,
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 40,
                      width: 40,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
