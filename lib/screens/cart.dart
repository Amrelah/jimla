import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jimla/components/cart/cart_item_tile.dart';
import 'package:jimla/components/cart/date_picker_modal.dart';
import 'package:jimla/toast/toast.dart';

import '../path/path_provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: h,
        child: ListView.builder(
            itemBuilder: (context, index) {
              return CartItemTile(
                  productName: 'Product Name ${index+1}',
                  category: 'Electronics',
                  price: '100.00 Br',
                  image: Images.sunflowerP,);
            },
          itemCount: 30,),
      ),
      bottomNavigationBar: Container(
        color: CupertinoColors.extraLightBackgroundGray,
        height: 290.sp,
        width: w,
        padding: EdgeInsets.only(left: 20,right: 20,top: 20.sp,bottom: 50.sp),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal',
                  style: TextStyle(
                      fontSize: 20.sp
                  ),
                ),
                Text('11,000.00 Br',
                  style: TextStyle(
                      fontSize: 20.sp
                  ),),
              ],
            ),
            SizedBox(height: 10.sp,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Discount',
                  style: TextStyle(
                      fontSize: 20.sp
                  ),
                ),
                Text('746.00 Br',
                  style: TextStyle(
                      fontSize: 20.sp
                  ),),
              ],
            ),
            SizedBox(height: 10.sp,),
            Divider(
              height: 2,
              thickness: 2,
              color: Colors.green.shade200,
              endIndent: 20,
            ),
            const SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                MyToast().success(
                    title: 'ThankYou!!!',
                    desc: 'You have made an order Successfully!!!',
                    context: context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.sp,horizontal: 20.sp),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(40.sp)
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text('Order for 10,254.00  Br',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.sp
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        DatePickerModal().datePicker(context: context);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.greenAccent,
                        radius: 25.sp,
                        child: Icon(CupertinoIcons.hourglass,size: 40.sp,),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.sp,),
            GestureDetector(
              onTap: (){
                MyToast().deletion(
                    context: context,
                    title: 'Are you want to clear the cart?');
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: w*0.5,
                  padding: EdgeInsets.symmetric(vertical: 8.sp,horizontal: 20.sp),
                  decoration: BoxDecoration(
                    color: Colors.red,
                      borderRadius: BorderRadius.circular(40.sp)
                  ),
                  child: Center(
                    child: Text('Clear',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


