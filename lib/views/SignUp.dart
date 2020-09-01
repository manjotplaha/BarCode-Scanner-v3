import 'package:barcode_scanner_v3/services/AuthService.dart';
import 'package:barcode_scanner_v3/shared/login_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:barcode_scanner_v3/shared/constants.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  AuthService _auth = new AuthService();

  final emailController = TextEditingController();
  final passWordController = TextEditingController();

  String email = '';
  String passwd = '';

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
                    child: Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: TextStyle(color: textColor),
                            ),
                            SizedBox(height: 5),
                            TextFormField(
                              onChanged: (String value) {
                                setState(() {
                                  email = value;
                                });
                              },
                              controller: emailController,
                              obscureText: false,
                              validator: (value) {
                                value.trim();
                                if (value.isEmpty) {
                                  return 'Email cannot be empty';
                                } else if (!EmailValidator.validate(value)) {
                                  return 'Not valid format';
                                } else {
                                  return null;
                                }
                              },
                              decoration:
                                  buildInputDecoration(Icon(Icons.email)),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Password',
                              style: TextStyle(color: textColor),
                            ),
                            SizedBox(height: 5),
                            TextFormField(
                                onChanged: (String value) {
                                  setState(() {
                                    passwd = value;
                                  });
                                },
                                // keyboardType: ,
                                controller: passWordController,
                                obscureText: true,
                                validator: (value) {
                                  value.trim();
                                  if (value.length < 6) {
                                    return 'PassWord length is Short';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration:
                                    buildInputDecoration(Icon(Icons.lock))),
                          ]),
                    ),
                  ),
                ),
                Container(
                  width: 800,
                  height: 40,
                  child: GestureDetector(
                    onTap: () async {
                      print('REGISTER tapped');
                      if (_formKey.currentState.validate()) {
                        dynamic result = await _auth.registerWithEmailandPass(
                            email: email, password: passwd);
                        print(result);
                        if (result == null) {
                          print('Error Occured');
                        } else {
                          print('Signed in');
                          Navigator.pushNamed(context, '/home');
                        }
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('REGISTER',
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
                GoogleSignInButton(),
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

  InputDecoration buildInputDecoration(Icon icon) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
      prefixIcon: icon,
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(color: Colors.brown[100], width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: Colors.brown[100]),
      ),
    );
  }
}
