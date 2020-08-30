import 'package:barcode_scanner_v3/widgets/login_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passWordController = TextEditingController();
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
                          SizedBox(height: 10),
                          CustomTextField(
                              controller: emailController,
                              obscureText: false,
                              icon: Icon(Icons.email)),
                          SizedBox(height: 10),
                          Text(
                            'Password',
                            style: TextStyle(color: textColor),
                          ),
                          SizedBox(height: 10),
                          CustomTextField(
                              controller: passWordController,
                              obscureText: true,
                              icon: Icon(Icons.lock)),
                          SizedBox(height: 10),
                          Container(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                title: 'Forgot Password?',
                                weight: FontWeight.normal),
                          ),
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
                    Navigator.pushNamed(context, '/home');
                  },
                ),
                SizedBox(height: 30),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'Don\'t have an Account ? ',
                    style: TextStyle(color: textColor),
                  ),
                  TextButton(title: 'Sign Up', weight: FontWeight.bold),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
