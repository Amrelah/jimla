import 'package:flutter/material.dart';
import 'package:jimla/components/login_signup/password_textfield.dart';
import 'package:jimla/components/login_signup/textfields.dart';
import 'package:jimla/screens/otp.dart';
import 'package:jimla/screens/signup.dart';

import '../components/login_signup/phone_textfield.dart';
import 'home.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            height: h,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: const BoxDecoration(
              color: Colors.white
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('ጅምላ|Jimla',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 40
                  ),
                ),
                const Text('Forgot Password',
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 25
                  ),
                ),
                const CustomPhoneTextField(),
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Otp(),));
                  },
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(Colors.green),
                    fixedSize: MaterialStatePropertyAll(Size.fromWidth(w*0.7))
                  ),
                  child: const Text('Send',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
