import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ItemTileShimmer extends StatelessWidget {
  const ItemTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
      width: w,
      height: 64.sp,
      child: Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(20.sp),
          child: SizedBox(
            width: w - 16,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(20.sp),
                    child: Container(
                      padding: EdgeInsets.all(10.sp),
                      width: w*0.3,
                      height: w*0.3,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.sp)
                      ),
                      child: Icon(CupertinoIcons.photo_fill,
                        color: Colors.black45,
                        size: 100.sp,
                        fill: 0.5,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      ListTile(
                          contentPadding: EdgeInsets.only(right: 5.sp,left: 16.sp,bottom: 0),
                          dense: true,
                          style: ListTileStyle.drawer,
                          visualDensity: const VisualDensity(vertical: -4),
                          minVerticalPadding: 0,
                          title: Text(productName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                overflow: TextOverflow.ellipsis
                            ),),
                          subtitle: Text('#$category',
                            style: TextStyle(
                                fontSize: 18.sp,
                                overflow: TextOverflow.ellipsis
                            ),),
                          trailing: IconButton(
                              onPressed: (){onPressed;},
                              icon: Icon(iconData,size: 25.sp,color: Colors.red,))
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(price,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  overflow: TextOverflow.ellipsis
                              ),
                            ),
                            lastWidget
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
