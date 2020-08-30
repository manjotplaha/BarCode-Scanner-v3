import 'package:barcode_scanner_v3/services/AuthService.dart';
import 'package:barcode_scanner_v3/widgets/login_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final passWordController = TextEditingController();
  final phoneNoController = TextEditingController();
  final Color primaryColor = Colors.cyan[800];

  final Color secondaryColor = Color(0xff232c51);

  final Color textColor = Colors.brown[50];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'InvenTra',
                  style: GoogleFonts.b612Mono(fontSize: 50),
                ),
                Container(
                  color: Colors.transparent,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(color: textColor),
                          ),
                          SizedBox(height: 5),
                          CustomTextField(
                              controller: emailController,
                              obscureText: false,
                              icon: Icon(Icons.email)),
                          SizedBox(height: 5),
                          Text(
                            'Password',
                            style: TextStyle(color: textColor),
                          ),
                          SizedBox(height: 5),
                          CustomTextField(
                              controller: passWordController,
                              obscureText: true,
                              icon: Icon(Icons.lock)),
                          // SizedBox(height: 5),
                          // Text(
                          //   'Phone No.',
                          //   style: TextStyle(color: textColor),
                          // ),
                          // SizedBox(height: 5),
                          // CustomTextField(
                          //   controller: phoneNoController,
                          //   obscureText: false,
                          //   icon: Icon(Icons.phone),
                          //   keyboardType: TextInputType.number,
                          // ),
                        ]),
                  ),
                ),
                Container(
                  width: 800,
                  height: 40,
                  child: GestureDetector(
                    onTap: () {
                      print('tapped');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('LOGIN',
                            style: GoogleFonts.varelaRound(
                              color: Colors.yellow[200],
                              fontSize: 30,
                            )),
                      ],
                    ),
                  ),
                ),
                Text(
                  '-OR-',
                  style: TextStyle(color: textColor),
                ),
                SignInButton(
                  Buttons.Google,
                  onPressed: () {
                    AuthService().signInWithGoogle();
                  },
                ),
                SizedBox(height: 30),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'Already have an Account ? ',
                    style: TextStyle(color: textColor),
                  ),
                  TextButton(title: 'Sign In', weight: FontWeight.bold),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
