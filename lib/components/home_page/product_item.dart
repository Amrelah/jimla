import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../path/path_provider.dart';
import '../../screens/detail.dart';


class HomeProductItem extends StatelessWidget {
  final int index;
  const HomeProductItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 10.sp),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Detail(),));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(20.sp),
              child: Stack(
                children: [
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(Images.sunflowerP,width: w*0.3,height: w*0.3,fit: BoxFit.fitHeight,)),
                  Positioned(
                      bottom: 3.sp,
                      right: 3.sp,
                      child: GestureDetector(
                        onTap: (){},
                        child: Container(
                            padding: EdgeInsets.all(7.sp),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child: Icon(CupertinoIcons.cart_badge_plus,color: Colors.white,size: 30.sp,)),
                      )
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.sp,),
            Text('Product Name ${index+1}',overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text('1234.00 Br',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.sp
              ),),
          ],
        ),
      ),
    );
  }
}
