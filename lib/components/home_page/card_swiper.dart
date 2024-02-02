import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import '../../path/path_provider.dart';
import '../../screens/detail.dart';


class HomeCardSwiper extends StatelessWidget {
  const HomeCardSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return CardSwiper(
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
    );
  }
}
