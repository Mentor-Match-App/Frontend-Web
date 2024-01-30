import 'package:flutter/material.dart';
import 'package:my_flutter_app/admin/screen/menu_admin/community_admin_screen.dart';
import 'package:my_flutter_app/admin/screen/menu_admin/dasboard_home.dart';
import 'package:my_flutter_app/admin/screen/menu_admin/mentee_admin.dart';
import 'package:my_flutter_app/admin/screen/menu_admin/mentor_admin_screen.dart';
import 'package:my_flutter_app/admin/screen/menu_admin/notification_admin_screen.dart';
import 'package:my_flutter_app/admin/screen/menu_admin/pembayaran_admin_screen.dart';
import 'package:my_flutter_app/admin/screen/menu_admin/program_layanan_screen.dart';
import 'package:my_flutter_app/style/colorStyle.dart';
import 'package:my_flutter_app/widget/sidebar_admin.dart';

class DashboardAdminScreen extends StatefulWidget {
  @override
  _DashboardAdminScreenState createState() => _DashboardAdminScreenState();
}

class _DashboardAdminScreenState extends State<DashboardAdminScreen>
    with SingleTickerProviderStateMixin {
  double _size = 250.0;
  bool _large = true;
  String _selectedMenu = 'Dashboard';

  void _updateSize() {
    setState(() {
      _size = _large ? 250.0 : 0.0;
      _large = !_large;
    });
  }

  void _handleMenuSelected(String menu) {
    setState(() {
      _selectedMenu = menu;
    });
  }
/////
  ///

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          AnimatedSize(
            curve: Curves.easeIn,
            duration: const Duration(seconds: 1),
            child: SideBarAdmin(
              key: UniqueKey(),
              size: _size,
              onMenuSelected: _handleMenuSelected,
              selectedMenu: _selectedMenu,
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.menu, color: Colors.black87),
                        onPressed: () {
                          _updateSize();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: 800,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorStyle().tertiaryColors),
                              borderRadius: BorderRadius.circular(8)),
                          child: const TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Seacrh by name , company, role',
                              prefixIcon:
                                  Icon(Icons.search), // Icon pencarian di sini
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(Icons.notifications_active,
                            color: ColorStyle().secondaryColors),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NotificationAdminScreen(),
                            ),
                          );
                        },
                      ),
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            AssetImage('assets/Handoff/ilustrator/profile.png'),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                ),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  flex: 4,
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
          ),
        ],
      ),
    );
  }

  Widget _getSelectedScreen() {
    switch (_selectedMenu) {
      case 'Program & Layanan':
        return ProgramLayananContent();
      case 'Mentee':
        return MenteeScreen();
      case 'Mentor':
        return MentorScreen();
      case 'Community':
        return ComunityScreen();
      case 'Pembayaran':
        return PembayaranAdminScreen();
      default:
        return HomeScreenAdmin();
    }
  }
}
