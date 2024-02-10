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
                    child: Shimmer.fromColors(
                      baseColor: Colors.black54,
                      highlightColor: Colors.black12,
                      child: Container(
                        width: w*0.3,
                        height: w*0.3,
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(CupertinoIcons.photo_fill,
                          color: Colors.black45,
                          size: 100.sp,
                          fill: 0.5,
                        ),),
                    ),
                  ),
                ),
                Expanded(
                  child: Shimmer.fromColors(
                    baseColor: Colors.black54,
                    highlightColor: Colors.black12,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.sp),
                      height: w*0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IntrinsicHeight(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                color: Colors.black45,
                                width: w*0.3,
                                height: 20.sp,
                              ),
                                const SizedBox(height: 10,),
                                Container(
                                  color: Colors.black45,
                                  width: w*0.2,
                                  height: 10.sp,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                color: Colors.black45,
                                width: w*0.3,
                                height: 20.sp,
                              ),
                              Container(
                                color: Colors.black45,
                                width: w*0.1,
                                height: 30.sp,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
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
