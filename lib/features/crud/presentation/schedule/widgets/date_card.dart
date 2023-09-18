import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateCard extends StatelessWidget {
  const DateCard({
    required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      decoration: BoxDecoration(
        color: index == 4 ? Colors.green : Colors.white,
        border: Border.all(
          width: 2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: const Column(
        children: [
          SizedBox(height: 15),
          Text('17'),
          SizedBox(height: 15),
          Text('Thu')
        ],
      ),
    );
  }
}
