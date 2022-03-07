import 'package:fehm/api/auth.dart';
import 'package:fehm/bloc/auth.dart';
import 'package:fehm/config/navigation.dart';
import 'package:fehm/model/api.dart';
import 'package:fehm/model/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fehm/widgets/app_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  final _loginForm = GlobalKey<FormState>();
  final TextEditingController _emailControl =
      TextEditingController(text: "abc@xyz.com");
  final TextEditingController _passwordControl =
      TextEditingController(text: "qwerty12345");

  Login({Key? key}) : super(key: key);

  void tryLogin(BuildContext context) async {
    var params = APIParams(
        data: {"email": _emailControl.text, "password": _passwordControl.text});

    try {
      var response = await login(params);
      context.read<AuthBloc>().add(SetAuthUser(User.fromJson(response.data)));
      AppRouter.push('/');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'FEHM',
                    style: GoogleFonts.averageSans(
                      fontSize: 52,
                      letterSpacing: 1.8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 0.0),
                  child: Form(
                    key: _loginForm,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          controller: _emailControl,
                          // initialValue: 'abc@xyz.com',
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: 'Email',
                          ),
                          style: const TextStyle(fontSize: 18),
                        ),
                        TextFormField(
                          controller: _passwordControl,
                          obscureText: true,
                          // initialValue: 'qwerty12345',
                          decoration: const InputDecoration(
                            icon: Icon(Icons.lock),
                            labelText: 'Password',
                          ),
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppButton(
                          text: 'Login',
                          onPress: () {
                            tryLogin(context);
                          })
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 0.0),
                      alignment: Alignment.topCenter,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Expanded(
                                flex: 2, child: Divider(color: Colors.black)),
                            Expanded(flex: 1, child: Center(child: Text("OR"))),
                            Expanded(
                                flex: 2,
                                child: Divider(
                                  color: Colors.black,
                                )),
                          ]))),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 0.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        // Expanded(child: IconButton(icon: Icon(AntDesign.google),iconSize: 50.0, color:Color.fromRGBO(219, 50, 54,1.0), onPressed: () {})),
                        // Expanded(child: IconButton(icon: Icon(AntDesign.linkedin_square), iconSize: 50.0,color:Color.fromRGBO(0, 119, 181, 1.0), onPressed: () {})),
                        // Expanded(child: IconButton(icon: Icon(AntDesign.facebook_square,),iconSize: 50.0, color:Color.fromRGBO(66, 103, 178,1.0), onPressed: () {})),
                      ],
                    )),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                              child: const Text("Register yourself"),
                              onPressed: () => AppRouter.push('/register')),
                          TextButton(
                              child: const Text("Forgot Password"),
                              onPressed: () => AppRouter.push('/forgot')),
                        ],
                      ))),
            ],
          ),
        ),
      )),
    );
  }
}
