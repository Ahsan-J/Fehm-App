
import 'package:flutter/material.dart';

class AppToast extends StatefulWidget {
  const AppToast({Key? key}) : super(key: key);

  @override
  _AppToastState createState() => _AppToastState();
}

class _AppToastState extends State<AppToast> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Expanded(child: Text("The Text here"))
    );
  }
}
