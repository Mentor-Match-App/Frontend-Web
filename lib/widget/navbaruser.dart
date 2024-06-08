import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/mentee/screen/premium_class/premiumclass_page.dart';
import 'package:my_flutter_app/mentee/screen/profile/mentee_profile_screen.dart';
import 'package:my_flutter_app/mentee/screen/session/session_screen.dart';
import 'package:my_flutter_app/widget/logo_button.dart';
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
              ButtonLogoMenteeMatch(),
              const SizedBox(width: 20),
            ],
          ),
          Row(
            children: [
              CustomDropdown(),
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
      child: CachedNetworkImage(
        placeholder: (context, url) => Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
        imageUrl: imageUrl,
        height: height,
        width: width,
        fit: BoxFit.cover,
        color: color,
        colorBlendMode: color != null ? BlendMode.modulate : null,
      ),
    );
  }
}
