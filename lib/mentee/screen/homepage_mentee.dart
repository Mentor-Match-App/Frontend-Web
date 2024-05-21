import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/mentee/screen/search_page_myclass_mentee.dart';
import 'package:my_flutter_app/mentee/screen/sidebar/community_user.dart';
import 'package:my_flutter_app/mentee/screen/sidebar/dashboard_mentee.dart';
import 'package:my_flutter_app/mentee/screen/sidebar/my_class/my_class_mentee.dart';
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
  String _selectedMenu = 'Dasboard';

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
              const SearchBarMentee(),
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
      case 'My Class':
        return MyClassMentee();
      case 'Community':
        return CommunityScreen();
      default:
        return DashboardMentee();
    }
  }
}

class SearchBarMentee extends StatelessWidget {
  const SearchBarMentee({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Search",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: Color(0xff0A1737),
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            width: 32, // Adjust this value to give some space between the text and the search bar
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPageMenteeWeb()),
                );
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorStyle().tertiaryColors),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchPageMenteeWeb(),
                      ),
                    );
                  },
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Search by mentor name, class name',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

