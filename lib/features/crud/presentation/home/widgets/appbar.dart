import 'package:flutter/material.dart';
import 'package:to_do_list_app/features/crud/presentation/home/pages/home_page.dart';
import 'package:to_do_list_app/features/crud/presentation/home/widgets/user_info_card.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    required this.dayName,
    required this.day,
    required this.monthName,
    required this.year,
    super.key,
  });

  final String dayName;
  final int day;
  final String monthName;
  final int year;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: lastStatus,
      builder: (context, value, child) => SliverAppBar(
        pinned: true,
        floating: true,
        elevation: 3,
        backgroundColor: Colors.transparent,
        expandedHeight: 120,
        collapsedHeight: 100,
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsets.zero,
          expandedTitleScale: 1,
          title: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: double.infinity,
            padding: const EdgeInsets.only(left: 8),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff2b5876),
                  Color(0xff4e4376),
                ],
              ),
            ),
            child: UserInfoCard(
              dayName: dayName,
              day: day,
              monthName: monthName,
              year: year,
              result: result,
            ),
          ),
        ),
      ),
    );
  }
}
