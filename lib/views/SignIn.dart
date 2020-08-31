import 'package:barcode_scanner_v3/services/AuthService.dart';
import 'package:barcode_scanner_v3/views/home.dart';
import 'package:barcode_scanner_v3/widgets/login_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthService _auth = new AuthService();
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passWordController = TextEditingController();

  final Color primaryColor = Colors.cyan[800];

  final Color secondaryColor = Color(0xff232c51);

  final Color textColor = Colors.brown[50];

  String email = '';
  String passwd = '';
  String error = '';

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
                            //email text field
                            Text(
                              'Email',
                              style: TextStyle(color: textColor),
                            ),
                            SizedBox(height: 10),

                            TextFormField(
                              onChanged: (String value) {
                                setState(() {
                                  email = value;
                                });
                              },
                              // keyboardType: ,
                              controller: emailController,
                              obscureText: false,
                              validator: (value) => value.isEmpty
                                  ? 'Email cannot be empty'
                                  : null,
                              // onChanged: (value) => email = value.trim(),
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10.0),
                                prefixIcon: Icon(Icons.email),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                      color: Colors.brown[100], width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Colors.brown[100]),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),

                            //password text field

                            Text(
                              'Password',
                              style: TextStyle(color: textColor),
                            ),
                            SizedBox(height: 10),

                            TextFormField(
                              onChanged: (String value) {
                                setState(() {
                                  passwd = value;
                                });
                              },
                              // keyboardType: ,
                              controller: passWordController,
                              obscureText: true,
                              validator: (value) => value.length < 6
                                  ? 'PassWord length is Short'
                                  : null,
                              // onChanged: (value) => email = value.trim(),
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10.0),
                                prefixIcon: Icon(Icons.lock),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                      color: Colors.brown[100], width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Colors.brown[100]),
                                ),
                              ),
                            ),
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
                ),
                Container(
                  width: 800,
                  height: 40,
                  child: GestureDetector(
                    onTap: () async {
                      print('LOGIN tapped');
                      print(email);
                      print(passwd);
                      if (_formKey.currentState.validate()) {
                        dynamic result = await _auth.signInWithEmailandPass(
                            email: email, password: passwd);
                        print(result);
                        if (result == null) {
                          print('Signed in'); //should give an error!!!!
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => MyHomePage()));
                        } else {
                          setState(() {
                            error = 'Please Supply a Valid Email or PassWord!';
                          });
                        }
                      }
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
                ]),
                Text(error),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
