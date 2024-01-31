import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jimla/components/home_page/categories.dart';
import 'package:jimla/components/home_page/product_item.dart';
import 'package:jimla/shimmer/home/swiper.dart';
import '../components/home_page/search_textfield.dart';
import '../path/path_provider.dart';
import 'detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FocusNode node = FocusNode();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
      height: h,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: CustomSearchTextField(node: node,),
          ),
          node.hasFocus?
          const Expanded(child: SizedBox()) :
          Expanded(
            child: Column(
              children: [
                const Expanded(
                    flex: 2,
                    child: SwiperShimmer(),
              ),
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
                    ],
                  ),
                ),
                const Categories(),
                SizedBox(height: 10.sp,),
                Expanded(
                  flex: 8,
                  child: GridView.builder(
                    padding: EdgeInsets.only(right: 10.sp,left: 10.sp,bottom: 45.sp),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // childAspectRatio: (w/(h*0.5)).sp,
                      // crossAxisSpacing: 10.sp,
                      // mainAxisSpacing: 5.sp
                    ),
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) {
                      return HomeProductItem(index: index);
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
