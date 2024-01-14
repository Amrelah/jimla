import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        title: const Text('ጅምላ|Jimla'),
        toolbarHeight: kToolbarHeight.sp,
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
                flex: 2,
                child: CardSwiper(
                  padding: const EdgeInsets.only(right: 10,left: 10, bottom: 20,top: 0),
                  cardsCount: 20,
                  backCardOffset: Offset(0.sp, 30.sp),
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
                          margin: EdgeInsets.symmetric(horizontal: 30.0.sp),
                          padding: EdgeInsets.only(top: 30.0.sp),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            margin: EdgeInsets.all(8.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.sp),
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
                                    Text('New Arrival',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25.sp,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text('#Electronics',
                                      style: TextStyle(
                                        color: Colors.yellow,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w400
                                      ),
                                    ),
                                    // Center(
                                    //   child: ElevatedButton(
                                    //     onPressed: (){},
                                    //     child: Text("Get it", style: TextStyle(color: Colors.green,fontSize: 14.sp),)),
                                    // )
                                  ],
                                )),
                          ),
                        ),
                        SizedBox(
                          width: w-60,
                          height: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Image.asset(Images.sunflowerP,fit: BoxFit.fitHeight,height: double.infinity,),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Categories',
                      style: TextStyle(
                          fontSize: 25.sp,
                        fontWeight: FontWeight.w600
                      ),),
                    Text('See all',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18.sp
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: w,
                height: 64.sp,
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
                                    fontSize: 14.sp,
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
              SizedBox(height: 10.sp,),
              Expanded(
                flex: 8,
                child: Container(
                  // color: Colors.blue,
                  margin: EdgeInsets.only(bottom: 50.sp),
                  child: GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        // childAspectRatio: (w/(h*0.5)).sp,
                        // crossAxisSpacing: 10.sp,
                        // mainAxisSpacing: 5.sp
                    ),
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 10.sp),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Detail(),));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Material(
                                elevation: 10,
                                borderRadius: BorderRadius.circular(20.sp),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(10.sp),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                        child: Image.asset(Images.sunflowerP,width: w*0.3,height: w*0.3,fit: BoxFit.fitHeight,)),
                                    Positioned(
                                      bottom: 3.sp,
                                      right: 3.sp,
                                      child: GestureDetector(
                                        onTap: (){},
                                        child: Container(
                                          padding: EdgeInsets.all(7.sp),
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.circular(100)
                                          ),
                                            child: Icon(CupertinoIcons.cart_badge_plus,color: Colors.white,size: 30.sp,)),
                                      )
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.sp,),
                              Text('Product Name ${index+1}',overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text('1234.00 Br',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.sp
                                ),),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.green,
        backgroundColor: Colors.white.withOpacity(0),
        height: 50.sp,
        animationCurve: Curves.easeInExpo,
        items: [
          Icon(Icons.add, size: 35.sp,color: Colors.white,),
          Icon(Icons.favorite, size: 35.sp,color: Colors.white,),
          badges.Badge(
            position: badges.BadgePosition.topEnd(
                top: -15.sp, end: -20.sp),
            badgeStyle: badges.BadgeStyle(
                badgeColor: Colors.white,padding: EdgeInsets.all(5.sp)),
            badgeContent: Text('10',style: TextStyle(
              color: Colors.green,
              fontSize: 14.sp
            ),),
            child: const Icon(Icons.shopping_cart,color: Colors.white,)),
          Icon(Icons.history, size: 35.sp,color: Colors.white,),
          Icon(Icons.person, size: 35.sp,color: Colors.white,),
        ],
        onTap: (ind){
          setState(() {
            ind != 0 ? Navigator.push(context, MaterialPageRoute(builder: (context) => screens[ind]['name'],)) : null;
          });
        },
      ),
      // BottomNavigationBar(
      //     iconSize: 30.sp,
      //     selectedItemColor: Colors.green,
      //     unselectedItemColor: Colors.black,
      //     currentIndex: currIndex,
      //     onTap: (ind){
      //       setState(() {
      //         ind != 0 ? Navigator.push(context, MaterialPageRoute(builder: (context) => screens[ind]['name'],)) : null;
      //       });
      //     },
      //     items: [
      //       const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //       const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
      //       BottomNavigationBarItem(icon: badges.Badge(
      //           position: badges.BadgePosition.topEnd(
      //               top: -15.sp, end: -20.sp),
      //           badgeStyle: badges.BadgeStyle(
      //               badgeColor: Colors.green,padding: EdgeInsets.all(5.sp)),
      //           badgeContent: Text('10',style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 14.sp
      //           ),),
      //           child: const Icon(Icons.shopping_cart)), label: 'Cart'),
      //       const BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Order History'),
      //       const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      //     ]),
    );
  }
}
