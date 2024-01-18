import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemTile extends StatelessWidget {
  final String productName;
  final String category;
  final String price;
  final Widget lastWidget;
  final Function onPressed;
  final String image;
  final IconData iconData;

  const ItemTile({super.key, required this.productName, required this.category, required this.price, required this.lastWidget, required this.onPressed, required this.image, required this.iconData});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
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
                      width: (w*0.3).sp,
                      height: (w*0.3).spMax,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.sp)
                      ),
                      child: Image.asset(image,fit: BoxFit.fitHeight,)),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.only(right: 5.sp,left: 16.sp),
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
                      trailing: Column(
                        children: [
                          IconButton(
                              onPressed: (){onPressed;},
                              icon: Icon(iconData,size: 25.sp,color: Colors.red,)),
                          const Expanded(child: SizedBox())
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
