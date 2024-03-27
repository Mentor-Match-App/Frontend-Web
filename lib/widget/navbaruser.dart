import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/Mentee/Screens/PremiumClass/premiumclass_page.dart';
import 'package:my_flutter_app/Mentee/Screens/Session/session_page.dart';
import 'package:my_flutter_app/Mentee/Screens/communitymentee_page.dart';
import 'package:my_flutter_app/Mentee/Screens/landing_page.dart';
import 'package:my_flutter_app/Mentee/Screens/myclassmentee_page.dart';
import 'package:my_flutter_app/Mentee/Screens/notificationmentee_page.dart';
import 'package:my_flutter_app/Mentee/Screens/personalprofile.dart';
import 'package:my_flutter_app/Mentor/Screens/communitymentor_page.dart';
import 'package:my_flutter_app/Mentor/Screens/notificationmentor_page.dart';

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
          MaterialPageRoute(builder: (context) => SessionPage()),
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

class NavbarWidgetMentee extends StatelessWidget {
  const NavbarWidgetMentee({Key? key}) : super(key: key);

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
                    MaterialPageRoute(builder: (context) => LandingPage()),
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
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CommunityMenteePage()),
                  );
                },
                icon: Icon(
                  Icons.people_outline_outlined,
                  color: Colors.black,
                ),
                label: Text(
                  'Community',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black,
                  ),
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
                icon: Icon(
                  Icons.book_outlined,
                  color: Colors.black,
                ),
                label: Text(
                  'My Class',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
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
                            builder: (context) => PersonalProfilePage()),
                      );
                    },
                    child: _buildCircularImage(
                      'https://picsum.photos/250?image=9',
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

class NavbarWidgetMentor extends StatelessWidget {
  const NavbarWidgetMentor({Key? key}) : super(key: key);

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
                MaterialPageRoute(builder: (context) => LandingPage()),
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
                        builder: (context) => PersonalProfilePage()),
                  );
                },
                child: ClipOval(
                  child: Image.network(
                    'https://picsum.photos/250?image=9',
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
