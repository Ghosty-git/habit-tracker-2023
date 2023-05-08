import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../iternal/helpers/components/custom_buttom_card.dart';
import '../../../../../iternal/helpers/components/exceptions.dart';
import '../../../../../iternal/helpers/utils.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/firebase_auth_methods.dart';
import '../sign_in/sign_in.dart';
import 'email_verification.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerConfirm = TextEditingController();

  @override
  void dispose() {
    controllerConfirm.dispose();
    controllerEmail.dispose();
    controllerName.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  void signUpuser() async {
    FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
        name: controllerName.text,
        email: controllerEmail.text,
        password: controllerPassword.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 38.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 89.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 44.sp,
                  ),
                ),
                SizedBox(width: 71.w),
                InkWell(
                  onTap: () {
                    customPushAndRemoveUntil(context, const SignInScreen());
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: Row(
                      children: [
                        Text(
                          'Log In',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 14.sp,
                            color: const Color(0xffFF5C00),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15.r,
                          color: const Color(0xffFF5C00),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 53.h),
            const Text(
              'Name',
              style: TextStyle(
                fontFamily: 'Nunito',
                color: Color(0xff666666),
              ),
            ),
            SizedBox(height: 10.h),
            CustomTextFieldCard(
              controller: controllerName,
            ),
            SizedBox(height: 22.h),
            const Text(
              'Email',
              style: TextStyle(
                fontFamily: 'Nunito',
                color: Color(0xff666666),
              ),
            ),
            SizedBox(height: 10.h),
            CustomTextFieldCard(
              controller: controllerEmail,
            ),
            SizedBox(height: 22.h),
            const Text(
              'Password',
              style: TextStyle(
                fontFamily: 'Nunito',
                color: Color(0xff666666),
              ),
            ),
            SizedBox(height: 10.h),
            CustomTextFieldCard(
              controller: controllerPassword,
            ),
            SizedBox(height: 22.h),
            const Text(
              'Password Confirm',
              style: TextStyle(
                fontFamily: 'Nunito',
                color: Color(0xff666666),
              ),
            ),
            SizedBox(height: 10.h),
            CustomTextFieldCard(
              controller: controllerConfirm,
            ),
            SizedBox(height: 48.h),
            CustomButtonCard(
              onPressed: () {
                if (controllerPassword.text == controllerConfirm.text &&
                    controllerConfirm.text.isNotEmpty &&
                    controllerPassword.text.isNotEmpty &&
                    controllerEmail.text.isNotEmpty &&
                    controllerName.text.isNotEmpty) {
                  signUpuser();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EmailVereficationScreen(),
                      ));
                } else {
                  Exceptions.showFlushbar('please fill in all fields',
                      context: context);
                }
              },
              title: 'Sign Up',
            ),
            SizedBox(height: 59.h),
          ],
        ),
      ),
    );
  }
}
