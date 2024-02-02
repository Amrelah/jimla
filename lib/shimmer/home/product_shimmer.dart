import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return GridView.builder(
      padding: EdgeInsets.only(right: 10.sp,left: 10.sp,bottom: 45.sp),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        // childAspectRatio: (w/(h*0.5)).sp,
        // crossAxisSpacing: 10.sp,
        // mainAxisSpacing: 5.sp
      ),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(20.sp),
                child: Shimmer.fromColors(
                  baseColor: Colors.black54,
                  highlightColor: Colors.black12,
                  child: Stack(
                    children: [
                      Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(10.sp),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SizedBox(
                            width: w*0.3,
                            height: w*0.3,
                            child: Icon(CupertinoIcons.photo_fill,
                              color: Colors.black45,
                              size: 100.sp,
                              fill: 0.5,
                            ),
                          ),),
                      Positioned(
                          bottom: 3.sp,
                          right: 3.sp,
                          child: GestureDetector(
                            onTap: (){},
                            child: Container(
                                padding: EdgeInsets.all(7.sp),
                                decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(100)
                                ),
                                child: Icon(CupertinoIcons.cart_badge_plus,color: Colors.black45,size: 30.sp,)),
                          )
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.sp,),
              Shimmer.fromColors(
                baseColor: Colors.black54,
                highlightColor: Colors.black12,
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.black45,
                        width: w*0.3,
                        height: 30.sp,
                      ),
                      SizedBox(height: 10.sp,),
                      Container(
                        color: Colors.black45,
                        width: w*0.2,
                        height: 20.sp,
                      ),
                    ]
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
