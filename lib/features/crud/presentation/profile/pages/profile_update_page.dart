import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

class ProfileUpdatePage extends StatefulWidget {
  const ProfileUpdatePage({super.key});

  @override
  State<ProfileUpdatePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfileUpdatePage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController address = TextEditingController();

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
              'Profile Update',
              style: MyTypography.bodySmall.copyWith(color: Colors.white),
            ),
            SizedBox(height: 10.h),
            SizedBox(height: 10.h),
            SizedBox(height: 20.h),
            Expanded(
              child: ShowUpAnimation(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  height: screenSize.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15.r),
                      topLeft: Radius.circular(15.r),
                    ),
                    color: const Color(0xffF3F3F3),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Personal Information',
                              style: MyTypography.bodySmall,
                            ),
                            const SizedBox(height: 15),
                            UpdateFormField(
                              title: 'Name',
                              controller: name,
                            ),
                            const SizedBox(height: 25),
                            UpdateFormField(
                              title: 'Phone number',
                              controller: name,
                            ),
                            const SizedBox(height: 25),
                            UpdateFormField(
                              title: 'Email',
                              controller: name,
                            ),
                            const SizedBox(height: 25),
                            UpdateFormField(
                              title: 'Address',
                              controller: name,
                            ),
                            SizedBox(height: 20.h),
                            // Expanded(child: SizedBox(height: 10.h)),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: Color(0xff302727),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.rightFromBracket,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    'Log Out',
                                    style: MyTypography.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UpdateFormField extends StatelessWidget {
  const UpdateFormField({
    required this.title,
    required this.controller,
    super.key,
  });

  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(height: 10.h),
        TextFormField(
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefixIconColor: const Color(0xff171820),
            hintText: 'Herlambang Kurnaiwan',
            labelText: title,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xff171820)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xff171820),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            labelStyle: const TextStyle(
              color: Color(
                0xff171820,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
