import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderMainTile extends StatelessWidget {
  final String firstText;
  final String secondText;
  final String price;
  final int itemQuan;
  final Widget expWidget;
  final IconData iconData;
  final Color color;

  const OrderMainTile({super.key, required this.firstText, required this.secondText, required this.itemQuan, required this.expWidget, required this.iconData, required this.color, required this.price,});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.width;
    return SizedBox(
      height: h,
      child: ListView.separated(
          itemBuilder: (context, index) => ExpandablePanel(
            header: ListTile(
              contentPadding: const EdgeInsets.only(right: 0,left: 10),
              leading: Icon(iconData, color: color,size: 30.sp,),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(firstText,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 20.sp
                    ),),
                  Text(secondText,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 20.sp
                    ),),
                ],
              ),
              subtitle: Text('$itemQuan items',
                style: TextStyle(
                    fontSize: 16.sp
                ),),
              trailing: Text('$price Br',
                style: TextStyle(
                    fontSize: 20.sp
                ),),
              focusColor: Colors.green,
              splashColor: Colors.green,
            ),
            expanded: ExpandableButton(
                child: expWidget
            ),
            collapsed: const SizedBox(),
          ),
          separatorBuilder: (context, index) => const Divider(height: 2,color: Colors.black,thickness: 2),
          itemCount: 20),
    );
  }
}
