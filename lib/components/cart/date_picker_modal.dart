import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DatePickerModal{

  Future datePicker({required BuildContext context}){
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return showModalBottomSheet(
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) => Container(
        height: 350.sp,
        width: w,
        decoration: BoxDecoration(
            color: Colors.green.shade700,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40)
            )
        ),
        child: Column(
          children: [
            Expanded(
              child: CupertinoTheme(
                data: CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                        dateTimePickerTextStyle: TextStyle(
                            color: CupertinoColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp
                        )
                    )
                ),
                child: CupertinoDatePicker(
                  showDayOfWeek: true,
                  minimumDate: DateTime.now(),
                  initialDateTime: DateTime.now(),
                  backgroundColor: Colors.transparent,
                  onDateTimeChanged: (val){},
              
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: const Text('Cancel',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                    decoration: BoxDecoration(
                        color: CupertinoColors.activeGreen,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: const Text('Set',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.sp,)
          ],
        ),
      ),);
  }
}