import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../iternal/helpers/components/custom_buttom_card.dart';
import '../../../../../iternal/helpers/utils.dart';
import '../sign_in/sign_in.dart';

class EmailVereficationScreen extends StatefulWidget {
  const EmailVereficationScreen({super.key});

  @override
  State<EmailVereficationScreen> createState() =>
      _EmailVereficationScreenState();
}

class _EmailVereficationScreenState extends State<EmailVereficationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 38.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'We are send to your email verefication sms, please confirm your email and sign in',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.sp,
                color: const Color(0xff666666),
              ),
            ),
            SizedBox(height: 20.h),
            CustomButtonCard(
              onPressed: () {
                customPushAndRemoveUntil(context, const SignInScreen());
              },
              title: 'Submit',
            ),
          ],
        ),
      ),
    );
  }
}
