import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jimla/components/login_signup/password_textfield.dart';
import 'package:jimla/components/login_signup/textfields.dart';
import 'package:jimla/screens/forgot_password.dart';
import 'package:jimla/screens/signup.dart';

import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
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
                Text('ጅምላ|Jimla',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 40.sp
                  ),
                ),
                Text('Login',
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 25.sp
                  ),
                ),
                const CustomTextField(text: 'User Name',),
                const CustomPasswordTextField(text: 'Password',),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPassword(),));
                    },
                    child: const Text('Forgot Password?',
                      style: TextStyle(
                        color: Colors.blue,
                    ),),
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home(),));
                  },
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(Colors.green),
                    fixedSize: MaterialStatePropertyAll(Size.fromWidth(w*0.7))
                  ),
                  child: const Text('Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Signup(),));
                        },
                        child: const Text('Doesn\'t have account? SignUp',
                          style: TextStyle(
                            color: Colors.blue,
                          ),),
                      ),
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
