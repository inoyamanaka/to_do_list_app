// ignore_for_file: inference_failure_on_function_invocation

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app/features/auth/controller/auth_controller.dart';
import 'package:to_do_list_app/features/auth/data/models/request/login_body.dart';

final AuthController loginX = Get.find<AuthController>();
final TextEditingController email = TextEditingController();
final TextEditingController password = TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Column(
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
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Welcome Back',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                  ),
                ),
                Form(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: email,
                          cursorColor: const Color(0xff171820),
                          decoration: InputDecoration(
                            prefixIconColor: const Color(0xff171820),
                            hintText: 'mail@mail.com',
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: const Icon(FontAwesomeIcons.envelope),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  const BorderSide(color: Color(0xff171820)),
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
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: password,
                          obscureText: !_showPassword,
                          decoration: InputDecoration(
                            hintText: 'password123',
                            labelText: 'Password',
                            hoverColor: Colors.amber,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: const Icon(FontAwesomeIcons.lock),
                            suffixIcon: IconButton(
                              icon: const Icon(FontAwesomeIcons.eye),
                              onPressed: _togglevisibility,
                            ),
                          ),
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
                              email: email.text,
                              password: password.text,
                            );
                            loginX.login(body);
                            // Get.toNamed(Routes.home);
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
                              color: Color(0xff171820), // Border color
                              width: 1.5, // Border width
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
                          onPressed: () {},
                        ),
                        SizedBox(height: 30.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
