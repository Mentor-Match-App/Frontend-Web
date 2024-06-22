import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/mentor/model/profile_model.dart';
import 'package:my_flutter_app/mentor/screens/register_mentor/verification_page.dart';
import 'package:my_flutter_app/mentor/service/profile_service.dart';
import 'package:my_flutter_app/mentor/service/re_register_mentor_service.dart';
import 'package:my_flutter_app/style/fontStyle.dart';
import 'package:my_flutter_app/style/text.dart';
import 'package:my_flutter_app/widget/button.dart';
import 'package:my_flutter_app/widget/flushsBar_widget.dart';
import 'package:my_flutter_app/widget/menucategory.dart';
import 'package:my_flutter_app/widget/text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReRegisterFormScreen extends StatefulWidget {
  ReRegisterFormScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ReRegisterFormScreen> createState() => _ReRegisterFormScreenState();
}

class _ReRegisterFormScreenState extends State<ReRegisterFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _linkedinController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _portofolioController = TextEditingController();
  final TextEditingController _skillController = TextEditingController();
  final List<Map<String, String>> _skills = [];
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _experienceCompanyController =
      TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _accountNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  String _email = "";
  String _name = "";
  String _photoUrl = "";
  String _selectedGender = '';
  String job = "";
  String company = "";
  String location = "";
  String linkedin = "";
  String about = "";
  String portofolio = "";
  String accountNumber = "";
  String accountName = "";
  List<String> skills = [];
  List<Map<String, String>> experience = [];
  bool isLoading = false;

  /// ambil data profile
  final ProfileService mentorService = ProfileService();

  @override
  void initState() {
    super.initState();
    _loadProfileData();
    _jobController.text = job;
    _companyController.text = company;
    _locationController.text = location;
    _linkedinController.text = linkedin;
    _aboutController.text = about;
    _portofolioController.text = portofolio;
    _accountNumberController.text = accountNumber;
    _accountNameController.text = accountName;
    _genderController.text = _selectedGender;
  }

  @override
  void dispose() {
    _genderController.dispose();
    _jobController.dispose();
    _companyController.dispose();
    _locationController.dispose();
    _linkedinController.dispose();
    _aboutController.dispose();
    _portofolioController.dispose();
    _accountNameController.dispose();
    _accountNumberController.dispose();
    _skillController.dispose();
    _roleController.dispose();
    _experienceCompanyController.dispose();

    super.dispose();
  }

  void _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _email = prefs.getString('email') ?? "";
    _name = prefs.getString('name') ?? "";
    _photoUrl = prefs.getString('photoUrl') ?? "";

    _emailController.text = _email;
    _nameController.text = _name;

    final profileData = await mentorService.getMentorProfile();
    setState(() {
      _selectedGender = profileData.user!.gender ?? '';
      _jobController.text = profileData.user!.experiences
              ?.firstWhere((element) => element.isCurrentJob == true,
                  orElse: () => ExperienceMentor())
              .jobTitle ??
          '';
      _companyController.text = profileData.user!.experiences
              ?.firstWhere((element) => element.isCurrentJob == true,
                  orElse: () => ExperienceMentor())
              .company ??
          '';
      _locationController.text = profileData.user?.location ?? '';
      _linkedinController.text = profileData.user?.linkedin ?? '';
      _aboutController.text = profileData.user?.about ?? '';
      _portofolioController.text = profileData.user?.portofolio ?? '';
      _accountNumberController.text = profileData.user?.accountNumber ?? '';
      _accountNameController.text = profileData.user?.accountName ?? '';
      _skills.addAll(
          profileData.user?.skills?.map((skill) => {'skill': skill}) ?? []);
      experience.addAll(profileData.user?.experiences?.map((exp) => {
                'role': exp.jobTitle ?? '',
                'experienceCompany': exp.company ?? ''
              }) ??
          []);
    });
  }

  void _addSkill() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _skills.add({'skill': _skillController.text});
        _skillController.clear();
      });
    }
  }

  void _addExperience() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        experience.add({
          'role': _roleController.text,
          'experienceCompany': _experienceCompanyController.text
        });
        _roleController.clear();
        _experienceCompanyController.clear();
      });
    }
  }

  void _updateMentor() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      final profileData = await mentorService.getMentorProfile();
      try {
        if (mounted) {
          await MentorUpdateService().updateMentor(
            accountNumber: profileData.user?.accountName ?? '',
            accountName: profileData.user?.accountNumber ?? '',
            gender: profileData.user?.gender ?? '',
            mentorId: profileData.user?.id ?? '',
            portfolio: profileData.user?.portofolio ?? '',
            job: profileData.user?.experiences
                    ?.firstWhere((element) => element.isCurrentJob == true,
                        orElse: () => ExperienceMentor())
                    .jobTitle ??
                '',
            company: profileData.user?.experiences
                    ?.firstWhere((element) => element.isCurrentJob == true,
                        orElse: () => ExperienceMentor())
                    .company ??
                '',
            location: profileData.user?.location ?? '',
            skills: profileData.user?.skills ?? [],
            about: profileData.user?.about ?? '',
            linkedin: profileData.user?.linkedin ?? '',
            experiences: profileData.user?.experiences
                    ?.map((exp) => {
                          'role': exp.jobTitle ?? '',
                          'experienceCompany': exp.company ?? ''
                        })
                    .toList() ??
                [],
          );

          // Show SnackBar if the update is successful
          showTopSnackBar(context, "Registration successful",
              leftBarIndicatorColor: ColorStyle().succesColors);

          // Navigate to the verification page
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => VerificationPage(),
            ),
            (route) => false,
          );
        }
      } catch (error) {
        // Show error message if there is an error updating the mentor profile
        print('Error updating mentor profile: $error');
        showTopSnackBar(
          context,
          "Failed to update mentor profile",
          leftBarIndicatorColor: ColorStyle().errorColors,
        );
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    } else {
      // Show Snackbar if the form is not valid
      showTopSnackBar(
        context,
        "Semua field harus diisi",
        leftBarIndicatorColor: ColorStyle().errorColors,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/Handoff/logo/LogoMobile.png'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 32, bottom: 32, right: 200, left: 200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Complete the Form to Become a Mentor',
                        style: FontFamily().titleText.copyWith(fontSize: 24),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        'Please fill out the form below to apply to become a mentor. We greatly appreciate your\ncontribution in guiding and supporting our community!',
                        style: FontFamily().titleText.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: ColorStyle().disableColors),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              150), // Setengah dari lebar atau tinggi container yang baru
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          border: Border.all(
                            color: ColorStyle()
                                .tertiaryColors, // Ganti dengan warna yang sesuai
                            width: 3,
                          ),
                        ),
                        child: ClipOval(
                          child: CachedNetworkImage(
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/blank_profile.jpg',
                              fit: BoxFit.cover,
                            ),
                            imageUrl: _photoUrl,
                            fit: BoxFit.cover,
                            width: 120,
                            height: 120,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            _textFieldWithTitle(
                                "Name", _nameController, "Your name",
                                enabled: false),
                            SizedBox(
                              height: 12,
                            ),
                            _textFieldWithTitle(
                                "Email", _emailController, "Your email",
                                enabled: false),
                            SizedBox(
                              height: 12,
                            ),
                            _genderDropdownField(),
                            SizedBox(
                              height: 12,
                            ),
                            _textFieldWithTitle(
                              "Location",
                              _locationController,
                              "Enter Your Location",
                              onChanged: (value) {
                                setState(() {
                                  company = value;
                                });
                              },
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            _textFieldWithTitle(
                                "About", _aboutController, "Enter Your About",
                                onChanged: (value) {
                              setState(() {
                                about = value;
                              });
                            }),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Occupation",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color(0xffE78938),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          _textFieldWithTitle(
                            "Job/Title",
                            _jobController,
                            "Enter Your Job/Position",
                            onChanged: (value) {
                              setState(() {
                                job = value;
                              });
                            },
                          ),
                        ],
                      )),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Column(
                        children: [
                          _textFieldWithTitle(
                            "Company",
                            _companyController,
                            "Enter Your Company",
                            onChanged: (value) {
                              setState(() {
                                company = value;
                              });
                            },
                          ),
                        ],
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _skillField(),
                  _skillChips(),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Experience",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color(0xffE78938),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _experienceField(),
                  _experienceChips(),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Portofolio",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color(0xffE78938),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _textFieldWithTitle("LinkedIn", _linkedinController,
                      "Enter Your LinkedIn URL", onChanged: (value) {
                    setState(() {
                      linkedin = value;
                    });
                  }),
                  _textFieldWithTitle("portofolio", _portofolioController,
                      "Enter Your portofolio", onChanged: (value) {
                    setState(() {
                      portofolio = value;
                    });
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Rekening Bank (BCA)",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color(0xffE78938),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          _textFieldWithTitle(
                            "Account Number",
                            _accountNumberController,
                            "Enter Your Account Number",
                            onChanged: (value) {
                              setState(() {
                                accountNumber = value;
                              });
                            },
                          ),
                        ],
                      )),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Column(
                        children: [
                          _textFieldWithTitle(
                            "Account Name",
                            _accountNameController,
                            "Enter Your Account Name",
                            onChanged: (value) {
                              setState(() {
                                accountName = value;
                              });
                            },
                          ),
                        ],
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  _applyButton(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textFieldWithTitle(
      String title, TextEditingController controller, String hintText,
      {bool enabled = true, Function(String)? onChanged}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TittleTextField(title: title, color: ColorStyle().secondaryColors),
        SizedBox(
          height: 8,
        ),
        TextFieldWidget(
          hintText: hintText,
          controller: controller,
          enabled: enabled,
          onChanged: onChanged, // Add this line
        ),
      ],
    );
  }

  Widget _skillField() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TittleTextField(
                title: "Skill", color: ColorStyle().secondaryColors),
          ],
        ),
        const SizedBox(height: 8),
        TextFieldWidget(
          controller: _skillController,
          hintText: "Skill",
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: _addSkill,
            icon: const Icon(Icons.add, size: 16),
            label: Text("Add Skill", style: FontFamily().regularText),
          ),
        ),
      ],
    );
  }

  Widget _skillChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _skills.map((skill) => _buildSkillChip(skill)).toList(),
      ),
    );
  }

  Widget _buildSkillChip(Map<String, String> skill) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, top: 8),
      child: Chip(
        label: Text(
          skill['skill']!,
          style: FontFamily().regularText.copyWith(color: Colors.white),
        ),
        backgroundColor: ColorStyle().primaryColors,
        deleteIcon: const Icon(Icons.close, size: 12),
        onDeleted: () {
          setState(() => _skills.remove(skill));
        },
      ),
    );
  }

  Widget _experienceField() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TittleTextField(
                      title: "Role", color: ColorStyle().secondaryColors),
                  SizedBox(
                    height: 8,
                  ),
                  TextFieldWidget(
                    controller: _roleController,
                    hintText: "Role",
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TittleTextField(
                      title: "Company", color: ColorStyle().secondaryColors),
                  SizedBox(
                    height: 8,
                  ),
                  TextFieldWidget(
                    controller: _experienceCompanyController,
                    hintText: "Company",
                  ),
                ],
              ),
            )
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: _addExperience,
            icon: const Icon(Icons.add, size: 16),
            label: Text("Add Experience", style: FontFamily().regularText),
          ),
        ),
      ],
    );
  }

  Widget _experienceChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: experience.map((exp) => _buildExperienceChip(exp)).toList(),
      ),
    );
  }

  Widget _buildExperienceChip(Map<String, String> exp) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, top: 8),
      child: Chip(
        label: Text(
          exp['role']! + " at " + exp['experienceCompany']!,
          style: FontFamily().regularText.copyWith(color: Colors.white),
        ),
        backgroundColor: ColorStyle().primaryColors,
        deleteIcon: const Icon(Icons.close, size: 12),
        onDeleted: () {
          setState(() => experience.remove(exp));
        },
      ),
    );
  }

  Widget _genderDropdownField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TittleTextField(
            title: "What your gender", color: ColorStyle().secondaryColors),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: _selectedGender.isEmpty ? null : _selectedGender,
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorStyle().tertiaryColors,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none,
            ),
          ),
          hint: Text("Select Your Gender"),
          style: FontFamily().regularText.copyWith(
                color: ColorStyle().disableColors,
              ),
          //  buat waktu dropdown di klik stylenya sama dengan textfield
          onChanged: (String? newValue) {
            setState(() {
              _selectedGender = newValue!;
              _genderController.text =
                  newValue; // Update the controller if needed
            });
          },
          items: <String>['Pria', 'Wanita']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _applyButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: isLoading
          ? const CircularProgressIndicator()
          : ElevatedButtonWidget(
              onPressed: () {
                _updateMentor();
              },
              title: "Apply",
            ),
    );
  }
}
