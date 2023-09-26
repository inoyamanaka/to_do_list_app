import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_list_app/features/crud/presentation/profile/widgets/profile_card.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff2b5876), Color(0xff4e4376)],
            ),
          ),
          width: screenSize.width,
          height: screenSize.height,
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Text(
                'Profile User',
                style: MyTypography.bodySmall,
              ),
              SizedBox(height: 10.h),
              CircleAvatar(
                radius: 60.r,
              ),
              SizedBox(height: 10.h),
              Container(
                width: 250.w,
                padding: EdgeInsets.all(10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(35.r),
                  ),
                  color: Colors.amber,
                ),
                child: const Center(child: Text('100%')),
              ),
              SizedBox(height: 20.h),
              const ProfileCard(),
            ],
          ),
        ),
      ),
    );
  }
}
