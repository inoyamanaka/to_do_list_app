// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

List<String> days = ['Mon', 'Thu', 'Wed', 'Tue', 'Fri', 'Sat', 'Sun'];
List<int> daysMath = [-6, -5, -4, -3, -2, -1, 0];
DateTime today = DateTime.now();
List<String> next7Days = List.generate(7, (index) {
  final nextDate = today.add(Duration(days: index));
  return DateFormat('dd').format(nextDate);
});

List<String> next7DaysName = List.generate(7, (index) {
  final nextDate = today.add(Duration(days: index));
  final fullDayName = DateFormat('EEEE').format(nextDate);
  final shortDayName = fullDayName.substring(0, 3);
  return shortDayName;
});

List<String> next7DaysMon = List.generate(7, (index) {
  final nextDate = today.add(Duration(days: index));
  return DateFormat.MMM().format(nextDate);
});

List<String> next7DaysMonFull = List.generate(7, (index) {
  final nextDate = today.add(Duration(days: index));
  return DateFormat.MMMM().format(nextDate);
});

class DateCard extends StatefulWidget {
  const DateCard({
    required this.index,
    required this.getIndex,
    required this.selectedIndex,
    super.key,
    this.getDate,
  });
  final int index;
  final void Function(int index) getIndex;
  final void Function(String index)? getDate;

  final int selectedIndex;

  @override
  State<DateCard> createState() => _DateCardState();
}

class _DateCardState extends State<DateCard> {
  void doTest(int index) {
    widget.getIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.getIndex(widget.index);
          widget.getDate!(
            '${next7Days[widget.index]} ${next7DaysMonFull[widget.index]} 2023',
          );
        });
      },
      child: Container(
        width: 60.w,
        decoration: BoxDecoration(
          color: widget.index == widget.selectedIndex
              ? const Color(0xff989CBC)
              : Colors.white,
          border: Border.all(
            width: 2,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: FittedBox(
          child: Column(
            children: [
              const SizedBox(height: 15),
              Text(
                next7DaysName[widget.index],
                style: MyTypography.bodySmall.copyWith(fontSize: 14),
              ),
              const SizedBox(height: 5),
              Text(
                next7Days[widget.index],
                style: MyTypography.bodySmall
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                next7DaysMon[widget.index],
                style: MyTypography.bodySmall.copyWith(fontSize: 14),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
