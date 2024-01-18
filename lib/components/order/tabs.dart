import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Tabs extends StatelessWidget {
  final IconData iconData;
  final String name;
  final Color color;
  const Tabs({super.key, required this.iconData, required this.name, required this.color});

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: Icon(iconData, color: color,size: 30.sp,),
      child: Text(name, style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: 18.sp
      ),),
    );
  }
}
