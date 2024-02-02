import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class SwiperShimmer extends StatelessWidget {
  const SwiperShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      baseColor: Colors.green,
      highlightColor: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.only(right: 10,left: 10, bottom: 20,top: 0),
        child: Stack(
            children: [
              Container(
                width: w-60,
                // height: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 30.0.sp),
                padding: EdgeInsets.only(top: 30.0.sp),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  margin: EdgeInsets.all(8.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.sp),
                      color: Colors.white70,
                  ),
                  child: Container(
                      margin: EdgeInsets.only(right: w*0.4),
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: Colors.white,
                            width: 0.4*w,
                            height: 30.sp,
                          ),
                          Container(width: 0.3*w,height: 25.sp,color: Colors.black45,)
                        ],
                      )),
                ),
              ),
              SizedBox(
                width: w-60,
                height: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10,right: 20.sp,top: 45.sp),
                      child: Icon(CupertinoIcons.photo_fill,
                        color: Colors.white,
                        size: 70.sp,
                        fill: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}
