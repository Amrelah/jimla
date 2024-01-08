import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePickerModal{

  Future datePicker({required BuildContext context}){
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return showModalBottomSheet(
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) => Container(
        height: 350,
        width: w,
        decoration: const BoxDecoration(
            color: CupertinoColors.activeGreen,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40)
            )
        ),
        child: CupertinoTheme(
          data: const CupertinoThemeData(
              textTheme: CupertinoTextThemeData(
                  dateTimePickerTextStyle: TextStyle(
                      color: CupertinoColors.white,
                      fontWeight: FontWeight.bold
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
      ),);
  }
}