import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final IconData icon;
  const CustomTextField({super.key, required this.text,this.icon = Icons.person});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          label: RichText(text: TextSpan(children: [
            WidgetSpan(child: Icon(icon)),
            WidgetSpan(child: Text(text)),
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
                  color: Colors.purple
              )
          ),
        ),
      ),
    );
  }
}
