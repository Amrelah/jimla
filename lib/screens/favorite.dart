import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../path/path_provider.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0),
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
                                icon: const Icon(Icons.favorite, color: Colors.red,)),
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
                          IconButton(
                              style: const ButtonStyle(
                                padding: MaterialStatePropertyAll(EdgeInsets.all(2)),
                                backgroundColor: MaterialStatePropertyAll(CupertinoColors.activeGreen),
                              ),
                              onPressed: (){},
                              icon: const Icon(CupertinoIcons.cart_badge_plus,color: Colors.white,)),
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
    );
  }
}
