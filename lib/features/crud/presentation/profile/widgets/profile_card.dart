import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:to_do_list_app/infrastructure/navigation/routes.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ShowUpAnimation(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.r),
              topLeft: Radius.circular(15.r),
            ),
            color: const Color(0xffF3F3F3),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Personal Information',
                    style: MyTypography.bodySmall,
                  ),
                  IconButton(
                    onPressed: () {
                      Get.toNamed<void>(Routes.profileUpdate);
                    },
                    icon: const Icon(
                      FontAwesomeIcons.penClip,
                      size: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Icon(FontAwesomeIcons.userAstronaut),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: MyTypography.bodySmall,
                      ),
                      Text(
                        'Kaveh Uzumaki',
                        style: MyTypography.bodyTiny,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  const Icon(FontAwesomeIcons.phone),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Phone number',
                        style: MyTypography.bodySmall,
                      ),
                      Text(
                        'Kaveh Uzumaki',
                        style: MyTypography.bodyTiny,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  const Icon(FontAwesomeIcons.envelope),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: MyTypography.bodySmall,
                      ),
                      Text(
                        'Kaveh Uzumaki',
                        style: MyTypography.bodyTiny,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  const Icon(FontAwesomeIcons.map),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Address',
                        style: MyTypography.bodySmall,
                      ),
                      Text(
                        'Kaveh Uzumaki',
                        style: MyTypography.bodyTiny,
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(child: SizedBox(height: 10.h)),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Color(0xff302727),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
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
        ),
      ),
    );
  }
}
