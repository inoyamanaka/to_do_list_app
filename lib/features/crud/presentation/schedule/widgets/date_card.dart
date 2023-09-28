// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

List<String> days = ['Mon', 'Thu', 'Wed', 'Tue', 'Fri', 'Sat', 'Sun'];
List<int> daysMath = [3, 2, 1, 0, -1, -2, -3];

class DateCard extends StatefulWidget {
  const DateCard({
    required this.index,
    required this.getIndex,
    required this.selectedIndex,
    super.key,
  });
  final int index;
  final void Function(int index) getIndex;
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
    final dateTime = DateFormat('dd').format(DateTime.now());
    final date = int.parse(dateTime) - daysMath[widget.index];
    return InkWell(
      onTap: () {
        setState(() {
          widget.getIndex(widget.index);
        });
        print(widget.index);
        print(widget.selectedIndex);
      },
      child: Container(
        width: 50.w,
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
                date.toString(),
                style: MyTypography.bodySmall,
              ),
              const SizedBox(height: 5),
              Text(
                days[widget.index],
                style: MyTypography.bodySmall.copyWith(fontSize: 15),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
