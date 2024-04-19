import 'package:flutter/material.dart';
import 'package:my_flutter_app/login/login_screen.dart';
import 'package:my_flutter_app/preferences/%20preferences_helper.dart';
import 'package:my_flutter_app/widget/menucategory.dart';

class SideBarMentee extends StatefulWidget {
  final double size;
  final void Function(String) onMenuSelected;
  final String selectedMenu;

  SideBarMentee({
    required Key key,
    required this.size,
    required this.onMenuSelected,
    required this.selectedMenu,
  }) : super(key: key);

  @override
  State<SideBarMentee> createState() => _SideBarMenteeState();
}

class _SideBarMenteeState extends State<SideBarMentee> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      color: ColorStyle().whiteColors,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMenuSideBar("Dashboard", Icons.dashboard),
          _buildMenuSideBar("My Class", Icons.menu_book_sharp),
          _buildMenuSideBar("Community", Icons.workspaces_filled),
      
          SizedBox(height: 260),
          _buildLogoutButton(),
      
          // Tambahkan item menu lain jika ada
        ],
      ),
    );
  }

  Widget _buildMenuSideBar(String text, IconData icon) {
    final isSelected = widget.selectedMenu == text;
    final textColor =
        isSelected ? ColorStyle().primaryColors : ColorStyle().disableColors;
    final iconColor =
        isSelected ? ColorStyle().primaryColors : ColorStyle().disableColors;
    final backgroundColor =
        isSelected ? ColorStyle().secondaryColors.withOpacity(0.1) : null;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton.icon(
        onPressed: () => widget.onMenuSelected(text),
        icon: Icon(icon, color: iconColor),
        label: Text(text, style: TextStyle(color: textColor)),
        style: TextButton.styleFrom(
          alignment: Alignment.centerLeft,
          backgroundColor: backgroundColor,
        ),
      ),
    );
  }

  _buildLogoutButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton.icon(
        onPressed: () {
          UserPreferences.clearPreferences();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
        },
        icon: Icon(Icons.logout, color: ColorStyle().primaryColors),
        label:
            Text('Logout', style: TextStyle(color: ColorStyle().primaryColors)),
        style: TextButton.styleFrom(
          alignment: Alignment.centerLeft,
        ),
      ),
    );
  }
}
