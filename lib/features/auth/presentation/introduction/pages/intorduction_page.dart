// ignore_for_file: avoid_redundant_argument_values, lines_longer_than_80_chars

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => IntroductionPageState();
}

class IntroductionPageState extends State<IntroductionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        onDone: () {
          if (kDebugMode) {
            print('Done clicked');
          }
        },
        scrollPhysics: const ClampingScrollPhysics(),
        showDoneButton: false,
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

  PageViewModel holidayPage() {
    return PageViewModel(
      title: 'Holiday',
      body:
          'Would you like to immerse yourself in the exciting world of gaming for a while? Grab your controller, join us, and lets embark on a thrilling gaming adventure together',
      image: Center(
        child: Lottie.asset(
          'assets/lotties/beach.json',
          height: 250,
          width: 250,
        ),
      ),
      decoration: getPageDecoration(),
    );
  }

  PageViewModel sportPage() {
    return PageViewModel(
      title: 'Sport activity',
      body:
          'Would you like to immerse yourself in the exciting world of gaming for a while? Grab your controller, join us, and lets embark on a thrilling gaming adventure together',
      image: Center(
        child: Lottie.asset(
          'assets/lotties/sport.json',
          height: 250,
          width: 250,
        ),
      ),
      decoration: getPageDecoration(),
    );
  }

  PageViewModel gamingPage() {
    return PageViewModel(
      title: 'Gaming',
      body:
          'Would you like to immerse yourself in the exciting world of gaming for a while? Grab your controller, join us, and lets embark on a thrilling gaming adventure together',
      image: Center(
        child: Lottie.asset(
          'assets/lotties/gaming.json',
          height: 250,
          width: 250,
        ),
      ),
      decoration: getPageDecoration(),
    );
  }

  PageViewModel readingPage() {
    return PageViewModel(
      title: 'Reading',
      body:
          'Reading books opens doors to new worlds, knowledge, and imagination. Embark on a journey through the pages and let the adventure begin!',
      image: Lottie.asset(
        'assets/lotties/reading_book.json',
        height: 250,
        width: 250,
      ),
      decoration: getPageDecoration(),
    );
  }
}

PageDecoration getPageDecoration() {
  return PageDecoration(
    imagePadding: const EdgeInsets.only(top: 120),
    pageColor: Colors.white,
    bodyPadding: const EdgeInsets.only(top: 8, left: 20, right: 20),
    titlePadding: const EdgeInsets.only(top: 50),
    titleTextStyle: GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    bodyTextStyle: GoogleFonts.poppins(color: Colors.black54, fontSize: 15),
  );
}
