import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final presentTime = DateTime.now();
    final dayName = DateFormat('EEEE').format(presentTime);
    final day = presentTime.day;

// Mengonversi nilai bulan menjadi nama bulan
    final monthName = DateFormat('MMMM').format(presentTime);
    final year = presentTime.year;

    return SliverAppBar(
      toolbarHeight: 80,
      elevation: 0,
      titleSpacing: 10.w,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff2b5876), Color(0xff4e4376)],
          ),
        ),
      ),
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kirito',
            style: MyTypography.bodySmall.copyWith(color: Colors.white),
          ),
          Text(
            '$dayName, $day $monthName $year',
            style: MyTypography.bodyTiny.copyWith(color: Colors.white),
          ),
        ],
      ),
      leading: const Padding(
        padding: EdgeInsets.only(left: 15),
        child: CircleAvatar(),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          color: Colors.white,
          onPressed: () {},
        ),
      ],
    );
  }
}
