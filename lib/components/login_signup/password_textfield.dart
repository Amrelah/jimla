import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPasswordTextField extends StatefulWidget {
  final String text;
  const CustomPasswordTextField({super.key, required this.text});

  @override
  State<CustomPasswordTextField> createState() => _CustomPasswordTextFieldState();
}
bool isSecure = true;
class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        textAlign: TextAlign.center,
        obscureText: isSecure,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: (){
              setState(() {
                isSecure = !isSecure;
              });
            },
              child: Icon(isSecure? CupertinoIcons.eye : CupertinoIcons.eye_slash)),
          label: RichText(text: TextSpan(children: [
            const WidgetSpan(child: Icon(Icons.key)),
            WidgetSpan(child: Text(widget.text)),
          ])),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                  color: Colors.green,
                  width: 2
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                  width: 4,
                  color: CupertinoColors.activeGreen
              )
          ),
        ),
      ),
    );
  }
}
