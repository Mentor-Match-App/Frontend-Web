import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/Mentee/Screens/PremiumClass/premiumclass_page.dart';
import 'package:my_flutter_app/Mentee/Screens/Session/session_page.dart';
import 'package:my_flutter_app/Mentee/Screens/community_page.dart';
import 'package:my_flutter_app/Mentee/Screens/myclass_page.dart';

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

class NavbarWidgetUser extends StatelessWidget {
  const NavbarWidgetUser({Key? key}) : super(key: key);

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
          Row(
            children: [
              CustomDropdown(),
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CommunityPage()),
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
                    MaterialPageRoute(builder: (context) => MyClassPage()),
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
                onPressed: () {},
              ),
              const SizedBox(width: 20),
              _buildCircularImage(
                'https://picsum.photos/250?image=9',
                40,
                40,
                null,
              ),
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
