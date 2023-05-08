import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFieldCard extends StatelessWidget {
  final TextEditingController controller;

  const CustomTextFieldCard({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.h,
      width: 1.sw,
      child: TextField(
        controller: controller,
        style: const TextStyle(
          color: Color(0xff666666),
          fontFamily: 'Nunito',
        ),
        cursorColor: const Color(0xff666666),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 10.w),
          filled: true,
          fillColor: const Color(0xffFFFFFF),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: BorderSide(
              width: 1.w,
              color: const Color(0xffEDEDED),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: BorderSide(
              width: 1.w,
              color: const Color(0xffEDEDED),
            ),
          ),
        ),
      ),
    );
  }
}
