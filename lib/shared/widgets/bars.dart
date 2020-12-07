import 'package:barcode_scanner_v3/Provider/AuthService.dart';
import 'package:barcode_scanner_v3/views/first_view.dart';

import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, String pageTitle) {
  AuthService _auth = new AuthService();
  return AppBar(
    title: Text(
      '$pageTitle',
      style: Theme.of(context).textTheme.headline6,
    ),
    actions: <Widget>[
      MaterialButton(
        onPressed: () async {
          dynamic result = await _auth.signOut();
          print(result);
          Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return FirstPage();
            },
            transitionDuration: Duration(milliseconds: 200),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              animation =
                  CurvedAnimation(curve: Curves.easeInCubic, parent: animation);
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ));
        },
        child: Row(children: [Icon(Icons.exit_to_app), Text('Sign Out')]),
      )
    ],
  );
}
