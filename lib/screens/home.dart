import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jimla/components/home_page/bot_nav_icon.dart';
import 'package:jimla/data/screen_data.dart';
import 'package:badges/badges.dart' as badges;
import 'package:jimla/toast/toast.dart';

import '../path/path_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currIndex = 2;
  late int lastBackButtonPressTime;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lastBackButtonPressTime = DateTime.now().millisecondsSinceEpoch - 3000;
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        if(currIndex != 2){
          setState(() {
            currIndex = 2;
          });
          return;
        }
        else{
          int currentTime = DateTime.now().millisecondsSinceEpoch;
          if ((currentTime - lastBackButtonPressTime) > 2000) {
            lastBackButtonPressTime = currentTime;
            MyToast().warning(context: context, title: 'Exit', desc: 'Double tap to exit');
          } else {
            SystemNavigator.pop();
          }
        }
      },
      canPop: false,
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          centerTitle: true,
          elevation: 2,
          backgroundColor: Colors.green,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp
          ),
          title: Text(screens[currIndex]['title']),
          toolbarHeight: kToolbarHeight.sp,
        ),
        body: screens[currIndex]['name'],
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.green,
          backgroundColor: Colors.white.withOpacity(0.4),
          height: 50.sp>75? 75 : 50.sp,
          animationCurve: Curves.easeInExpo,
          items: [
            const BotNavIcon(iconData: Icons.favorite),
            badges.Badge(
              position: badges.BadgePosition.topEnd(
                  top: -15.sp, end: -20.sp),
              badgeStyle: badges.BadgeStyle(
                  badgeColor: currIndex==2 ? Colors.white : Colors.green,
                  padding: const EdgeInsets.all(0)),
              badgeContent: DottedBorder(
                strokeWidth: 2,
                color: currIndex==2 ? Colors.green : Colors.white,
                dashPattern: const [8,2],
                padding: EdgeInsets.all(5.sp),
                borderType: BorderType.Circle,
                child: Text('10',style: TextStyle(
                  color: currIndex!=2 ? Colors.white : Colors.green,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold
                ),),
              ),
              child: const BotNavIcon(iconData: Icons.shopping_cart)),
            const BotNavIcon(iconData: Icons.store_mall_directory_rounded),
            const BotNavIcon(iconData: Icons.history),
            CircleAvatar(
              radius: 20.sp,
              child: Image.asset(Images.user,
                fit: BoxFit.fill,
              ),
            ),
            // const BotNavIcon(iconData: Icons.person),
          ],
          onTap: (ind){
            setState(() {
              currIndex = ind;
            });
          },
          index: currIndex,
        ),
      ),
    );
  }
}
