import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTiles extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final String text;
  const ProfileTiles({super.key, required this.iconData, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListTile(
        leading: Icon(iconData, color: color,size: 40.sp,),
        title: Text(text,
          style: TextStyle(
            fontSize: 25.sp,
            fontWeight: FontWeight.bold
          ),),
      ),
    );
  }
}
