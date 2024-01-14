import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:slide_countdown/slide_countdown.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    final defaultTheme = PinTheme(
      width: 70.sp,
      height: 80.sp,
      textStyle: const TextStyle(
        fontSize: 22,
        color: CupertinoColors.activeGreen,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: Colors.green),
      ),
    );
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Verification',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20,),
          Text('Enter the code sent to the number',
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.w700,
              color: Colors.green,
            ),
          ),
          Text('+251-928-66-74-00',
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.w700,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 20,),
          Pinput(
            keyboardType: TextInputType.number,
            defaultPinTheme: defaultTheme,
          ),
          const SizedBox(height: 10,),
          Text('Didn\'t receive code? ',
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: Colors.purple
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: (){
                setState(() {
                  visible = true;
                });
              },
              child: Container(
                width: w*0.4,
                padding: EdgeInsets.symmetric(vertical: 8.sp,horizontal: 20.sp),
                decoration: BoxDecoration(
                    color: !visible? CupertinoColors.activeGreen : Colors.green.shade200,
                    borderRadius: BorderRadius.circular(40.sp)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Resend  ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp
                      ),
                    ),
                    Visibility(
                      visible: visible,
                      child: SlideCountdown(
                        duration: const Duration(minutes: 2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.sp)
                        ),
                        padding: EdgeInsets.symmetric(vertical: 2.sp,horizontal: 8.sp),
                        separatorStyle: const TextStyle(
                          color: Colors.green
                        ),
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16.sp
                        ),
                        showZeroValue: true,
                        shouldShowHours: (dur){
                          return false;
                        },
                        shouldShowDays: (dur){
                          return false;
                        },
                        onDone: (){
                          setState(() {
                            visible = false;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
