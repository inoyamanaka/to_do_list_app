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
      appBar: AppBar(
        title: Text(
          'Profile User',
          style: MyTypography.bodySmall,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: screenSize.width,
          height: screenSize.height,
          child: Column(
            children: [
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
