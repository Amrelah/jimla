import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jimla/toast/date_picker_modal.dart';
import 'package:jimla/toast/toast.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:numberpicker/numberpicker.dart';

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
      appBar: AppBar(
        title: const Text('My Cart'),
        centerTitle: true,
      ),
      body: SizedBox(
        height: h,
        child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(20),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              width: w*0.3,
                              height: w*0.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Image.asset(Images.drawer,)),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: w*0.7-40,
                            child: ListTile(
                              contentPadding: const EdgeInsets.only(right: 5,left: 16),
                              title: Text('Product Name ${index+1}'),
                              subtitle: const Text('#Electronics'),
                              trailing: Column(
                                children: [
                                  IconButton(
                                      onPressed: (){},
                                      icon: const Icon(Icons.close)),
                                  const Expanded(child: SizedBox())
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            width: w*0.7-40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('100.00 Br',
                                  style: TextStyle(

                                  ),
                                ),
                                Row(
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
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          itemCount: 30,),
      ),
      bottomNavigationBar: Container(
        color: CupertinoColors.extraLightBackgroundGray,
        height: 240.sp,
        width: w,
        padding: EdgeInsets.only(left: 20,right: 20,top: 20.sp),
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
            // ListTile(
            //   minVerticalPadding: 0,
            //   dense: true,
            //   contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.sp),
            //   title: Text('Discount',
            //     style: TextStyle(
            //         fontSize: 20.sp
            //     ),
            //   ),
            //   trailing: Text('746.00 Br',
            //     style: TextStyle(
            //         fontSize: 20.sp
            //     ),),
            // ),
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
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 10.0,top: 5),
            //     child: ElevatedButton(
            //       onPressed: (){
            //         MyToast().deletion(
            //             context: context,
            //             title: 'Are you want to clear the cart?');
            //       },
            //       style: ButtonStyle(
            //         backgroundColor: const MaterialStatePropertyAll(Colors.red),
            //         fixedSize: MaterialStatePropertyAll(Size.fromWidth(w*0.5)),
            //         padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 10.sp,)),
            //       ),
            //       child: Text('Clear',
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 18.sp
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}


