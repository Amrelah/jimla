import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jimla/components/shared/item_tile.dart';
import 'package:numberpicker/numberpicker.dart';

class CartItemTile extends StatefulWidget {
  final String productName;
  final String category;
  final String price;
  final String image;

  const CartItemTile({super.key, required this.productName, required this.category, required this.price, required this.image});

  @override
  State<CartItemTile> createState() => _CartItemTileState();
}

class _CartItemTileState extends State<CartItemTile> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return ItemTile(
        productName: widget.productName,
        category: widget.category,
        price: widget.price,
        lastWidget: Row(
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  count--;
                });
              },
              child: Container(
                  padding: EdgeInsets.all(5.sp),
                  decoration: BoxDecoration(
                      color: CupertinoColors.activeGreen,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  child: Icon(CupertinoIcons.minus,color: Colors.white,size: 30.sp,)),
            ),
            NumberPicker(
                minValue: 1,
                maxValue: 100,
                value: count,
                itemWidth: 50.sp,
                itemHeight: 40.sp,
                textStyle: TextStyle(
                    color: Colors.black45,
                    fontSize: 15.sp
                ),
                selectedTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 25.sp
                ),
                onChanged: (val){
                  setState(() {
                    count = val;
                  });
                }),
            GestureDetector(
              onTap: (){
                setState(() {
                  count++;
                });
              },
              child: Container(
                  padding: EdgeInsets.all(5.sp),
                  decoration: BoxDecoration(
                      color: CupertinoColors.activeGreen,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  child: Icon(CupertinoIcons.plus,color: Colors.white,size: 30.sp,)),
            )
          ],
        ),
        onPressed: (){},
        image: widget.image,
        iconData: Icons.close,
    );
  }
}
