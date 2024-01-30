import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

class MyToast{

  void success({required String title, required String desc, required BuildContext context}) {


    MotionToast toast = MotionToast.success(
      title: Text(title,
        style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
      ),
      description: Text(
        desc,
        style: const TextStyle(fontSize: 12,color: Colors.white),
      ),
      layoutOrientation: ToastOrientation.ltr,
      animationType: AnimationType.fromRight,
      toastDuration: const Duration(seconds: 4),
      dismissable: true,
      position: MotionToastPosition.top,
    );
    toast.show(context);
  }


  void warning({required BuildContext context, required String title, required String desc}) {
    MotionToast.warning(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(desc),
      animationCurve: Curves.bounceIn,
      borderRadius: 0,
      dismissable: false,
      animationDuration: const Duration(milliseconds: 1000),
    ).show(context);
  }


  void deletion({required BuildContext context, required String title}) async{
    MotionToast del = MotionToast.warning(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20)
              ),
              child: const Text('Yes',
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
                color: Colors.red,
                borderRadius: BorderRadius.circular(20)
              ),
              child: const Text('No',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ],
      ),
      animationCurve: Curves.ease,
      position: MotionToastPosition.top,
      borderRadius: 0,
      toastDuration: const Duration(hours: 1),
    );
    del.show(context);
  }


  void error({required BuildContext context, required String desc}) {
    MotionToast.error(
      title: const Text(
        'Error',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(desc),
      position: MotionToastPosition.top,
      barrierColor: Colors.black.withOpacity(0.3),
      width: 300,
      height: 80,
      dismissable: false,
    ).show(context);
  }

  Future<bool> deletePopUp(BuildContext context, String title)async{
    bool delete = false;
    try{
      delete = await showDialog(
        context: context,
        builder: (context) {
          return Material(
            color: Colors.transparent,
            child: MotionToast.warning(
              title: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              description: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop(true);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: const Text('Yes',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop(false);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: const Text('No',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              animationCurve: Curves.ease,
              position: MotionToastPosition.top,
              borderRadius: 0,
              toastDuration: const Duration(hours: 1),
            ),
          );
        },);
    }catch(err){
      //
    }
    return delete;
  }
}