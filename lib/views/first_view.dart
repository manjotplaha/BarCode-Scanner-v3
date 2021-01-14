import 'package:barcode_scanner_v3/Provider/AuthService.dart';
import 'package:barcode_scanner_v3/shared/Animator&Decorations.dart';
import 'package:barcode_scanner_v3/views/signIn_view.dart';
import 'package:barcode_scanner_v3/views/signUp_view.dart';
import 'package:barcode_scanner_v3/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:barcode_scanner_v3/shared/constants.dart';

class FirstPage extends StatelessWidget {
  final Methods methodName = Methods();
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/mipmap6.png',
                    scale: .6,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'InvenTra',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.b612Mono(
                        color: Colors.brown[50],
                        fontSize: 40,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Add Items to your Inventory with tap of a Button, just Scan the product BarCode and you are good to go',
                    style: GoogleFonts.b612Mono(
                      color: Colors.brown[100],
                      fontSize: 15,
                    ),
                  ),
                  // SizedBox(height: 150),
                  SizedBox(height: 50),
                  Container(
                      width: 800,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.yellow[200]),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          print('SIGN IN tapped');

                          Navigator.of(context)
                              .push(methodName.buildAnimatedRoute(SignIn()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('SIGN IN',
                                style: GoogleFonts.varelaRound(
                                  color: Colors.yellow[200],
                                  fontSize: 20,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.orange[200],
                            )
                          ],
                        ),
                      )),
                  SizedBox(height: 10),
                  Container(
                      width: 800,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.yellow[200]),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          print('SIGN UP tapped');

                          Navigator.of(context)
                              .push(methodName.buildAnimatedRoute(SignUp()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('SIGN UP',
                                style: GoogleFonts.varelaRound(
                                  color: Colors.yellow[200],
                                  fontSize: 20,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.orange[200],
                            )
                          ],
                        ),
                      )),
                  SizedBox(height: 10),
                  Container(
                      width: 800,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.yellow[200]),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          print('tapped');

                          dynamic result = await _auth.signInAnon();
                          print(result);
                          if (result == null) {
                            print('Error Signing in');
                          } else {
                            Navigator.of(context).push(
                                methodName.buildAnimatedRoute(MyHomePage()));
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Continue as Guest',
                                style: GoogleFonts.varelaRound(
                                  color: Colors.yellow[200],
                                  fontSize: 20,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.orange[200],
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
