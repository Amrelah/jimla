import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class CustomPhoneTextField extends StatefulWidget {
  const CustomPhoneTextField({super.key});

  @override
  State<CustomPhoneTextField> createState() => _CustomPhoneTextFieldState();
}

class _CustomPhoneTextFieldState extends State<CustomPhoneTextField> {
  TextEditingController cont = TextEditingController();
  String errMessage = '';

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        onChanged: (val){
          errMessage = '';
          if((cont.text.length == 1 && !(val=='7' || val=='9'))){
            cont.text = '';
            errMessage = 'The number must start with 7 or 9';
          }
          setState(() {
          });
        },
        maxLength: 9,
        controller: cont,
        decoration: InputDecoration(
          prefixIcon: ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
            child: CountryCodePicker(
              initialSelection: 'ET',
              dialogSize: Size.fromWidth(w/2),
            )
          ),
          label: RichText(text: const TextSpan(children: [
            WidgetSpan(child: Icon(Icons.phone)),
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
          counter: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(errMessage),
              Text('${cont.length}/9'),
            ],
          )
        ),
      ),
    );
  }
}
