// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_list_app/infrastructure/constants/app_color.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

List<String> categoryList = [
  'Olahraga',
  'Hiburan',
  'Pekerjaan',
  'Belajar',
  'Ibadah',
  'Hobi',
];

List<double> percentBar = [0.45, 0.54, 0.87, 0.33, 0.60, 0.15];

Column progressBar(
  double value,
  int index,
) {
  return Column(
    children: [
      Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(strokeAlign: 1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: TweenAnimationBuilder(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
          tween: Tween<double>(
            begin: 0,
            end: value,
          ),
          builder: (context, value, child) => LinearProgressIndicator(
            minHeight: 25.h,
            value: value,
            color: colorList[index][0],
            backgroundColor: colorList[index][1],
          ),
        ),
      ),
      SizedBox(height: 10.h),
    ],
  );
}

Column categoryBar(int index) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 110.w,
            child: Row(
              children: [
                Container(
                  width: 20.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: colorList[index][0],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(35),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  categoryList[index],
                  style: MyTypography.bodyTiny,
                ),
              ],
            ),
          ),
          Text(
            '191/202',
            style: MyTypography.bodyTiny,
          ),
          Text(
            '12%',
            style: MyTypography.bodyTiny,
          ),
        ],
      ),
      SizedBox(height: 5.h),
      Divider(
        height: 5.h,
        color: Colors.black,
      ),
      SizedBox(height: 10.h),
    ],
  );
}
