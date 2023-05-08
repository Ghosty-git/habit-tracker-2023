import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../iternal/helpers/components/custom_buttom_card.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/firebase_auth_methods.dart';
import 'enter_sms_code_screen.dart';

class ConfirmEmailScreen extends StatefulWidget {
  const ConfirmEmailScreen({super.key});

  @override
  State<ConfirmEmailScreen> createState() => _ConfirmEmailScreenState();
}

class _ConfirmEmailScreenState extends State<ConfirmEmailScreen> {
  final TextEditingController controllerEmail = TextEditingController();

  void resetPassword() {
    FirebaseAuthMethods(FirebaseAuth.instance).resetPassword(
      email: controllerEmail.text.trim(),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 38.w),
        child: Column(
          children: [
            SizedBox(height: 119.h),
            Text(
              'Enter your email below, we will send intruction to reset your password',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 27.h),
            CustomTextFieldCard(controller: controllerEmail),
            SizedBox(height: 27.h),
            CustomButtonCard(
              onPressed: () {
                resetPassword();
              },
              title: 'Submit',
            ),
          ],
        ),
      ),
    );
  }
}
