import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

PageViewModel holidayPage() {
  return PageViewModel(
    title: 'Holiday',
    body:
        'Experience new horizons, adventure, and relaxation on your holiday getaway!',
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
    body: 'Dive into the world of sports - lets play together and win!',
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
    body: 'Join us for an epic gaming adventure - controller ready!',
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
        'Explore new worlds, knowledge, and imagination through books. Begin your journey',
    image: Lottie.asset(
      'assets/lotties/reading_book.json',
      height: 250,
      width: 250,
    ),
    decoration: getPageDecoration(),
  );
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
