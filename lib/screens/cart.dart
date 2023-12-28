import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../path/path_provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
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
        child: Column(
          children: [
            Container(
              height: (h*0.8)-100,
              padding: const EdgeInsets.only(left: 25),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(10),
                            width: w*0.3,
                            height: w*0.3,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Image.asset(Images.drawer,)),
                        Column(
                          children: [
                            SizedBox(
                              width: w*0.7-25,
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
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              width: w*0.7-25,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('\$100.00'),
                                  Row(
                                    children: [IconButton(
                                        style: const ButtonStyle(
                                          padding: MaterialStatePropertyAll(EdgeInsets.all(2)),
                                          backgroundColor: MaterialStatePropertyAll(CupertinoColors.activeGreen),
                                        ),
                                        onPressed: (){},
                                        icon: const Icon(CupertinoIcons.minus,color: Colors.white,)),
                                      const Text('1'),
                                      IconButton(
                                          style: const ButtonStyle(
                                            padding: MaterialStatePropertyAll(EdgeInsets.all(2)),
                                            backgroundColor: MaterialStatePropertyAll(CupertinoColors.activeGreen),
                                          ),
                                          onPressed: (){},
                                          icon: const Icon(CupertinoIcons.plus,color: Colors.white,)),],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    );
                  }, separatorBuilder: (BuildContext context, int index) {
                    return Divider(height: 20,thickness: 3,endIndent: 25,color: Colors.green.shade200,);
              }, itemCount: 30,),
            ),
            Container(
              color: CupertinoColors.extraLightBackgroundGray,
              height: h*0.2,
              width: w,
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  const ListTile(
                    title: Text('Subtotal',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    trailing: Text('\$11,000.00',
                      style: TextStyle(
                          fontSize: 20
                      ),),
                  ),
                  const ListTile(
                    title: Text('Discount',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    trailing: Text('\$746.00',
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
                      },
                      style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll(Colors.green),
                        fixedSize: MaterialStatePropertyAll(Size.fromWidth(w)),
                        padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 10,)),
                      ),
                      child: const Text('Checkout for \$10,254.00',
                        style: TextStyle(
                            color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
