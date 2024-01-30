import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jimla/components/order/order_detail_tile.dart';
import 'package:jimla/components/order/order_main_tile.dart';
import 'package:jimla/components/order/tabs.dart';
import 'package:jimla/path/path_provider.dart';
import 'package:jimla/toast/toast.dart';


class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History>{

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 120.sp,
          title: const TabBar(
              isScrollable: true,
              padding: EdgeInsets.only(left: 0,top: 0),
              tabs: [
                Tabs(
                    iconData: CupertinoIcons.check_mark_circled,
                    name: 'Delivered(100)',
                    color: Colors.green),
                Tabs(
                    iconData: Icons.delivery_dining,
                    name: 'Pending(10)',
                    color: Colors.deepOrange),
                Tabs(
                    iconData: CupertinoIcons.timer,
                    name: 'Scheduled(5)',
                    color: Colors.purple),
                Tabs(
                    iconData: CupertinoIcons.clear_circled,
                    name: 'Cancelled(4)',
                    color: Colors.pink),
              ]),
        ),
        body: TabBarView(

          children: [
            // delivered
            OrderMainTile(
                firstText: 'Ordered - Jan 6, 2024',
                secondText: 'Delivered - Jan 25, 2024',
                itemQuan: 21,
                expWidget: SizedBox(
                  height: h/2,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 15.sp),
                    itemCount: 5,
                    itemBuilder: (context, index) => OrderDetailItemTile(
                        productName: 'Product name ${index+1}',
                        category: 'Electronics',
                        price: '1,000.00 Br',
                        onPressed: (){},
                        image: Images.sunflowerP),),
                ),
                iconData: CupertinoIcons.check_mark_circled,
                color: Colors.green,
                price: '11,000.00',
            ),

          //   pending
            OrderMainTile(
              firstText: 'Ordered - Jan 6, 2024',
              secondText: 'Est.Arrival - Jan 25, 2024',
              itemQuan: 15,
              expWidget: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.sp),
                      title: Text('Status: \nonArrival',style: TextStyle(
                        fontSize: 18.sp
                      ),),
                      trailing: IntrinsicWidth(
                        child: Row(
                          children: [
                            Icon(Icons.edit,color: Colors.blue,size: 26.sp,),
                            const SizedBox(width: 10,),
                            GestureDetector(
                                onTap: ()async{
                                  bool delete = await MyToast().deletePopUp(context, 'Are you want to delete this order?');
                                  print('val = $delete');
                                  // MyToast().deletion(context: context, title: "Are you want to delete this order?");
                                },
                                child: Icon(Icons.delete,color: Colors.red,size: 26.sp,)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h/2,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 15.sp),
                        itemCount: 5,
                        itemBuilder: (context, index) => OrderDetailItemTile(
                            productName: 'Product name ${index+1}',
                            category: 'Electronics',
                            price: '999.99 Br',
                            onPressed: (){},
                            image: Images.sunflowerP),),
                    ),
                  ],
                ),
              ),
              iconData: Icons.delivery_dining,
              color: Colors.deepOrange,
              price: '12,750.00',
            ),

          //   scheduled
            OrderMainTile(
              firstText: 'Ordered - Jan 6, 2024',
              secondText: 'Scheduled - Jan 25, 2024',
              itemQuan: 25,
              expWidget: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.sp),
                      title: Text('Status: \nonArrival',style: TextStyle(
                          fontSize: 18.sp
                      ),),
                      trailing: IntrinsicWidth(
                        child: Row(
                          children: [
                            Icon(Icons.edit,color: Colors.blue,size: 26.sp,),
                            const SizedBox(width: 10,),
                            Icon(Icons.delete,color: Colors.red,size: 26.sp,),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h/2,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 15.sp),
                        itemCount: 5,
                        itemBuilder: (context, index) => OrderDetailItemTile(
                            productName: 'Product name ${index+1}',
                            category: 'Electronics',
                            price: '999.99 Br',
                            onPressed: (){},
                            image: Images.sunflowerP),),
                    ),
                  ],
                ),
              ),
              iconData: CupertinoIcons.timer,
              color: Colors.purple,
              price: '10,750.00',
            ),

          //   cancelled
            OrderMainTile(
              firstText: 'Ordered - Jan 6, 2024',
              secondText: 'Canceled - Jan 25, 2024',
              itemQuan: 10,
              expWidget: SizedBox(
                height: h/2,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 15.sp),
                  itemCount: 5,
                  itemBuilder: (context, index) => OrderDetailItemTile(
                      productName: 'Product name ${index+1}',
                      category: 'Electronics',
                      price: '999.99 Br',
                      onPressed: (){},
                      image: Images.sunflowerP),),
              ),
              iconData: CupertinoIcons.clear_circled,
              color: Colors.red,
              price: '500.00',
            ),
          ],
        ),
      ),
    );
  }
}