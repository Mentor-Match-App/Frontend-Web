import 'package:flutter/material.dart';
import 'package:my_flutter_app/mentor/Screens/homepage_mentor.dart';
import 'package:my_flutter_app/mentor/screens/register_mentor/re_register_form.dart';
import 'package:my_flutter_app/mentor/service/profile_service.dart';
import 'package:my_flutter_app/widget/menucategory.dart';

class VerificationPage extends StatefulWidget {
  VerificationPage({Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final ProfileService mentorService = ProfileService();
  bool isLoading = true;
  String _userType = '';
  String _rejectReason = '';

  @override
  void initState() {
    super.initState();
    _loadUserType();
  }

  void _loadUserType() async {
    final profileData = await mentorService.getMentorProfile();
    setState(() {
      isLoading = false;
      _userType = profileData.user?.userType ?? 'Unknown';
      _rejectReason = profileData.user?.rejectReason ?? '';
    });
  }

  /// buat fungtion untuk load data profile mentor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/Handoff/logo/LogoMobile.png'),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Image.asset('assets/Handoff/ilustrator/verification.png'),
              const SizedBox(height: 12),
              Text(
                'Terima kasih telah mendaftar sebagai mentor di MentorMatch. ',
                style: FontFamily().titleText.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              isLoading
                  ? CircularProgressIndicator()
                  : _userType == 'Mentor'
                      ? Column(
                          children: [
                            Text(
                              'Akun Anda telah terverifikasi!',
                              style: FontFamily().regularText,
                              textAlign: TextAlign.center,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MentorHomePage()),
                                    (route) => false);
                              },
                              child: Text('Lanjutkan'),
                            ),
                          ],
                        )
                      : _userType == 'PendingMentor'
                          ? Text(
                              'Akun Anda masih dalam proses verifikasi.',
                              style: FontFamily().regularText,
                              textAlign: TextAlign.center,
                            )
                          : _userType == 'RejectedMentor'
                              ? Column(
                                  children: [
                                    Text(
                                      'Akun Anda ditolak.',
                                      style: FontFamily().regularText,
                                      textAlign: TextAlign.center,
                                    ),
                                    if (_rejectReason.isNotEmpty)
                                      Text(
                                        'Alasan Penolakan: $_rejectReason',
                                        style: FontFamily().regularText,
                                        textAlign: TextAlign.center,
                                      ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ReRegisterFormScreen()),
                                            (route) => false);
                                      },
                                      child: Text('Kirim Ulang Verifikasi'),
                                    ),
                                  ],
                                )
                              : Text(
                                  'Status verifikasi tidak diketahui.',
                                  style: FontFamily().regularText,
                                  textAlign: TextAlign.center,
                                ),
            ],
          )
        ],
      ),
    );
  }
}