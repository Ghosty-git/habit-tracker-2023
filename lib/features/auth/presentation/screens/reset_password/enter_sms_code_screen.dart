import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_app_2023/features/auth/presentation/screens/reset_password/reset_password_screen.dart';

import '../../../../../iternal/helpers/components/custom_buttom_card.dart';
import '../../widgets/custom_text_field.dart';

class EnterSmsCodeScren extends StatefulWidget {
  const EnterSmsCodeScren({super.key});

  @override
  State<EnterSmsCodeScren> createState() => _EnterSmsCodeScrenState();
}

class _EnterSmsCodeScrenState extends State<EnterSmsCodeScren> {
  final TextEditingController controllerCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 38.w),
        child: Column(
          children: [
            SizedBox(height: 119.h),
            Text(
              'Enter OTP code we’ve sent to your email',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xff666666),
              ),
            ),
            SizedBox(height: 27.h),
            CustomTextFieldCard(controller: controllerCode),
            SizedBox(height: 27.h),
            CustomButtonCard(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResetPasswordScreen(),
                    ));
              },
              title: 'Submit',
            ),
          ],
        ),
      ),
    );
  }
}
