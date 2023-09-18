import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      titleSpacing: 10.w,
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kirito',
            style: MyTypography.bodySmall,
          ),
          Text(
            'Rabu, 03 Maret 2023',
            style: MyTypography.bodyTiny,
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
          color: Colors.black,
          onPressed: () {},
        ),
      ],
    );
  }
}
