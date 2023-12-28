import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key,});

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}
class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
              onTap: (){},
              child: const Icon(CupertinoIcons.search)),
          label: Center(
            child: RichText(text: const TextSpan(
                children: [
                  WidgetSpan(child: Icon(Icons.shopping_cart)),
                  WidgetSpan(child: Text('Search')),
            ]),),
          ),
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
