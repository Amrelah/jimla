import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jimla/path/path_provider.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight.sp,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(CupertinoIcons.back)),
        actions: [
          IconButton(
              onPressed: (){
                setState(() {
                  isFav = !isFav;
                });
              },
              icon: Icon(isFav? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              )),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 125.sp),
        child: Column(
          children: [
            Container(
              height: h*0.4,
              width: w,
              color: CupertinoColors.lightBackgroundGray,
                child: Image.asset(Images.sunflowerP,scale: w/(h),)),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.sp,),
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: Text('Xbox series X',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 30.sp
                      ),
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Text('On Sale',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text('The Microsoft Xbox series X gaming console is capable of impressing with minimal'
                      ' boot times and mesmerizing visual effects when playing games at up to 120 frame per second.',
                    style: TextStyle(
                      fontSize: 20.sp
                    ),),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                        width: 1.5
                      ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text('2% Discount on 12+ orders',
                      style: TextStyle(
                          fontSize: 20.sp
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                    border: Border.all(
                            color: Colors.green,
                            width: 1.5
                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text('Long Expiration Date',
                      style: TextStyle(
                          fontSize: 20.sp
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 125.sp,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('1234.00 Br',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text('1224.00 Br',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25.sp
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: (){
              },
              style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(Colors.green),
                  fixedSize: MaterialStatePropertyAll(Size.fromWidth(w*0.5)),
                  padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 10)),
              ),
              child: Text('Add to Cart',
                style: TextStyle(
                    color: Colors.white,
                  fontSize: 20.sp
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
