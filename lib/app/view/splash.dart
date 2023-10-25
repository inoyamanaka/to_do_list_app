import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:to_do_list_app/infrastructure/navigation/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer startTime() {
    const duration = Duration(milliseconds: 1800);

    return Timer(duration, route);
  }

  void route() {
    final box = Hive.box<dynamic>('on_board');
    final token = Hive.box<dynamic>('token_box');

    final isFirst = box.get('isFirst');
    final isLogin = token.get('token');

    if (isFirst == null) {
      Get.offAllNamed<void>(Routes.intro);
    } else if (isFirst == true) {
      if (isLogin == null) {
        Get.offAllNamed<void>(Routes.login);
      } else if (isLogin != null) {
        Get.offAllNamed<void>(Routes.home);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(),
            Stack(
              children: [
                Lottie.asset(
                  'assets/lotties/splash.json',
                  repeat: false,
                  // fit: BoxFit.fitHeight,
                ),
                Positioned(
                  top: 10,
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: ShowUpAnimation(
                    delayStart: const Duration(milliseconds: 150),
                    child: Center(
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          'assets/images/to-do-list.png',
                          width: 130,
                          height: 150,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ShowUpAnimation(
              delayStart: const Duration(milliseconds: 500),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: const BoxDecoration(
                  color: Color(0xff004EFF),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Text(
                  'By Herlambang Kurniawan',
                  // style: MyTypography.bodyLarge,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
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
