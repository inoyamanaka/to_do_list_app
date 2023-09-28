import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

class MyProjectCard extends StatelessWidget {
  const MyProjectCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: EdgeInsets.all(15.h),
        width: 240,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color(0xff82B0BC),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: Color(0xff33363F),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    AutoSizeText(
                      '12 Dec',
                    ),
                  ],
                ),
                Icon(
                  FontAwesomeIcons.lightbulb,
                  color: Color(0xff33363F),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            AutoSizeText(
              'Belajar Hacking',
              style: MyTypography.bodyLarge,
            ),
            SizedBox(height: 10.h),
            AutoSizeText(
              '''Lorem ipsum dolor si jamet dan kawan-kawan sedang berjalan .....''',
              style: MyTypography.bodyTiny,
            ),
            const SizedBox(height: 20),
            const LinearProgressIndicator(
              value: 0.4,
              backgroundColor: Color(0xffD9D9D9),
              valueColor: AlwaysStoppedAnimation<Color>(
                Color(0xff33363F),
              ),
            ),
            SizedBox(height: 10.h),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Progress'), Text('40%')],
            ),
          ],
        ),
      ),
    );
  }
}
