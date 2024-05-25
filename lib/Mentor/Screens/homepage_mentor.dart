import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/mentee/screen/sidebar/community_user.dart';
import 'package:my_flutter_app/mentor/Screens/my_class_mentor/my_class_mentor_sidebar.dart';
import 'package:my_flutter_app/mentor/screens/sidebar/dashboard_mentor.dart';
import 'package:my_flutter_app/mentor/Screens/search_page_mentor.dart';
import 'package:my_flutter_app/widget/footer.dart';
import 'package:my_flutter_app/widget/menucategory.dart';
import 'package:my_flutter_app/widget/navbaruser.dart';
import 'package:my_flutter_app/widget/sidebar_mentee.dart';

class MentorHomePage extends StatefulWidget {
  final String selectedMenu;
  const MentorHomePage({Key? key, this.selectedMenu = 'Dashboard'});

  @override
  State<MentorHomePage> createState() => _MentorHomePageState();
}

class _MentorHomePageState extends State<MentorHomePage> {
  double _size = 200.0;
  String _selectedMenu = 'Dashboard';

  @override
  void initState() {
    super.initState();
    _selectedMenu =
        widget.selectedMenu; // Tetapkan nilai _selectedMenu dari widget
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle().whiteColors,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: NavbarWidgetMentor(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchBarMentor(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SideBarMentee(
                      key: UniqueKey(),
                      size: _size,
                      onMenuSelected: (menu) {
                        setState(() {
                          _selectedMenu = menu;
                        });
                      },
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
      case 'Class':
        return MyClassMentorListScreen();
      case 'Community':
        return CommunityScreen();
      default:
        return DashboardMentor();
    }
  }
}

class SearchBarMentor extends StatelessWidget {
  const SearchBarMentor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Search",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              color: Color(0xff0A1737),
              fontSize: 16,
            ),
          ),
          const SizedBox(
            width: 60,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPageMentorweb()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: 800,
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
                          builder: (context) => SearchPageMentorweb()),
                    );
                  },
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Search by mentee name, class, or class name',
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
