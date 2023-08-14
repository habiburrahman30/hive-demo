import 'package:flutter/material.dart';

import '../helpers/hex_color.dart';

class UserUniqueIdentifierInput extends StatelessWidget {
  final String inputLabel;
  final Function onChanged;
  final String hintText;
  final String? initialValue;

  UserUniqueIdentifierInput({
    super.key,
    required this.inputLabel,
    required this.hintText,
    required this.initialValue,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged as Function(String?),
      keyboardType: TextInputType.text,
      initialValue: initialValue,
      decoration: InputDecoration(
        label: Text(
          inputLabel,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: hexToColor('#72778F')),
        ),

        hintText: hintText,
        border: OutlineInputBorder(),
        hintStyle: TextStyle(
          fontFamily: 'Manrope',
          fontSize: 14.0,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: hexToColor('#F2BA14'), width: 1.0),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: hexToColor('#FE0101'), width: 1.0),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: hexToColor('#FE0101'), width: 1.0),
        ),
        //labelText: 'Username',
        // errorText: 'Invalid Email/Username',
      ),
    );
  }
}
