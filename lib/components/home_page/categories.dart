import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
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
    );
  }
}
