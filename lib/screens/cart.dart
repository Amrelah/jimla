import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                                  children: [IconButton(
                                      style: const ButtonStyle(
                                        padding: MaterialStatePropertyAll(EdgeInsets.all(2)),
                                        backgroundColor: MaterialStatePropertyAll(CupertinoColors.activeGreen),
                                      ),
                                      onPressed: (){
                                        setState(() {
                                          count--;
                                        });
                                      },
                                      icon: const Icon(CupertinoIcons.minus,color: Colors.white,)),
                                    NumberPicker(
                                        minValue: 1,
                                        maxValue: 100,
                                        value: count,
                                        itemWidth: 40,
                                        itemHeight: 30,
                                        textStyle: const TextStyle(
                                          color: Colors.black45,
                                          fontSize: 10
                                        ),
                                        selectedTextStyle: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20
                                        ),
                                        onChanged: (val){
                                          setState(() {
                                            count = val;
                                          });
                                        }),
                                    IconButton(
                                        style: const ButtonStyle(
                                          padding: MaterialStatePropertyAll(EdgeInsets.all(2)),
                                          backgroundColor: MaterialStatePropertyAll(CupertinoColors.activeGreen),
                                        ),
                                        onPressed: (){
                                          setState(() {
                                            count++;
                                          });
                                        },
                                        icon: const Icon(CupertinoIcons.plus,color: Colors.white,)),],
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
        height: 240,
        width: w,
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          children: [
            const ListTile(
              dense: true,
              minVerticalPadding: 0,
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              title: Text('Subtotal',
                style: TextStyle(
                    fontSize: 20
                ),
              ),
              trailing: Text('11,000.00 Br',
                style: TextStyle(
                    fontSize: 20
                ),),
            ),
            const ListTile(
              minVerticalPadding: 0,
              dense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              title: Text('Discount',
                style: TextStyle(
                    fontSize: 20
                ),
              ),
              trailing: Text('746.00 Br',
                style: TextStyle(
                    fontSize: 20
                ),),
            ),
            Divider(
              height: 2,
              thickness: 2,
              color: Colors.green.shade200,
              endIndent: 20,
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: ElevatedButton(
                onPressed: (){
                  MyToast().success(
                      title: 'ThankYou!!!',
                      desc: 'You have made an order Successfully!!!',
                      context: context);
                },
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(Colors.green),
                  fixedSize: MaterialStatePropertyAll(Size.fromWidth(w)),
                  padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 10,)),
                ),
                child: ListTile(
                  dense: true,
                  title: const Center(
                    child: Text('Order for 10,254.00  Br',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: (){
                      DatePickerModal().datePicker(context: context);
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.greenAccent,
                      radius: 25,
                      child: Icon(CupertinoIcons.hourglass,size: 40,),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0,top: 5),
                child: ElevatedButton(
                  onPressed: (){
                    MyToast().deletion(
                        context: context,
                        title: 'Are you want to clear the cart?');
                  },
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(Colors.red),
                    fixedSize: MaterialStatePropertyAll(Size.fromWidth(w*0.5)),
                    padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 10,)),
                  ),
                  child: const Text('Clear',
                    style: TextStyle(
                      color: Colors.white,
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


