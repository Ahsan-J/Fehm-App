import 'package:fehm/blocs/auth_bloc/auth_bloc.dart';
import 'package:fehm/config/navigation.dart';
import 'package:fehm/screens/about.dart';
import 'package:fehm/screens/auth/login.dart';
import 'package:fehm/screens/book/book_detail.dart';
import 'package:fehm/screens/book/book_list.dart';
import 'package:fehm/screens/setting.dart';
import 'package:flutter/material.dart';
import 'package:fehm/screens/home.dart';
import 'package:fehm/screens/terms_condition.dart';
import 'package:fehm/screens/auth/register.dart';
import 'package:fehm/screens/auth/forgot_password.dart';
import 'package:fehm/screens/auth/reset_password.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

main() async {
  await dotenv.load(fileName: ".env");
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          navigatorKey: AppRouter.key,
          initialRoute: '/',
          routes: {
            '/login': (context) => Login(),
            '/': (context) => const Home(),
            '/books': (context) => const BookList(),
            '/register': (context) => RegisterScreen(),
            '/forgot': (context) => ForgotPassword(),
            '/reset': (context) => ResetPassword(),
            '/detail': (context) => BookDetail(),
            '/terms': (context) => TermsConditions(),
            '/about': (context) => AboutScreen(),
            '/settings': (context) => AppSettings(),
          }),
    );
  }
}
