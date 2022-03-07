import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fehm/config/theme.dart';

class AppButton extends StatelessWidget {
  final void Function()? onPress;
  final String? text;

  AppButton({this.onPress, this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Text(
        text ?? "",
        style: GoogleFonts.averageSans(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppTheme.primaryColor),
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical:10.0, horizontal: 10.0)),
        shape: MaterialStateProperty.all(const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
        ))
      )
    );
  }
}
