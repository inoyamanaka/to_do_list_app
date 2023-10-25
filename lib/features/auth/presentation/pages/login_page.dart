// ignore_for_file: inference_failure_on_function_invocation

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app/features/auth/controller/auth_controller.dart';
import 'package:to_do_list_app/features/auth/data/models/request/login_body.dart';
import 'package:to_do_list_app/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:to_do_list_app/infrastructure/navigation/routes.dart';

final AuthController loginX = Get.find<AuthController>();
final TextEditingController username = TextEditingController();
final TextEditingController password = TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

ValueNotifier<bool> showPassword = ValueNotifier<bool>(true);

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    super.dispose();
    username.clear();
    password.clear();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Obx(
                  () => loginX.loginLoading.isTrue
                      ? Stack(
                          children: <Widget>[
                            // Widget latar belakang gelap transparan
                            ColoredBox(
                              color: Colors.black.withOpacity(0.5),
                              child: const Center(),
                            ),

                            const Padding(
                              padding: EdgeInsets.only(top: 80),
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(),
                ),
                Column(
                  children: [
                    Flexible(
                      child: ClipPath(
                        clipper: WaveClipperTwo(),
                        child: Container(
                          height: 250.h,
                          color: const Color(0xff171820),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Welcome Back',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Form(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 20,
                        ),
                        child: Column(
                          children: [
                            AuthTextField(
                              label: 'Username',
                              icon: const Icon(FontAwesomeIcons.envelope),
                              controller: username,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AuthTextField(
                              label: 'Password',
                              icon: const Icon(FontAwesomeIcons.lock),
                              isPassword: true,
                              controller: password,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: TextButton(
                                child: const Text(
                                  'Forgot Password ?',
                                  style: TextStyle(color: Color(0xff171820)),
                                ),
                                onPressed: () {},
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color(0xff171820), // Background color
                              ),
                              onPressed: () {
                                final body = LoginBody(
                                  email: username.text,
                                  password: password.text,
                                );
                                loginX.login(body);
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(20),
                                child: Center(child: Text('Log in')),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 1,
                                  width: 150,
                                  color: const Color(0xff171820),
                                ),
                                const Text('or'),
                                Container(
                                  height: 1,
                                  width: 150,
                                  color: const Color(0xff171820),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                side: const BorderSide(
                                  color: Color(0xff171820),
                                  width: 1.5,
                                ),
                                backgroundColor: const Color(0xffFFFFFF),
                              ),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(color: Color(0xff171820)),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Get.toNamed<void>(Routes.register);
                              },
                            ),
                            SizedBox(height: 30.h),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
