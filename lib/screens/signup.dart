import 'package:flutter/material.dart';
import 'package:jimla/components/login_signup/password_textfield.dart';
import 'package:jimla/components/login_signup/phone_textfield.dart';
import 'package:jimla/components/login_signup/textfields.dart';
import 'package:jimla/screens/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
                const Text('ጅምላ|Jimla',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 40
                  ),
                ),
                const Text('SignUp',
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 25
                  ),
                ),
                const CustomTextField(text: 'First Name',),
                const CustomTextField(text: 'Last Name',),
                const CustomPhoneTextField(),
                const CustomPasswordTextField(text: 'Password',),
                const CustomPasswordTextField(text: 'Re-Enter Password',),
                ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login(),));
                  },
                  style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(Colors.green),
                      fixedSize: MaterialStatePropertyAll(Size.fromWidth(w*0.7))
                  ),
                  child: const Text('SignUp',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login(),));
                      },
                      child: const Text('Already have account? SignIn',
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
