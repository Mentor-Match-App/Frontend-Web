import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_flutter_app/admin/screen/dasboard_admin_screen.dart';
import 'package:my_flutter_app/login/choose_role_screen.dart';
import 'package:my_flutter_app/login/login_service.dart';
import 'package:my_flutter_app/widget/navbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoggingIn = false;

  Future<void> signInWithGoogle() async {
    setState(() {
      _isLoggingIn = true;
    });

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        final User? user = userCredential.user;

        if (user != null) {
          // Mengambil ID token dari Firebase Auth
          String? idToken = await user.getIdToken();
          print('ID Token: $idToken');

          // Membuat instance AuthService dan memanggil loginUser
          AuthService authService = AuthService();
          await authService.loginUser(idToken!);

          // Cek data yang disimpan di SharedPreferences
          Map<String, String?> userData = await AuthService.getUserData();

          // Navigasi ke halaman lain setelah login berhasil
          // Navigator.of(context).pushReplacement(
          //     MaterialPageRoute(builder: (context) => ChooseRoleScreen()));

          // Navigate to admin dashboard if userType is admin
          if (userData['userType'] == 'Admin') {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => DashboardAdminScreen()));
          } else {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => ChooseRoleScreen()));
          }
        }
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Login failed: $e"),
        ),
      );
    } finally {
      setState(() {
        _isLoggingIn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: NavbarWidget(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 150, vertical: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Daftar untuk memulai Mentorship',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(height: 28),
                        Text(
                          'Mari lanjutkan langkah untuk dunia pendidikan yang lebih baik dengan sesio mentoring bersama mentor-mentor ahli yang dapat membantu kamu dalam mencapai target dan tujuan.',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w200),
                        ),
                        SizedBox(height: 50), // Add space
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                          ),
                          child: ElevatedButton(
                            onPressed: _isLoggingIn
                                ? null
                                : () async {
                                    await signInWithGoogle();
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFE78839),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 125,
                                  vertical: 35), // Increase horizontal padding
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                            child: Text(
                              'Login with Google',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5), // Add space
                      ],
                    ),
                  ),
                  const SizedBox(width: 80),
                  Expanded(
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: SizedBox(
                        width: 42.12,
                        child: Image.asset(
                          'Handoff/ilustrator/login.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
