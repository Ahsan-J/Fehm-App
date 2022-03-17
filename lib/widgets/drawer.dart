import 'package:fehm/api/auth.dart';
import 'package:fehm/blocs/auth_bloc/auth_bloc.dart';
import 'package:fehm/config/navigation.dart';
import 'package:fehm/config/theme.dart';
import 'package:fehm/model/api.dart';
import 'package:fehm/model/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawer extends StatelessWidget {
  List drawerMenu = [
    AppRoute(routeKey: "/about", title: "About"),
    AppRoute(routeKey: '/settings', title: "Settings"),
  ];

  void onLogout(context) async {
    await logout(APIParams());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("auth_user");
    prefs.remove("auth_token");
    BlocProvider.of<AuthBloc>(context).add(RemoveAuthUser());
  }

  AppDrawer({Key? key}) : super(key: key) {
    drawerMenu.addAll([
      AppRoute(action: onLogout, title: "Logout"),
    ]);
  }

  List<Widget> getDrawerMenu(BuildContext context) {
    return drawerMenu.map((entity) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 2.0),
        child: TextButton(
            child: Text(
              entity.title,
              textAlign: TextAlign.left,
              style: GoogleFonts.averageSans(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppTheme.primaryColor,
              ),
            ),
            onPressed: () => entity.action == null
                ? AppRouter.push(entity.routeKey)
                : entity.action(context),
            style: ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0)),
              alignment: Alignment.centerLeft,
            )),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              maxRadius: 40.0,
              child: Icon(Icons.person_pin_circle,
                  size: 50.0, color: AppTheme.primaryColor),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                  if (state is AuthLoggedIn) {
                    return Text(
                        '${state.user.firstName} ${state.user.lastName}',
                        style: GoogleFonts.averageSans(
                          fontSize: 24,
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.bold,
                        ));
                  } else {
                    return const Text("Log in");
                  }
                }),
                const Text("View Profile"),
              ],
            )
          ],
        ),
        const Divider(color: Colors.black),
        ...getDrawerMenu(context),
      ],
    )));
  }
}
