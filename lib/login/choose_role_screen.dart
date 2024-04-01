import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/login/choose_role_service.dart';

class ChooseRoleScreen extends StatefulWidget {
  const ChooseRoleScreen({super.key});

  @override
  State<ChooseRoleScreen> createState() => _ChooseRoleScreenState();
}

class _ChooseRoleScreenState extends State<ChooseRoleScreen> {
  final ChooseRoleService chooseRoleService = ChooseRoleService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(width: 20),
                Image.asset(
                  'Handoff/logo/LogoWeb.png',
                  height: 150,
                  width: 150,
                ),
                const SizedBox(width: 20),
              ],
            ),
          ],
        ),
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
                          'Choose your Role',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: 28),
                        Text(
                          'Ingin memberi panduan sebagai mentor atau mendapatkan bimbingan sebagai mentee? Sebagai mentor, Anda bisa berbagi pengalaman dan inspirasi. Sebagai mentee, Anda dapat belajar dari yang lebih berpengalaman.',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                          ),
                          child: ElevatedButton(
                            onPressed: () async {
                              // Start the async operation
                              await chooseRoleService.chooseRole("Mentee");

                              // if (mounted) {
                              //   Navigator.pushAndRemoveUntil(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) =>
                              //           const EditProfileMenteeScreen(
                              //         skills: [],
                              //         linkedin: '',
                              //         about: '',
                              //         location: '',
                              //         currentJob: '',
                              //         currentCompany: '',
                              //         experiences: [],
                              //       ),
                              //     ),
                              //     (route) => false,
                              //   );
                              // }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFE78839),
                              padding: EdgeInsets.symmetric(
                                horizontal: 125,
                                vertical: 35,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                            child: Text(
                              'As a Mentee',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                          ),
                          child: ElevatedButton(
                            onPressed: () async {
                              // Assuming you have an instance of AuthService
                              await chooseRoleService.chooseRole("Mentor");

                              // if (mounted) {
                              //   Navigator.pushAndRemoveUntil(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) =>
                              //           RegisterMentorScreen(),
                              //     ),
                              //     (route) => false,
                              //   );
                              // }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFE78839),
                              padding: EdgeInsets.symmetric(
                                horizontal: 125,
                                vertical: 35,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                            child: Text(
                              'As a Mentor',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: SizedBox(
                        width: 42.12,
                        child: Image.asset(
                          'Handoff/ilustrator/choose_role.png',
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
