import 'package:flutter/material.dart';
import 'package:to_do_list_app/features/crud/controller/crud_controller.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({
    required this.dayName,
    required this.day,
    required this.monthName,
    required this.year,
    required this.result,
    super.key,
  });

  final String dayName;
  final int day;
  final String monthName;
  final int year;
  final CrudController result;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(
                  'assets/images/avatar.png',
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  result.user_data[0][0].username,
                  style: MyTypography.bodySmall.copyWith(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '''$dayName, $day $monthName $year''',
                  style: MyTypography.bodyTiny.copyWith(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
