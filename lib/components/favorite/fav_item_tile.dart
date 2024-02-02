import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jimla/components/shared/item_tile.dart';

class FavItemTile extends StatelessWidget {
  final String productName;
  final String category;
  final String price;
  final String image;

  const FavItemTile({super.key, required this.productName, required this.category, required this.price, required this.image});

  @override
  Widget build(BuildContext context) {
    return ItemTile(
      productName: productName,
      category: category,
      price: price,
      lastWidget: GestureDetector(
        onTap: (){},
        child: Container(
            padding: EdgeInsets.all(7.sp),
            margin: EdgeInsets.only(top: 40.sp,bottom: 10.sp),
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(100)
            ),
            child: Icon(CupertinoIcons.cart_badge_plus,color: Colors.white,size: 30.sp,)),
      ),
      onPressed: (){},
      image: image,
      iconData: Icons.favorite,
    );
  }
}
