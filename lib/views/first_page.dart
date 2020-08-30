import 'package:barcode_scanner_v3/services/AuthService.dart';
import 'package:barcode_scanner_v3/views/SignIn.dart';
import 'package:barcode_scanner_v3/views/SignUp.dart';
import 'package:barcode_scanner_v3/views/home.dart';
import 'package:barcode_scanner_v3/widgets/login_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstPage extends StatelessWidget {
  final AuthService _auth = AuthService();
  final Color primaryColor = Colors.cyan[800];
  final Color secondaryColor = Color(0xff232c51);
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
                  CustomButton(
                    title: 'SIGN IN',
                    screen: SignIn(),
                  ),
                  SizedBox(height: 10),
                  CustomButton(title: 'SIGN UP', screen: SignUp()),
                  SizedBox(height: 10),
                  CustomButton(
                    title: 'Continue as Guest',
                    screen: MyHomePage(),
                    methodName: _auth.signInAnon(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
