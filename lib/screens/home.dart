import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jimla/components/home_page/search_textfield.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:jimla/data/screen_data.dart';
import 'package:jimla/path/path_provider.dart';
import 'package:jimla/screens/detail.dart';
import 'package:badges/badges.dart' as badges;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currIndex = 0;
  int selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        title: const Text('ጅምላ|Jimla'),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: h - kBottomNavigationBarHeight,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: CustomSearchTextField(),
              ),
              Expanded(
                flex: 3,
                child: CardSwiper(
                  cardsCount: 20,
                  cardBuilder: (context, index, percentThresholdX, percentThresholdY) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Detail(),));
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: w-60,
                          height: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 30.0),
                          padding: const EdgeInsets.only(top: 30.0),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green,
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black87,
                                    blurRadius: 5,
                                    offset: Offset(2, 4)
                                )
                              ]
                            ),
                            child: Container(
                                margin: EdgeInsets.only(right: w*0.4),
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('New Arrival',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    const Text('#Electronics',
                                      style: TextStyle(
                                        color: Colors.yellow,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400
                                      ),
                                    ),
                                    Center(
                                      child: ElevatedButton(
                                        onPressed: (){},
                                        child: const Text("Get it", style: TextStyle(color: Colors.green),)),
                                    )
                                  ],
                                )),
                          ),
                        ),
                        SizedBox(
                          width: w-60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0, bottom: 10),
                                child: Image.asset(Images.drawer),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                )),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Categories',
                      style: TextStyle(
                          fontSize: 25,
                        fontWeight: FontWeight.w600
                      ),),
                    Text('See all',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: w,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                      itemCount: 30,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedCategory = index;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: selectedCategory == index ? Colors.green : Colors.white70,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: selectedCategory == index ? Colors.green : Colors.black,
                                width: 1
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Cat ${index + 1}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: selectedCategory == index ? Colors.white : Colors.black,
                                  ),
                                ),
                                Icon(Icons.emoji_food_beverage,
                                    color: selectedCategory == index ? Colors.white : Colors.black,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10,
                      );
                  },)
                ),
              ),
              const SizedBox(height: 20,),
              Expanded(
                flex: 8,
                child: Container(
                  padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight + 10),
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: w/(h*0.55),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 0
                    ),
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Detail(),));
                        },
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                  child: Image.asset(Images.drawer,width: w*0.25,height: w*0.3,)),
                            ),
                            ListTile(
                              dense: true,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 5,vertical: 0),
                              title: Text('Product Name ${index+1}',overflow: TextOverflow.ellipsis,),
                              subtitle: const Text('1234.00 Br',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700
                                ),),
                              trailing: Column(
                                children: [
                                  IconButton(
                                      onPressed: (){},
                                      icon: const Icon(CupertinoIcons.cart_badge_plus,color: Colors.green,)),
                                  const Expanded(child: SizedBox())
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black,
          currentIndex: currIndex,
          onTap: (ind){
            setState(() {
              ind != 0 ? Navigator.push(context, MaterialPageRoute(builder: (context) => screens[ind]['name'],)) : null;
            });
          },
          items: [
            const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
            BottomNavigationBarItem(icon: badges.Badge(
                position: badges.BadgePosition.topEnd(
                    top: -15, end: -20),
                badgeStyle: const badges.BadgeStyle(
                    badgeColor: Colors.green),
                badgeContent: const Text('10',style: TextStyle(
                  color: Colors.white
                ),),
                child: const Icon(Icons.shopping_cart)), label: 'Cart'),
            const BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Order History'),
            const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
    );
  }
}
