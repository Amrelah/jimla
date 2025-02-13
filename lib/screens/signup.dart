import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        body: SizedBox(
          height: h,
          child: Center(
            child: SingleChildScrollView(
              child: Container(
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
                    Text('SignUp',
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 25.sp
                      ),
                    ),
                    const CustomTextField(text: 'First Name',),
                    const CustomTextField(text: 'Last Name',),
                    const CustomPhoneTextField(),
                    const CustomPasswordTextField(text: 'Password',),
                    const CustomPasswordTextField(text: 'Re-Enter Password',),
                    Row(
                      children: [
                        Checkbox(
                            value: false,
                            onChanged: (val){}),
                        const Text('I agree to the Terms and Conditions')
                      ],
                    ),
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
        ),
      ),
    );
  }
}
