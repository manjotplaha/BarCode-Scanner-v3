import 'package:barcode_scanner_v3/services/AuthService.dart';
import 'package:barcode_scanner_v3/views/home.dart';
import 'package:barcode_scanner_v3/shared/login_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:barcode_scanner_v3/shared/constants.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthService _auth = new AuthService();
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passWordController = TextEditingController();

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
                                validator: (value) {
                                  value.trim();
                                  if (value.length < 6) {
                                    return 'PassWord length is Short';
                                  } else {
                                    return null;
                                  }
                                },
                                // onChanged: (value) => email = value.trim(),
                                decoration:
                                    buildInputDecoration(Icon(Icons.lock))),
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
                LoginButton(
                    formKey: _formKey,
                    auth: _auth,
                    email: email,
                    passwd: passwd),
                Text(
                  '-OR-',
                  style: TextStyle(color: textColor),
                ),
                GoogleSignInButton(),
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

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key key,
    @required GlobalKey<FormState> formKey,
    @required AuthService auth,
    @required this.email,
    @required this.passwd,
  })  : _formKey = formKey,
        _auth = auth,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final AuthService _auth;
  final String email;
  final String passwd;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 40,
      child: GestureDetector(
        onTap: () async {
          print('LOGIN tapped');
          if (_formKey.currentState.validate()) {
            dynamic result = await _auth.signInWithEmailandPass(
                email: email, password: passwd);
            print(result);
            if (result == null) {
              print('Signed in'); //should give an error!!!!
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => MyHomePage()));
            } else {
              print('Error Occured');
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
    );
  }
}
