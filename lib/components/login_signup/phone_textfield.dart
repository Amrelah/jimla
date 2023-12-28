import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPhoneTextField extends StatelessWidget {
  const CustomPhoneTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: const ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
            child: DropdownMenu(
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none
                )
              ),
              dropdownMenuEntries: [
                DropdownMenuEntry(value: '1', label: '251'),
                DropdownMenuEntry(value: '1', label: '252'),
                DropdownMenuEntry(value: '1', label: '253'),
                DropdownMenuEntry(value: '1', label: '254'),
              ],
            ),
          ),
          label: RichText(text: TextSpan(children: [
            const WidgetSpan(child: Icon(Icons.phone)),
            WidgetSpan(child: Text('Phone Number')),
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
