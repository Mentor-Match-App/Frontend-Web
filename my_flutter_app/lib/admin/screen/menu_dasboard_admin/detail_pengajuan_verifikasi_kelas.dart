import 'package:flutter/material.dart';
import 'package:my_flutter_app/style/colorStyle.dart';
import 'package:my_flutter_app/style/fontStyle.dart';
import 'package:my_flutter_app/style/tittle_text.dart';
import 'package:my_flutter_app/widget/button_widget.dart';

class DeatailPengajuanKelasScreen extends StatefulWidget {
  DeatailPengajuanKelasScreen({Key? key}) : super(key: key);

  @override
  State<DeatailPengajuanKelasScreen> createState() =>
      _DeatailPengajuanKelasScreenState();
}

class _DeatailPengajuanKelasScreenState
    extends State<DeatailPengajuanKelasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(
          'Verifikasi Premium Class',
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
                  title: 'Nama Class',
                  color: ColorStyle().secondaryColors,
                  textAlign: TextAlign.start,
                ),
                const ContainerField(
                  text: "Ui/Ux Design",
                ),
                TittleTextField(
                  title: 'Tingkat Pendidikan',
                  color: ColorStyle().secondaryColors,
                  textAlign: TextAlign.start,
                ),
                const ContainerField(
                  text: "SD",
                ),
                TittleTextField(
                  title: 'Bidang dan Minat',
                  color: ColorStyle().secondaryColors,
                  textAlign: TextAlign.start,
                ),
                const ContainerField(
                  text: "Bahasa",
                ),
                TittleTextField(
                  title: 'Harga',
                  color: ColorStyle().secondaryColors,
                  textAlign: TextAlign.start,
                ),
                const ContainerField(
                  text: "500.000,00",
                ),
                TittleTextField(
                  title: 'Periode Kelas',
                  color: ColorStyle().secondaryColors,
                  textAlign: TextAlign.start,
                ),
                const ContainerField(
                  text: "3 Bulan",
                ),
                TittleTextField(
                  title: 'Deskripsi Kelas',
                  color: ColorStyle().secondaryColors,
                  textAlign: TextAlign.start,
                ),
                const ContainerField(
                  text:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
                ),
                TittleTextField(
                  title: 'Syarat dan Ketentuan',
                  color: ColorStyle().secondaryColors,
                  textAlign: TextAlign.start,
                ),
                const ContainerField(
                  text:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                ),
                const ContainerField(
                  text:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                ),
                const ContainerField(
                  text:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                ),
                const ContainerField(
                  text:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
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
              style: FontFamily().regulerText.copyWith(
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
