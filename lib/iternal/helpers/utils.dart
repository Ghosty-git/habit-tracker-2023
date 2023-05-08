import 'package:flutter/material.dart';

Future<dynamic> customPushAndRemoveUntil(BuildContext context, Widget widget) {
  return Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false);
}
