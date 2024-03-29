import 'package:barcode_scanner_v3/shared/widgets/BottomNavBar.dart';
import 'package:barcode_scanner_v3/views/first_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    //this will check if the user is already loged in
    //if so it will redirect it to HomePage else to Login page.
    return auth.currentUser != null ? BottomNav() : FirstPage();
    // return auth.currentUser != null ? ProductsView() : FirstPage();
  }
}
