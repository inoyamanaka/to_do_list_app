// ignore_for_file: strict_raw_type

import 'package:get/get.dart';
import 'package:to_do_list_app/features/auth/controller/auth_binding.dart';
import 'package:to_do_list_app/features/auth/presentation/pages/intorduction_page.dart';
import 'package:to_do_list_app/features/auth/presentation/pages/login_page.dart';
import 'package:to_do_list_app/features/auth/presentation/pages/register_page.dart';
import 'package:to_do_list_app/features/crud/controller/crud_bindings.dart';
import 'package:to_do_list_app/features/crud/presentation/main_menu_page.dart';
import 'package:to_do_list_app/features/crud/presentation/profile/pages/profile_update_page.dart';
import 'package:to_do_list_app/infrastructure/navigation/routes.dart';

class Nav {
  static List<GetPage> routes = [
    // INTRODUCTION
    GetPage(
      name: Routes.intro,
      binding: AuthBinding(),
      page: () => const IntroductionPage(),
      transition: Transition.cupertino,
    ),

    // REGISTER
    GetPage(
      name: Routes.register,
      binding: AuthBinding(),
      page: () => const RegisterPage(),
      transition: Transition.cupertino,
    ),

    // LOGIN
    GetPage(
      name: Routes.login,
      binding: AuthBinding(),
      page: () => const LoginPage(),
      transition: Transition.cupertino,
    ),

    // MAIN
    GetPage(
      name: Routes.home,
      page: () => const MyMenuPage(),
      binding: CrudBinding(),
      transition: Transition.cupertino,
    ),

    // PROFILE
    GetPage(
      name: Routes.profileUpdate,
      page: () => const ProfileUpdatePage(),
      binding: CrudBinding(),
      transition: Transition.cupertino,
    ),
  ];
}
