import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
      width: w,
      height: 64.sp,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 30,
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
              baseColor: Colors.black54,
              highlightColor: Colors.black12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Colors.black,
                      width: 1
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(width: 45.sp,height: 20.sp,color: Colors.black45,),
                    Container(width: 25.sp,height: 25.sp,color: Colors.black45,)
                  ],
                ),
              ),
                      );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 10,
            );
          },
        ),
      ),
    );
  }
}
