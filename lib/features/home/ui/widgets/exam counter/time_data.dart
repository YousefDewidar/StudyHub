import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:computers/core/utils/my_colors.dart';
import 'package:computers/core/utils/space.dart';
import 'package:computers/core/utils/strings.dart';
import 'package:computers/features/home/ui/widgets/exam%20counter/num_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimeDataWidget extends StatefulWidget {
  const TimeDataWidget({
    super.key,
  });

  @override
  State<TimeDataWidget> createState() => _TimeDataWidgetState();
}

class _TimeDataWidgetState extends State<TimeDataWidget> {
  Future<Map<String, String>> getTimeRemaining() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    DateTime now = DateTime.now();
    late DateTime time;
    late Duration difference;
    if (pref.containsKey("exam_time") ) {
      time = DateTime.parse(pref.getString('exam_time')!);
      difference = time.difference(now);
      if (difference.inDays < 5) {
        pref.remove('exam_time');
      }
    } else {
      var data =
          await FirebaseFirestore.instance.collection(Strings.examsCol).get();
      Timestamp timestampExam = data.docs.first.data()['exams_time'];
      time = timestampExam.toDate();
      difference = time.difference(now);
      pref.setString("exam_time", "$time");
    }

    Timer.periodic(const Duration(minutes: 1), (timer) => setState(() {}));
    int days = difference.inDays;
    int hours = difference.inHours % 24;
    int minutes = difference.inMinutes % 60;

    return {
      'days': days.toString(),
      'hours': hours.toString(),
      'minutes': minutes.toString(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String>>(
        future: getTimeRemaining(),
        builder: (context, snap) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Directionality(
                    textDirection: snap.data?['days']?.length == 1
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    child: Row(
                      children: [
                        NumberCard(
                          num: snap.data?['days']?.split('')[0] ?? '',
                        ),
                        const SpaceH(10),
                        NumberCard(
                          num: snap.data?['days']
                                  ?.padRight(2, "0")
                                  .split('')[1] ??
                              '',
                        ),
                      ],
                    ),
                  ),
                  const SpaceV(10),
                  Text(
                    "Days",
                    style: TextStyle(color: MyColors.kBackG, fontSize: 16),
                  ),
                ],
              ),
              Column(
                children: [
                  Directionality(
                    textDirection: snap.data?['hours']?.length == 1
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    child: Row(
                      children: [
                        NumberCard(
                          num: snap.data?['hours']?.split('')[0] ?? "",
                        ),
                        const SpaceH(10),
                        NumberCard(
                          num: snap.data?['hours']
                                  ?.padRight(2, "0")
                                  .split('')[1] ??
                              '',
                        ),
                      ],
                    ),
                  ),
                  const SpaceV(10),
                  Text(
                    "Hours",
                    style: TextStyle(color: MyColors.kBackG, fontSize: 16),
                  ),
                ],
              ),
              Column(
                children: [
                  Directionality(
                    textDirection: snap.data?['minutes']?.length == 1
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    child: Row(
                      children: [
                        NumberCard(
                          num: snap.data?['minutes']?.split('')[0] ?? '',
                        ),
                        const SpaceH(10),
                        NumberCard(
                          num: snap.data?['minutes']
                                  ?.padRight(2, "0")
                                  .split('')[1] ??
                              '',
                        ),
                      ],
                    ),
                  ),
                  const SpaceV(10),
                  Text(
                    "Minutes",
                    style: TextStyle(color: MyColors.kBackG, fontSize: 16),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
