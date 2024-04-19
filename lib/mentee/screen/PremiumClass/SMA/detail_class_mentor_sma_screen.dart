import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_flutter_app/mentee/model/category_SMA_model.dart';
import 'package:my_flutter_app/mentee/screen/PremiumClass/detail_booking_premium_class_screen.dart';
import 'package:my_flutter_app/mentee/service/bookingClassService/bookclass_model.dart';
import 'package:my_flutter_app/mentee/service/bookingClassService/bookclass_service.dart';
import 'package:my_flutter_app/preferences/%20preferences_helper.dart';
import 'package:my_flutter_app/style/text.dart';
import 'package:my_flutter_app/widget/menucategory.dart';

class DetailClassMentorSMA extends StatefulWidget {
  final String locationMentoring;
  final String addressMentoring;
  final String mentorName;
  final List<TransactionSMA>? transaction;
  final String? classId;
  final String classname;
  final int classprice;
  final int classduration;
  final int maxParticipants;
  final DateTime endDate;
  final DateTime startDate;
  final String schedule;
  final String classDescription;
  final List<String>? targetLearning;
  final List<String>? terms;
  final int? durationInDays;
  final MentorSMA mentorData;

  final int price;
  final String? location;
  final String? address;

  DetailClassMentorSMA({
    Key? key,
    required this.locationMentoring,
    required this.addressMentoring,
    required this.classId,
    required this.classname,
    required this.classprice,
    required this.classduration,
    required this.maxParticipants,
    required this.endDate,
    required this.startDate,
    required this.schedule,
    required this.classDescription,
    required this.targetLearning,
    required this.terms,
    required this.durationInDays,
    required this.mentorData,
    required this.price,
    required this.location,
    required this.address,
    required this.transaction,
    required this.mentorName,
    // required this.currentParticipant
  }) : super(key: key);

  @override
  State<DetailClassMentorSMA> createState() => _DetailClassMentorSMAState();
}

class _DetailClassMentorSMAState extends State<DetailClassMentorSMA> {
  int getApprovedTransactionCount() {
    return widget.transaction
            ?.where((t) => t.paymentStatus == "Approved")
            .length ??
        0;
  }

  @override
  Widget build(BuildContext context) {
    String formattedStartDate =
        DateFormat('dd MMMM yyyy').format(widget.startDate);
    String formattedEndDate = DateFormat('dd MMMM yyyy').format(widget.endDate);
    int approvedTransactions = getApprovedTransactionCount();
    int availableSlots = widget.maxParticipants - approvedTransactions;
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Detail Kelas",
            style: FontFamily().boldText.copyWith(
                  color: ColorStyle().primaryColors,
                  fontSize: 18,
                ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TittleTextField(title: widget.classname),
                        Text(
                          '(Bersertifikat)',
                          style: FontFamily().boldText.copyWith(
                                color: ColorStyle().disableColors,
                                fontSize: 18,
                              ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Text(
                            widget.classDescription,
                            style: FontFamily().regularText.copyWith(
                                fontSize: 14,
                                color: ColorStyle().disableColors,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TittleTextField(title: 'Module Pembelajaran '),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: (widget.targetLearning != null &&
                                    widget.targetLearning!.isNotEmpty)
                                ? widget.targetLearning!.map<Widget>((term) {
                                    return Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('\u2022 ',
                                            style: TextStyle(
                                                /* Your bullet point style */)),
                                        Expanded(
                                          child: Text(
                                            term,
                                            style: FontFamily()
                                                .regularText
                                                .copyWith(
                                                    fontSize: 14,
                                                    color: ColorStyle()
                                                        .disableColors,
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    );
                                  }).toList()
                                : [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Text(
                                        "Tidak ada module",
                                        style: FontFamily()
                                            .regularText
                                            .copyWith(
                                                fontSize: 14,
                                                color:
                                                    ColorStyle().disableColors,
                                                fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TittleTextField(title: 'Periode Kelas '),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text(
                            // buat seperti ini 30 Hari ( 24 Februari - 24 Maret 2024)
                            '${widget.durationInDays} Hari ($formattedStartDate - $formattedEndDate)',

                            style: FontFamily().regularText.copyWith(
                                fontSize: 14,
                                color: ColorStyle().disableColors,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TittleTextField(title: 'Harga Kelas'),
                        Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child:
                                // Text(
                                //   'Rp${widget.price},00',
                                //   style: FontFamily().regularText.copyWith(
                                //       fontSize: 14,
                                //       color: ColorStyle().disableColors,
                                //       fontWeight: FontWeight.w500),
                                // ),
                                CustomMoneyText(
                              amount: widget.price,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TittleTextField(title: 'Jumlah Mentee dikelas'),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text(
                            '${widget.maxParticipants} Orang',
                            style: FontFamily().regularText.copyWith(
                                fontSize: 14,
                                color: ColorStyle().disableColors,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TittleTextField(title: 'Sisa Slot Mentee'),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text(
                            '$availableSlots Orang',
                            style: FontFamily().regularText.copyWith(
                                fontSize: 14,
                                color: ColorStyle().disableColors,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TittleTextField(title: 'Hari Kelas'),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text(
                            '${widget.schedule} ',
                            style: FontFamily().regularText.copyWith(
                                fontSize: 14,
                                color: ColorStyle().disableColors,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TittleTextField(title: 'Lokasi Kelas'),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text(
                            widget.locationMentoring,
                            style: FontFamily().regularText.copyWith(
                                fontSize: 14,
                                color: ColorStyle().disableColors,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          "Lokasi : ${widget.address == null || widget.address!.isEmpty ? "Meeting Zoom" : widget.address}",
                          style: FontFamily().regularText.copyWith(
                              fontSize: 14,
                              color: ColorStyle().disableColors,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TittleTextField(title: 'Syarat & Ketentuan Kelas'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: widget.terms?.map<Widget>((term) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('\u2022 ',
                                          style: TextStyle(
                                              // Anda dapat menyesuaikan style dari bullet point di sini jika diperlukan
                                              )),
                                      Expanded(
                                        child: Text(
                                          term,
                                          style: FontFamily()
                                              .regularText
                                              .copyWith(
                                                  fontSize: 14,
                                                  color: ColorStyle()
                                                      .disableColors,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList() ??
                                [
                                  Text(
                                    "No target learning available",
                                    style: FontFamily().regularText.copyWith(
                                        fontSize: 14,
                                        color: ColorStyle().disableColors,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TittleTextField(title: 'Syarat Wajib Kelas'),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('\u2022'),
                            const SizedBox(
                              width: 6,
                            ),
                            Expanded(
                              child: Text(
                                'Setiap selesai materi atau chapter, mentee wajib mengerjakan evaluais yang bisa diakases dalam platform berupa link evaluasi yang nantinya akan di review dan diberikan feedback oleh mentor',
                                style: FontFamily().regularText.copyWith(
                                    fontSize: 14,
                                    color: ColorStyle().disableColors,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('\u2022'),
                            const SizedBox(
                              width: 6,
                            ),
                            Expanded(
                              child: Text(
                                'Mentee hanya dapat melakukan bimbingan atau mentoring selama periode kelas berlangsung. Apabila periode kelas selesai mentee tidak dapat melakukan mentoring kepada mentor.',
                                style: FontFamily().regularText.copyWith(
                                    fontSize: 14,
                                    color: ColorStyle().disableColors,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButtonWidget(
                    onPressed: () {
                      _showDialog(context);
                    },
                    title: 'Pesan kelas',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.symmetric(
              horizontal: 24, vertical: 20), // Atur padding konten
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: ColorStyle().whiteColors,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Booking Class", style: FontFamily().titleText),
              SizedBox(width: 20),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.close_rounded,
                  color: ColorStyle().errorColors,
                ),
              )
            ],
          ),
          content: Container(
            width: 400, // Atur lebar konten sesuai kebutuhan
            child: Column(
              mainAxisSize: MainAxisSize
                  .min, // Gunakan mainAxisSize.min agar widget Column mengikuti lebar konten
              children: [
                Text(
                  "Apakah kamu yakin ingin memesan kelas ini? Langkah ini akan mengamankan tempatmu, pastikan untuk memeriksa kembali detail kelas sebelum mengonfirmasi",
                  textAlign: TextAlign.center,
                  style: FontFamily().regularText.copyWith(
                        fontSize: 14,
                      ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SmallOutlinedButton(
                      style: FontFamily().regularText.copyWith(
                          color: ColorStyle().primaryColors, fontSize: 16),
                      height: 48,
                      width: 150,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      title: "Cancel",
                    ),
                    SmallElevatedButton(
                      style: FontFamily().regularText.copyWith(
                          color: ColorStyle().whiteColors, fontSize: 16),
                      height: 48,
                      width: 150,
                      onPressed: () async {
                        try {
                          // Initialize UserPreferences if not already done.
                          await UserPreferences.init();

                          // Retrieve the user ID from SharedPreferences
                          String? userId = UserPreferences.getUserId();

                          if (userId != null) {
                            BookingResultClass result =
                                await bookClass(widget.classId!, userId);

                            if (result.isSuccess) {
                              int? uniqueCode = result
                                  .uniqueCode; // Here you get the uniqueCode

                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => DetailBookingClass(
                                    durasi: widget.classduration,
                                    nama_kelas: widget.classname,
                                    nama_mentor: widget.mentorName,
                                    price: widget.price,
                                    uniqueCode: uniqueCode!,
                                  ),
                                ),
                                (route) => false,
                              );
                            } else {
                              // tampilkan messege erro dalam bentuk pop up
                              showTopSnackBar(context, result.message);
                            }
                          } else {
                            // If userId is not found, show an error
                            throw Exception(
                                "Anda belum login, silahkan login terlebih dahulu");
                          }
                        } catch (e) {
                          // Show a SnackBar if an exception occurs
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Error: ${e.toString()}"),
                              backgroundColor: ColorStyle().errorColors,
                            ),
                          );
                        }
                      },
                      title: "Booking",
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showTopSnackBar(BuildContext context, String message) {
    Flushbar(
      backgroundColor: ColorStyle().secondaryColors,
      message: message,
      icon: Icon(
        Icons.info_outline,
        size: 28.0,
        color: ColorStyle().whiteColors,
      ),
      duration: Duration(seconds: 3),
      leftBarIndicatorColor: ColorStyle().errorColors,
      margin: EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      flushbarPosition: FlushbarPosition.TOP, // Menampilkan di bagian atas
    ).show(context);
  }
}

class SmallElevatedButton extends StatelessWidget {
  final Function()? onPressed;
  final double height;
  final double width;
  final String title;
  final Color color; // Keep this if you want to allow custom colors
  final TextStyle? style;

  const SmallElevatedButton({
    Key? key,
    this.onPressed,
    this.title = "", // Provide a default value for title
    this.color = Colors.blue, // This will be overridden if not used
    this.style, // You may provide a default style or handle it in the build method
    this.height = 32,
    this.width = 72,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine the color to use, defaulting to ColorStyle().primaryColors if color is Colors.blue
    final buttonColor = color == Colors.blue
        ? MaterialStateProperty.all<Color>(ColorStyle().primaryColors)
        : MaterialStateProperty.all<Color>(color);

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          backgroundColor: buttonColor, // Use the determined color
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: style, // Use the provided style or a default one
        ),
      ),
    );
  }
}

/////otline Button////////

class SmallOutlinedButton extends StatelessWidget {
  final Function()? onPressed;
  final double height;
  final double width;
  final String title;
  final Color color;
  final TextStyle? style;

  const SmallOutlinedButton({
    Key? key,
    this.onPressed,
    this.title = "",
    this.color = Colors.blue,
    this.style,
    this.height = 32,
    this.width = 72,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(
                color: ColorStyle().primaryColors), // Set the border color
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: style,
        ),
      ),
    );
  }
}

class ElevatedButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String? title;
  final Color? color;
  const ElevatedButtonWidget({Key? key, this.onPressed, this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            backgroundColor:
                MaterialStateProperty.all<Color>(ColorStyle().primaryColors)),

        onPressed: onPressed,
        // },
        child: Text(
          title!,
          style: FontFamily().buttonText.copyWith(
                fontSize: 16,
              ),
        ),
      ),
    );
  }
}

class CustomMoneyText extends StatelessWidget {
  final int amount; // Nilai angka dari database

  const CustomMoneyText({Key? key, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Buat formatter untuk mata uang rupiah
    final formatter = NumberFormat.currency(locale: 'id', symbol: 'Rp ');

    // Format nilai angka menjadi format mata uang
    String formattedAmount = formatter.format(amount);

    // Tampilkan teks yang sudah diformat
    return Text(
      formattedAmount,
      style: FontFamily().regularText.copyWith(
          fontSize: 14,
          color: ColorStyle().disableColors,
          fontWeight: FontWeight.w500),
    );
  }
}