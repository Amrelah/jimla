import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key,});

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}
class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16.sp
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 3.sp),
          suffixIcon: GestureDetector(
              onTap: (){},
              child: Icon(CupertinoIcons.search,size: 22.sp,)),
          label: Center(
            child: RichText(text: TextSpan(
                children: [
                  WidgetSpan(child: Icon(Icons.shopping_cart,size: 22.sp,)),
                  const WidgetSpan(child: Text('Search')),
            ]),),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                  color: Colors.green,
                  width: 2.sp
              ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                  width: 4.sp,
                  color: Colors.purple
              )
          ),
          labelStyle: TextStyle(
            fontSize: 20.sp
          )
        ),
      ),
    );
  }
}
