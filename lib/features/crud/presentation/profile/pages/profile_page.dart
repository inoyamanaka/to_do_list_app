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
      body: Container(
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
              style: MyTypography.bodySmall.copyWith(color: Colors.white),
            ),
            SizedBox(height: 10.h),
            Stack(
              children: [
                CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.grey.shade200,
                  child: const CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                ),
                Positioned(
                  bottom: 1,
                  right: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 3,
                        color: Colors.white,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          50,
                        ),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(2, 4),
                          color: Colors.black.withOpacity(
                            0.3,
                          ),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(2),
                      child: Icon(Icons.add_a_photo, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            SizedBox(height: 20.h),
            const ProfileCard(),
          ],
        ),
      ),
    );
  }
}
