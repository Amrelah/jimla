import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BotNavIcon extends StatelessWidget {
  final IconData iconData;
  const BotNavIcon({super.key, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      size: 30.sp,
      color: Colors.white,);
  }
}
