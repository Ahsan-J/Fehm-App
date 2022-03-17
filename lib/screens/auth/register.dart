import 'package:fehm/config/navigation.dart';
import 'package:fehm/model/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fehm/widgets/text_input.dart';
import 'package:fehm/widgets/app_button.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController usernameControl = TextEditingController();
  final TextEditingController passwordControl = TextEditingController();

  RegisterScreen({Key? key}) : super(key: key);

  void login(BuildContext context) {
    // final auth = Provider.of<Auth>(context, listen: false);
    APIParams(data: {});
    // Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1.2,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                flex: 3,
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
                flex: 7,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(right: 4),
                            child: TextInput(
                              placeholder: "First Name",
                              icon: Icons.account_circle_outlined,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 4),
                            child: TextInput(
                              placeholder: "Last Name",
                              icon: Icons.account_circle_outlined,
                            ),
                          ),
                        ),
                      ]),
                      TextInput(
                        placeholder: 'Email',
                        icon: Icons.email,
                      ),
                      TextInput(
                        placeholder: 'Contact Number',
                        icon: Icons.phone,
                      ),
                      TextInput(
                        placeholder: 'Password',
                        icon: Icons.lock_outline,
                      ),
                      TextInput(
                        placeholder: 'Re-Enter Password',
                        icon: Icons.lock_outline,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppButton(
                        text: 'Register',
                        onPress: () {},
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                      alignment: Alignment.topCenter,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Expanded(child: IconButton(icon: Icon(AntDesign.google),iconSize: 50.0, color:Color.fromRGBO(219, 50, 54,1.0), onPressed: () {})),
                        // Expanded(child: IconButton(icon: Icon(AntDesign.linkedin_square), iconSize: 50.0,color:Color.fromRGBO(0, 119, 181, 1.0), onPressed: () {})),
                        // Expanded(child: IconButton(icon: Icon(AntDesign.facebook_square,),iconSize: 50.0, color:Color.fromRGBO(66, 103, 178,1.0), onPressed: () {})),
                      ],
                    )),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                              child: Text("Already Registered?"),
                              onPressed: () => AppRouter.push('/login')),
                          TextButton(
                              child: Text("Forgot Password"),
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
