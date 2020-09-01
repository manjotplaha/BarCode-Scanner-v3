import 'package:barcode_scanner_v3/services/AuthService.dart';
import 'package:barcode_scanner_v3/views/SignIn.dart';
import 'package:barcode_scanner_v3/views/SignUp.dart';

// import 'package:barcode_scanner_v3/widgets/login_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:barcode_scanner_v3/shared/constants.dart';

class FirstPage extends StatelessWidget {
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
                  SizedBox(height: 20),
                  // CustomButton(
                  //   title: 'SIGN IN',
                  //   screen: SignIn(),
                  //   methodName: null,
                  // ),
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
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => SignIn()));

                          // dynamic result = await methodName;
                          // if (result == null) {
                          //   print('Error Signing in');
                          // } else {
                          //   print('Signed in');
                          //   Navigator.of(context)
                          //       .push(MaterialPageRoute(builder: (_) => screen));
                          // }
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
                  // CustomButton(title: 'SIGN UP', screen: SignUp()),
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
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => SignUp()));

                          // dynamic result = await methodName;
                          // if (result == null) {
                          //   print('Error Signing in');
                          // } else {
                          //   print('Signed in');
                          //   Navigator.of(context)
                          //       .push(MaterialPageRoute(builder: (_) => SignUp()));
                          // }
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
                            print('Signed in');
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
