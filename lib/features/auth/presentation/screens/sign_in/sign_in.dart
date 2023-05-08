import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../iternal/helpers/utils.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/firebase_auth_methods.dart';
import '../reset_password/confirm_email_screen.dart';
import '../sign_up/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  late bool isActive;

  @override
  void initState() {
    isActive = false;
    super.initState();
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  void loginUser() {
    FirebaseAuthMethods(FirebaseAuth.instance).signInWithEmail(
      email: controllerEmail.text,
      password: controllerPassword.text,
      context: context,
    );
  }

  void signInWithGoogle() {
    FirebaseAuthMethods(FirebaseAuth.instance).signInWithGoogle();
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Log In',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 44.sp,
                  ),
                ),
                InkWell(
                  onTap: () {
                    customPushAndRemoveUntil(context, const SignUpScreen());
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: Row(
                      children: [
                        const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            color: Color(0xffFF5C00),
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
            Text(
              'Email',
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'Nunito',
                color: const Color(0xff666666),
              ),
            ),
            SizedBox(height: 10.h),
            CustomTextFieldCard(
              controller: controllerEmail,
            ),
            SizedBox(height: 22.h),
            Text(
              'Password',
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'Nunito',
                color: const Color(0xff666666),
              ),
            ),
            SizedBox(height: 10.h),
            CustomTextFieldCard(
              controller: controllerPassword,
            ),
            SizedBox(height: 27.h),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    isActive = !isActive;
                    setState(() {});
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 700),
                    height: 24.r,
                    width: 24.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      border: Border.all(
                        width: isActive ? 12.r : 2.r,
                        color:
                            isActive ? Colors.green : const Color(0xff666666),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5.w),
                Text(
                  'Remember me',
                  style: TextStyle(
                    color: const Color(0xff7F7F7F),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ConfirmEmailScreen(),
                        ));
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: const Color(0xffFF5C00),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 39.h),
            Container(
              width: 1.sw,
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xffFFA450),
                    Color(0xffFF5C00),
                  ],
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  loginUser();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
            ),
            SizedBox(height: 55.h),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Or log in with:',
                style: TextStyle(
                  color: const Color(0xff7F7F7F),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 18.h),
            InkWell(
              onTap: () => signInWithGoogle(),
              child: Container(
                height: 50.h,
                width: 300.w,
                decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(4.r),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(1, 1),
                      blurRadius: 14.r,
                      color: const Color.fromRGBO(200, 200, 200, 0.15),
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.r),
                  child: SvgPicture.asset(
                    'assets/images/google.svg',
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
