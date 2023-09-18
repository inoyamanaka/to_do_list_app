// ignore_for_file: strict_raw_type

import 'package:get/get.dart';
import 'package:to_do_list_app/features/auth/presentation/introduction/pages/intorduction_page.dart';
import 'package:to_do_list_app/features/crud/presentation/main_menu_page.dart';
import 'package:to_do_list_app/infrastructure/navigation/routes.dart';

class Nav {
  static List<GetPage> routes = [
    // INTRODUCTION
    GetPage(
      name: Routes.home,
      page: () => const IntroductionPage(),
      transition: Transition.cupertino,
    ),

    // MAIN
    GetPage(
      name: Routes.home,
      page: () => const MyMenuPage(),
      transition: Transition.cupertino,
    ),
  ];
}
