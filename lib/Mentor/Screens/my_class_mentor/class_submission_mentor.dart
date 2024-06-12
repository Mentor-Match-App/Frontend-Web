import 'package:flutter/material.dart';
import 'package:my_flutter_app/mentor/Screens/my_class_mentor/detail_my_class_mentor_screen.dart';
import 'package:my_flutter_app/mentor/Screens/my_class_mentor/edit_class_rejected.dart';
import 'package:my_flutter_app/mentor/model/my_class_mentor_model.dart';
import 'package:my_flutter_app/mentor/service/myClassCreate_Mentor_service.dart';
import 'package:my_flutter_app/style/fontStyle.dart';
import 'package:my_flutter_app/widget/menucategory.dart';

class ClassSubmissionMentorScreen extends StatefulWidget {
  ClassSubmissionMentorScreen({Key? key}) : super(key: key);

  @override
  State<ClassSubmissionMentorScreen> createState() =>
      _ClassSubmissionMentorScreenState();
}

class _ClassSubmissionMentorScreenState
    extends State<ClassSubmissionMentorScreen> {
  late Future<MyClassMentorMondel> classData;
  int _getPriority(AllClass userClass) {
    DateTime now = DateTime.now();
    DateTime startDate = DateTime.parse(
        userClass.startDate.toString()); // Asumsi startDate tidak null
    DateTime endDate = DateTime.parse(
        userClass.endDate.toString()); // Asumsi endDate tidak null

    int getAvailableSlotCount(AllClass userClass) {
      int approvedCount = userClass.transactions
              ?.where((t) => t.paymentStatus == "Approved")
              .length ??
          0;
      int pendingCount = userClass.transactions
              ?.where((t) => t.paymentStatus == "Pending")
              .length ??
          0;
      int totalApprovedAndPendingCount = approvedCount + pendingCount;
      return totalApprovedAndPendingCount;
    }

    int totalApprovedAndPendingCount = getAvailableSlotCount(userClass);

    bool isVerified = userClass.isVerified!;
    bool isActive = userClass.isActive!;
    bool isAvailable = userClass.isAvailable!;
    int maxParticipants = userClass.maxParticipants!;
    String buttonText = "Unavailable";
    bool isRejected = userClass.rejectReason != null;

    // Tentukan warna tombol dan teks berdasarkan kondisi status kelas

    if (isAvailable && totalApprovedAndPendingCount < maxParticipants) {
      buttonText = "Available";
    } else if (!isAvailable && !isVerified && !isActive && isRejected) {
      buttonText = "Rejected";
    } else if (!isAvailable &&
        !isVerified &&
        !isActive &&
        now.isBefore(startDate)) {
      buttonText = "Pending";
    } else if (totalApprovedAndPendingCount >= maxParticipants && !isActive) {
      buttonText = "Full";
    } else if (isActive) {
      buttonText = "Active";
    } else if (totalApprovedAndPendingCount > 0 && now.isAfter(endDate)) {
      buttonText = "Completed";
    } else if (totalApprovedAndPendingCount == 0 && now.isAfter(startDate)) {
      buttonText = "Expired";
    }

    return _calculatePriority(buttonText);
  }

  int _calculatePriority(String buttonText) {
    switch (buttonText) {
      case "Rejected":
        return 1;
      case "Pending":
        return 2;
      default:
        return 8; // Not of interest for our filtered list
    }
  }

  Widget createStatusButton(String title, Color color) {
    return Align(
        alignment: Alignment.centerRight,
        child: Text(
          title,
          style: FontFamily().boldText.copyWith(color: color, fontSize: 14),
        ));
  }

  @override
  void initState() {
    super.initState();
    // Initialize the future without passing userId
    classData = ListClassMentor().fetchClassData();

    /// Filter only pending and rejected classes
    classData.then((value) {
      value.user?.userClass?.retainWhere((userClass) {
        int priority = _getPriority(userClass);
        return priority == 1 || priority == 2;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MyClassMentorMondel>(
      future: classData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
              height: MediaQuery.of(context).size.height / 2.0,
              child: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else if (snapshot.hasData && snapshot.data!.user?.userClass != null) {
          var userClass = snapshot.data!.user!.userClass!;
          if (userClass.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text('Kamu belum memiliki kelas')),
                  )),
            );
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: userClass.map((data) {
                  int approvedTransactionsCount = data.transactions
                          ?.where((transaction) =>
                              transaction.paymentStatus == "Approved")
                          .length ??
                      0;

                  int statusButton = _getPriority(data);
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GestureDetector(
                      onTap: () {
                        if (statusButton == 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditRejectedClass(
                                classData: data,
                              ),
                            ),
                          );
                        } else if (statusButton == 2) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailMyClassMentorScreen(
                                feedbacks: data.feedbacks ?? [],
                                addressMentoring:
                                    data.address ?? 'Meeting Zoom',
                                locationMentoring: data.location ?? '',
                                approvedTransactionsCount:
                                    approvedTransactionsCount,
                                transactions: data.transactions ?? [],
                                evaluation: data.evaluations ?? [],
                                learningMaterial: data.learningMaterial ?? [],
                                userClass: data,
                                aksesLinkZoom: data.zoomLink ?? '',
                                deskripsiKelas: data.description.toString(),
                                classid: data.id.toString(),
                                durationInDays: data.durationInDays ?? 0,
                                endDate: DateTime.parse(data.endDate ?? ''),
                                startDate: DateTime.parse(data.startDate ?? ''),
                                term: data.terms ?? [],
                                maxParticipants: data.maxParticipants ?? 0,
                                schedule: data.schedule ?? '',
                                targetLearning: data.targetLearning ?? [],
                                linkZoom: data.zoomLink ?? '',
                                namaKelas: data.name ?? '',
                              ),
                            ),
                          );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: ColorStyle().tertiaryColors,
                            width: 2,
                          ),
                          color: Colors.transparent,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (statusButton == 1)
                                createStatusButton(
                                    "Rejected", ColorStyle().errorColors),
                              if (statusButton == 2)
                                createStatusButton(
                                    "Pending", ColorStyle().pendingColors),
                              SizedBox(height: 12),
                              Text(data.name ?? '',
                                  style: FontFamily().titleText.copyWith(
                                        color: ColorStyle().primaryColors,
                                      )),
                              SizedBox(height: 12),
                              Text(
                                'Jumlah mentee terdaftar : ${approvedTransactionsCount}',
                                style: FontFamily().regularText,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                //durationIndays
                                'Durasi kelas : ${data.durationInDays} hari',
                                style: FontFamily().regularText,
                              ),
                              const SizedBox(height: 12),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text('Kamu belum memiliki kelas')),
                )),
          );
        }
      },
    );
  }
}
