import 'package:flutter/material.dart';
import 'package:my_flutter_app/style/tittle_text.dart';
import 'package:my_flutter_app/widget/button_widget.dart';
import 'package:my_flutter_app/widget/menucategory.dart';

class VerifikasiMentorScreen extends StatefulWidget {
  VerifikasiMentorScreen({Key? key}) : super(key: key);

  @override
  State<VerifikasiMentorScreen> createState() => _VerifikasiMentorScreenState();
}

class _VerifikasiMentorScreenState extends State<VerifikasiMentorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Verifikasi Mentor',
          style: FontFamily().titleText.copyWith(
                color: ColorStyle().primaryColors,
                fontSize: 24,
              ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TittleTextField(
                  title: 'Nama',
                  color: ColorStyle().secondaryColors,
                  textAlign: TextAlign.start,
                ),
                const ContainerField(
                  text: "Steven Jobs",
                ),
                TittleTextField(
                  title: 'Gender',
                  color: ColorStyle().secondaryColors,
                  textAlign: TextAlign.start,
                ),
                const ContainerField(
                  text: "Laki-Laki",
                ),
                TittleTextField(
                  title: 'Job / Title',
                  color: ColorStyle().secondaryColors,
                  textAlign: TextAlign.start,
                ),
                const ContainerField(
                  text: "UI Designer",
                ),
                TittleTextField(
                  title: 'Company',
                  color: ColorStyle().secondaryColors,
                  textAlign: TextAlign.start,
                ),
                const ContainerField(
                  text: "PT Sinar Terus",
                ),
                TittleTextField(
                  title: 'Skill',
                  color: ColorStyle().secondaryColors,
                  textAlign: TextAlign.start,
                ),
                const ContainerField(
                  text: "UI/UX Design, Graphic Design, Adobe XD, Figma",
                ),
                TittleTextField(
                  title: 'Linkedln',
                  color: ColorStyle().secondaryColors,
                  textAlign: TextAlign.start,
                ),
                const ContainerField(
                  text:
                      "https://Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                ),
                TittleTextField(
                  title: 'Portofolio',
                  color: ColorStyle().secondaryColors,
                  textAlign: TextAlign.start,
                ),
                const ContainerField(
                  text:
                      "https://Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                ),
                TittleTextField(
                  title: 'Experience',
                  color: ColorStyle().primaryColors,
                  textAlign: TextAlign.start,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TittleTextField(
                        title: 'Job',
                        color: ColorStyle().secondaryColors,
                        textAlign: TextAlign.start,
                      ),
                      const ContainerField(text: "Graphic Designer "),
                      TittleTextField(
                        title: 'Company',
                        color: ColorStyle().secondaryColors,
                        textAlign: TextAlign.start,
                      ),
                      const ContainerField(text: "PT Sinar Terus"),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RegularOutlineButtonWidget(text: "Tolak"),
                    RegularElevatedButtonWidget(text: "Terima"),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ContainerField extends StatelessWidget {
  final String text;
  const ContainerField({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        children: [
          Container(
            width: 1300,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: ColorStyle().tertiaryColors,
            ),
            child: Text(
              text,
              style: FontFamily().regularText.copyWith(
                    fontSize: 16,
                    color: ColorStyle().disableColors,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
