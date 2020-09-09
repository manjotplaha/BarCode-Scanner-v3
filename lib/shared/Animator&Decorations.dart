import 'package:flutter/material.dart';

class Methods {
  PageRouteBuilder buildAnimatedRoute(dynamic routeName) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return routeName;
      },
      transitionDuration: Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        animation =
            CurvedAnimation(curve: Curves.easeInCubic, parent: animation);
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
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
