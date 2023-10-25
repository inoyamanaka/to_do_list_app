// ignore_for_file: inference_failure_on_instance_creation, unawaited_futures,
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app/features/auth/controller/auth_controller.dart';
import 'package:to_do_list_app/features/auth/data/models/request/register_body.dart';
import 'package:to_do_list_app/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:to_do_list_app/infrastructure/navigation/routes.dart';

final AuthController registerX = Get.find<AuthController>();
final TextEditingController username = TextEditingController();
final TextEditingController email = TextEditingController();
final TextEditingController password = TextEditingController();

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  void dispose() {
    super.dispose();
    email.clear();
    username.clear();
    password.clear();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: ClipPath(
                  clipper: WaveClipperTwo(),
                  child: Container(
                    height: 200.h,
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
                    'Create Account',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
              ),
              Form(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Column(
                    children: [
                      AuthTextField(
                        label: 'Username',
                        icon: const Icon(FontAwesomeIcons.user),
                        controller: username,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AuthTextField(
                        label: 'Email',
                        icon: const Icon(FontAwesomeIcons.envelope),
                        controller: email,
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
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xff171820), // Background color
                        ),
                        onPressed: () async {
                          await registerX.register(
                            RegisterBody(
                              email: email.text,
                              username: username.text,
                              password: password.text,
                            ),
                          );
                          Get.toNamed<void>(Routes.login);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(15),
                          child: Center(child: Text('Sign up')),
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
                            padding: EdgeInsets.all(15),
                            child: Text(
                              'Log in',
                              style: TextStyle(color: Color(0xff171820)),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          Get.toNamed<void>(Routes.login);
                        },
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
    );
  }
}
