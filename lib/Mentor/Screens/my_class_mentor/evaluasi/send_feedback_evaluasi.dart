import 'package:flutter/material.dart';
import 'package:my_flutter_app/mentee/screen/premium_class/detail_class_mentor_all_screen.dart';
import 'package:my_flutter_app/mentor/Screens/my_class_mentor/evaluasi/list_evaluasi_mentor_screen.dart';
import 'package:my_flutter_app/mentor/model/my_class_mentor_model.dart';
import 'package:my_flutter_app/mentor/service/send_feedback_evaluation.dart';
import 'package:my_flutter_app/style/fontStyle.dart';
import 'package:my_flutter_app/style/text.dart';
import 'package:my_flutter_app/widget/flushsBar_widget.dart';
import 'package:my_flutter_app/widget/menucategory.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailEvaluasiMenteeMentorScreen extends StatefulWidget {
  final List<FeedbackMyClassMentor> feedbacks;
  final String menteeName;
  final List<Transaction> transactions;
  final String currentMenteeId;
  final List<Evaluation> evaluations;
  final String classId;
  final List<LearningMaterialMentor> learningMaterial;
  DetailEvaluasiMenteeMentorScreen({
    Key? key,
    required this.feedbacks,
    required this.learningMaterial,
    required this.transactions,
    required this.menteeName,
    required this.currentMenteeId,
    required this.evaluations,
    required this.classId,
  }) : super(key: key);

  @override
  State<DetailEvaluasiMenteeMentorScreen> createState() =>
      _DetailEvaluasiMenteeMentorScreenState();
}

class _DetailEvaluasiMenteeMentorScreenState
    extends State<DetailEvaluasiMenteeMentorScreen> {
  List<String> listMateriEvaluasi = [];
  String? selectedMateriFeedback;
  String? selectedEvaluationId;

////// controller ///

  final TextEditingController _materiEvaluasiController2 =
      TextEditingController();
  final TextEditingController _hasilEvaluasiController =
      TextEditingController();
  final TextEditingController _nilaiEvaluasiController =
      TextEditingController();

  // ignore: unused_field
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();

    listMateriEvaluasi = widget.evaluations.map((e) => e.topic ?? "").toList();
  }

  @override
  void dispose() {
    _materiEvaluasiController2.dispose();
    _hasilEvaluasiController.dispose();
    _nilaiEvaluasiController.dispose();

    super.dispose();
  }

  ///sendfeedback///
  void _sendFeedback() async {
    setState(() {
      _isLoading = true;
    });
    if (
        // ignore: unrelated_type_equality_checks
        selectedMateriFeedback == null ||
            _hasilEvaluasiController.text.isEmpty ||
            _nilaiEvaluasiController.text.isEmpty) {
      setState(() {
        _isLoading = false;
      });
      // Tampilkan pesan error jika salah satu field kosong
      showTopSnackBar(context, "Field tidak boleh kosong",
          leftBarIndicatorColor: ColorStyle().errorColors);
      return;
    }
    print('Selected Materi Feedback: $selectedMateriFeedback');
    print('Hasil Evaluasi Controller Text: ${_hasilEvaluasiController.text}');
    print('Nilai Evaluasi Controller Text: ${_nilaiEvaluasiController.text}');

    final errorMessage = await FeedbackService.sendFeedback(
        selectedEvaluationId!,
        widget.currentMenteeId,
        _hasilEvaluasiController.text,
        int.parse(_nilaiEvaluasiController.text));

    setState(() {
      _isLoading = false;
    });

    if (errorMessage == null) {
      // ignore: use_build_context_synchronously
      showTopSnackBar(context, 'Feedback berhasil dikirim.',
          leftBarIndicatorColor: ColorStyle().succesColors);

      // Bersihkan form setelah berhasil
      _hasilEvaluasiController.clear();
      _nilaiEvaluasiController.clear();
      setState(() {
        selectedMateriFeedback = null;
        selectedEvaluationId = null;
      });
    } else {
      // ignore: use_build_context_synchronously
      showTopSnackBar(context, errorMessage,
          leftBarIndicatorColor: ColorStyle().errorColors);
    }
  }

  _launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Tidak dapat membuka $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Rincian Kegiatan",
            style: FontFamily()
                .titleText
                .copyWith(color: ColorStyle().primaryColors),
          ),
        ],
      )),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TittleTextField(
                  title: "Nama Mentee",
                  color: ColorStyle().secondaryColors,
                ),
                Text(widget.menteeName, style: FontFamily().regularText),
                const SizedBox(
                  height: 12,
                ),
                TittleTextField(
                  title: "Jumlah Evaluasi yang di terima",
                  color: ColorStyle().secondaryColors,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${widget.evaluations.length} Evaluasi",
                        style: FontFamily().regularText),
                    const SizedBox(
                      width: 12,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListEvaluasiMentee(
                              nameMentee: widget.menteeName,
                              classId: widget.classId,
                              currentMenteeId: widget.currentMenteeId,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Lihat Semua',
                        style: FontFamily()
                            .buttonText
                            .copyWith(color: ColorStyle().primaryColors),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4),
                        ),
                        border: Border.all(
                            color: ColorStyle().tertiaryColors, width: 2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 12, bottom: 12),
                              child: Text(
                                "Berikan Hasil Evaluasi Mentee",
                                style: FontFamily().boldText.copyWith(
                                    color: ColorStyle().primaryColors,
                                    fontSize: 16),
                              ),
                            ),
                            TittleTextField(
                              title: "Materi Evaluasi",
                              color: ColorStyle().secondaryColors,
                            ),
                            DropdownButtonFormField<String>(
                              value: selectedMateriFeedback,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: ColorStyle().tertiaryColors,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'Pilih materi evaluasi',
                                hintStyle: FontFamily().regularText.copyWith(
                                      color: ColorStyle().disableColors,
                                    ),
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedMateriFeedback = newValue;
                                  // Cari evaluasi yang sesuai dengan topik yang dipilih untuk mendapatkan ID-nya
                                  final selectedEvaluation =
                                      widget.evaluations.firstWhere(
                                    (evaluation) =>
                                        evaluation.topic == newValue,
                                    orElse: () => Evaluation(),
                                  );
                                  selectedEvaluationId = selectedEvaluation
                                      .id; // Perbarui selectedEvaluationId dengan ID yang ditemukan
                                });
                              },
                              items: widget.evaluations
                                  .map<DropdownMenuItem<String>>(
                                (Evaluation evaluation) {
                                  return DropdownMenuItem<String>(
                                    value: evaluation.topic,
                                    child: Text(
                                      evaluation.topic ?? "",
                                      style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
                              isExpanded: true,
                            ),
                            const SizedBox(height: 12),
                            TittleTextField(
                              title: "Hasil Evaluasi",
                              color: ColorStyle().secondaryColors,
                            ),
                            TextFormField(
                              controller: _hasilEvaluasiController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText:
                                      "Masukan hasil dari evaluasi yang di kerjakan oleh mentee",
                                  hintStyle: FontFamily().regularText.copyWith(
                                      color: ColorStyle().disableColors)),
                              maxLines: 5,
                            ),
                            const SizedBox(height: 12),
                            TittleTextField(
                              title: "Nilai Evaluasi",
                              color: ColorStyle().secondaryColors,
                            ),
                            TextFormField(
                              controller: _nilaiEvaluasiController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText:
                                      "Masukan nilai dari evaluasi yang di kerjakan oleh mentee",
                                  hintStyle: FontFamily().regularText.copyWith(
                                      color: ColorStyle().disableColors)),
                            ),
                            const SizedBox(height: 12),
                            Align(
                              alignment: Alignment.centerRight,
                              child: _isLoading
                                  ? CircularProgressIndicator() // Show loading indicator
                                  : SmallElevatedButtonTag(
                                      onPressed: () {
                                        _sendFeedback();
                                      },
                                      height: 40,
                                      width: 118,
                                      title: "Kirim",
                                      style: FontFamily().buttonText.copyWith(
                                            fontSize: 12,
                                            color: ColorStyle().whiteColors,
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
            ),
          ),
        ],
      ),
    );
  }
}
