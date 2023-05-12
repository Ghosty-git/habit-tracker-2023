import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({super.key});

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 30.h,
      child: Checkbox(value: true, onChanged: (bool) {}, 
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),
      activeColor: Color(0xff37C871),
      checkColor: Color(0xff2F2F2F),
      ),
    );
  }
}