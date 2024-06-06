import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:my_flutter_app/mentee/screen/homepage_mentee.dart';
import 'package:my_flutter_app/style/fontStyle.dart';
import 'package:my_flutter_app/widget/button.dart';
import 'package:my_flutter_app/widget/flushsBar_widget.dart';
import 'package:my_flutter_app/widget/menucategory.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentErrorScreenMentee extends StatefulWidget {
  final String classname;
  final String mentorname;
  final int price;
  // final String paymentdate;
  final String rejectReason;
  final int uniqueId;
  PaymentErrorScreenMentee(
      {Key? key,
      required this.mentorname,
      required this.classname,
      required this.price,
      // required this.paymentdate,
      required this.uniqueId,
      required this.rejectReason})
      : super(key: key);

  @override
  State<PaymentErrorScreenMentee> createState() =>
      _PaymentErrorScreenMenteeState();
}

class _PaymentErrorScreenMenteeState extends State<PaymentErrorScreenMentee> {
  final String phoneNumber =
      "+6281362845327"; // Ganti dengan nomor telepon tujuan

  Future<void> _launchWhatsApp() async {
    final String url = "https://wa.me/$phoneNumber";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  String formatCurrency(int amount) {
    final formatter = NumberFormat.currency(
        locale: 'id_ID', symbol: 'Rp. ', decimalDigits: 0);
    return '${formatter.format(amount)},00';
  }

  @override
  Widget build(BuildContext context) {
    int totalAmount = widget.price + widget.uniqueId;
    return Scaffold(
      appBar: AppBar(),
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: 800,
          child: ListView(
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 12.0,
                        left: 24.0,
                        right: 8.0,
                        bottom: 8.0,
                      ),
                      child: Text(
                        'Transaksi Gagal',
                        style: FontFamily().boldText.copyWith(
                              fontSize: 26,
                              color: ColorStyle().errorColors,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24.0, top: 8.0, bottom: 8.0),
                    child: Text(
                      "Mohon maaf. transaksi yang kamu lakukan untuk kelas ini tidak berhasil karena ${widget.rejectReason}",
                      style: FontFamily().regularText.copyWith(
                          color: ColorStyle().disableColors, fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: SizedBox(
                            width: 620,
                            height: 400,
                            child: Image.asset(
                              'Handoff/ilustrator/error.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorStyle().whiteColors,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0,
                                    left: 12,
                                    bottom: 12.0,
                                    right: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Total Pembayaran",
                                            style: FontFamily()
                                                .boldText
                                                .copyWith(fontSize: 14),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              formatCurrency(totalAmount),
                                              style: FontFamily()
                                                  .boldText
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: ColorStyle()
                                                          .secondaryColors,
                                                      fontSize: 18),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0, top: 8.0),
                                          child: Text(
                                            "Nama Kelas",
                                            style: FontFamily()
                                                .boldText
                                                .copyWith(
                                                    color: ColorStyle()
                                                        .primaryColors,
                                                    fontSize: 14),
                                          ),
                                        ),
                                        Tooltip(
                                          message: widget.classname,
                                          child: Text(
                                            widget.classname,
                                            style: FontFamily()
                                                .regularText
                                                .copyWith(
                                                    color: ColorStyle()
                                                        .disableColors),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0, top: 8.0),
                                          child: Text(
                                            "Nama Mentor",
                                            style: FontFamily()
                                                .boldText
                                                .copyWith(
                                                    color: ColorStyle()
                                                        .primaryColors,
                                                    fontSize: 14),
                                          ),
                                        ),
                                        Text(widget.mentorname,
                                            style: FontFamily()
                                                .regularText
                                                .copyWith(
                                                    color: ColorStyle()
                                                        .disableColors)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 8.0, top: 8.0),
                                      child: Text(
                                        "Metode Pembayaran :",
                                        style: FontFamily().boldText.copyWith(
                                            color: ColorStyle().primaryColors,
                                            fontSize: 14),
                                      ),
                                    ),
                                    Text(
                                      "BANK BCA",
                                      style: FontFamily().boldText.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "PT.TINOJER ACADEMY",
                                          style: FontFamily()
                                              .regularText
                                              .copyWith(
                                                  color: ColorStyle()
                                                      .disableColors),
                                        ),
                                        Text(
                                          '1234567890',
                                          style: FontFamily().boldText.copyWith(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            // Menyalin teks ke clipboard
                                            Clipboard.setData(
                                                const ClipboardData(
                                                    text: '1234567890'));

                                            // Tampilkan snackbar atau pesan bahwa teks telah disalin
                                            showTopSnackBar(
                                                context, 'Teks telah disalin');
                                          },
                                          icon: const Icon(Icons.copy),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                    "Silahkan menghubungin kontak admin yang ada di bawah ini untuk informasi lebih lanjut",
                                    style: FontFamily().regularText.copyWith(
                                          fontSize: 14,
                                        )),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Container(
                                    width: 160,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: ColorStyle().succesColors,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: TextButton.icon(
                                        onPressed: () {},
                                        label: Text('Whatsapp',
                                            style: FontFamily()
                                                .boldText
                                                .copyWith(
                                                    color: ColorStyle()
                                                        .whiteColors,
                                                    fontSize: 14)),
                                        icon: Icon(
                                          Icons.phone,
                                          color: ColorStyle().whiteColors,
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
