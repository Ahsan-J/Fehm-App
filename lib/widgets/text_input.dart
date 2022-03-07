import 'package:fehm/config/theme.dart';
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String? placeholder;
  final IconData? icon;
  final void Function(String)? onChangeText;
  TextEditingController? textControl = TextEditingController();

  TextInput({this.placeholder, this.icon, this.onChangeText, this.textControl, Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textControl,
      decoration: InputDecoration(
        prefixIcon: icon == null ? null : Icon(icon, color: AppTheme.primaryColor,),
        hintText: placeholder,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.primaryColor),
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(30.0),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      onChanged: onChangeText,
      onSubmitted: (text) {
        print(text);
      },
    );
  }
}
