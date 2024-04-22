import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/mentee/screen/sidebar/community_mentee.dart';
import 'package:my_flutter_app/mentee/screen/sidebar/dashboard_mentee.dart';
import 'package:my_flutter_app/widget/footer.dart';
import 'package:my_flutter_app/widget/menucategory.dart';
import 'package:my_flutter_app/widget/navbaruser.dart';
import 'package:my_flutter_app/widget/sidebar_mentee.dart';

class MenteeHomePage extends StatefulWidget {
  const MenteeHomePage({Key? key});

  @override
  State<MenteeHomePage> createState() => _MenteeHomePageState();
}

class _MenteeHomePageState extends State<MenteeHomePage> {
  double _size = 200.0;
  String _selectedMenu = 'Dashboard';

  void _handleMenuSelected(String menu) {
    setState(() {
      _selectedMenu = menu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle().whiteColors,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: NavbarWidgetMentee(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchBar(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SideBarMentee(
                      key: UniqueKey(),
                      size: _size,
                      onMenuSelected: _handleMenuSelected,
                      selectedMenu: _selectedMenu),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 16.0, bottom: 16.0, right: 16.0),
                        child: _getSelectedScreen(),
                      ),
                    ),
                  ),
                ],
              ),
              FooterWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget _getSelectedScreen() {
    switch (_selectedMenu) {
      case 'Program & Layanan':
      // return ProgramLayananContent();
      case 'My CLass':
      // return MenteeScreen();
      case 'Community':
        return CommunityMentee();
      default:
        return DashboardMentee();
    }
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Find Mentor",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              color: Color(0xff0A1737),
              fontSize: 16,
            ),
          ),
          SizedBox(
            width: 60,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: 800,
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(color: ColorStyle().tertiaryColors),
                  borderRadius: BorderRadius.circular(8)),
              child: const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Seacrh by name , company, role',
                  prefixIcon: Icon(Icons.search), // Icon pencarian di sini
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
