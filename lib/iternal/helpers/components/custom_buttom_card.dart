import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonCard extends StatelessWidget {
  final Function() onPressed;
  final String title;

  const CustomButtonCard({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Nunito',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
