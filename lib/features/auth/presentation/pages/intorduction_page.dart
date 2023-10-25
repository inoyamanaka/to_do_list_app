// ignore_for_file: avoid_redundant_argument_values, lines_longer_than_80_chars, inference_failure_on_function_invocation, inference_failure_on_instance_creation

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:to_do_list_app/features/auth/presentation/pages/register_page.dart';
import 'package:to_do_list_app/features/auth/presentation/widgets/page_intro.dart';
import 'package:to_do_list_app/infrastructure/constants/constant.dart';
import 'package:to_do_list_app/infrastructure/utils/shared_prefs.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => IntroductionPageState();
}

final prefs = Get.find<SharedPrefs>();

class IntroductionPageState extends State<IntroductionPage> {
  @override
  Widget build(BuildContext context) {
    Hive.box(onBoarding).put('isFirst', true);

    return Scaffold(
      body: IntroductionScreen(
        onDone: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RegisterPage()),
          );
        },
        scrollPhysics: const ClampingScrollPhysics(),
        showDoneButton: true,
        showNextButton: true,
        showBottomPart: true,
        next: const Text('Next', style: TextStyle(fontWeight: FontWeight.w600)),
        showBackButton: true,
        back: const Text('Back', style: TextStyle(fontWeight: FontWeight.w600)),
        done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
        pages: [readingPage(), gamingPage(), sportPage(), holidayPage()],
      ),
    );
  }
}
