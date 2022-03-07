import 'package:fehm/config/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fehm/widgets/text_input.dart';
import 'package:fehm/widgets/app_button.dart';

class ResetPassword extends StatelessWidget {
  final TextEditingController usernameControl = TextEditingController();
  final TextEditingController passwordControl = TextEditingController();

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
          height: MediaQuery.of(context).size.height * 0.85,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                flex: 2,
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
                flex: 4,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Enter the secret code that you have received and enter your new password",
                        style: GoogleFonts.averageSans(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      TextInput(
                        placeholder: 'Reset Code',
                        icon: Icons.lock_clock,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Divider(
                            color: Colors.black,
                          ))
                        ],
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
                        text: 'Reset Password',
                        onPress: () {},
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                              child: Text("Register Now"),
                              onPressed: () => AppRouter.push('/register')),
                          TextButton(
                              child: Text("Try Logging in"),
                              onPressed: () => AppRouter.push('/')),
                        ],
                      ))),
            ],
          ),
        ),
      )),
    );
  }
}
