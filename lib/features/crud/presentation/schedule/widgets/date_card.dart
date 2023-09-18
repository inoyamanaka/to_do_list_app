import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

List<String> days = ['Mon', 'Thu', 'Wed', 'Tue', 'Fri', 'Sat', 'Sun'];
List<int> daysMath = [3, 2, 1, 0, -1, -2, -3];

class DateCard extends StatelessWidget {
  const DateCard({
    required this.index,
    super.key,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    final dateTime = DateFormat('dd').format(DateTime.now());
    final date = int.parse(dateTime) - daysMath[index];

    return Container(
      width: 50.w,
      decoration: BoxDecoration(
        color: index == 3 ? const Color(0xff989CBC) : Colors.white,
        border: Border.all(
          width: 2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Text(date.toString()),
          const SizedBox(height: 15),
          Text(days[index])
        ],
      ),
    );
  }
}
