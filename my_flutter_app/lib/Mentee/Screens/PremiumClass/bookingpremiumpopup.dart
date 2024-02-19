import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/widget/paymentwidget.dart';

class BookingPremiumPopupMenu extends StatelessWidget {
  const BookingPremiumPopupMenu({Key? key}) : super(key: key);

  void _showPaymentPopupMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PaymentPopupMenu();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 20.0,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      BookingPremiumPopupMenu()._showPaymentPopupMenu(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "UI/UX Research & Design Class",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 32,
                  color: Color(0xffE78938),
                ),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "UI/UX Research & Design",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal,
                      fontSize: 24,
                      color: Color(0xffE78938),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Kelas UI/UX Research & Design ini akan berjalan selama 3 bulan sesuai dengan syarat & ketentuan yang berlaku. Modul pembelajaran akan diterima setiap meeting zoom berlangsung. Mentee akan mendapatkan modul pembelajaran yang dikirim langsung oleh mentor. Mentee dapat melakukan mentoring secara online dan offline sesuai dengan syarat & ketentuan yang berlaku. Pada setiap topik atau materi mentee akan mengerjakan evaluasi yang akan di review oleh mentor pada aplikasi MentirMatch.",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Syarat & Kententuan",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal,
                      fontSize: 24,
                      color: Color(0xffE78938),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "• Mahasiswa semester 1-7\n"
                    "• Mempunyai Komitmen untuk belajar secara serius\n"
                    "• Kelas berlangsung selama 4 kali dalam seminggu\n"
                    "• Dapat melakukan mentoring secara offline apabila jarak rumah dekat\n"
                    "• Wajib melakukan evaluasi setelah menyelesaikan 1 materi dan seterusnya sampai selesai\n"
                    "• Mentee akan mendapat modul pembelajaran dari mentor ketika zoom meeting\n"
                    "• Memiliki Laptop dengan spesifikasi minimal \n(Prosesor i3/i5, Storage tersisa 160Gb, RAM Minimum 8Gb)",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Price",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.normal,
                          fontSize: 24,
                          color: Color(0xffE78938),
                        ),
                      ),
                      Text(
                        "IDR 1.000.000,00",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        BookingPremiumPopupMenu()._showPaymentPopupMenu(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffE78938), // Background color
                        padding: EdgeInsets.symmetric(
                          vertical: 35.0,
                          horizontal: 135.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: Text(
                        "Booking Class",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
