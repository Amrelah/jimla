import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailItemTile extends StatelessWidget {
  final String productName;
  final String category;
  final String price;
  final Function onPressed;
  final String image;

  const OrderDetailItemTile({super.key, required this.productName, required this.category, required this.price, required this.onPressed, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.sp),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(20.sp),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 2.sp,horizontal: 16.sp),
          leading: Image.asset(image,fit: BoxFit.fitHeight,),
          title: Text(productName,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                overflow: TextOverflow.ellipsis
            ),),
          subtitle: Text('#$category\n Quan : 5',
            style: TextStyle(
                fontSize: 18.sp,
                overflow: TextOverflow.ellipsis
            ),),
          trailing: Text(price,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                overflow: TextOverflow.ellipsis
            ),
          ),
        ),
      ),
    );
  }
}
