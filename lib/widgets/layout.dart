import 'package:fehm/config/theme.dart';
import 'package:fehm/widgets/drawer.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {

  final PreferredSizeWidget? appBar;
  final Widget? child;

  AppLayout({ this.appBar, this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ?? AppBar(
        title: const Text('FEHM'),
        backgroundColor: AppTheme.primaryColor,
      ),
      drawer: AppDrawer(),
      body: child,
    );
  }
}
