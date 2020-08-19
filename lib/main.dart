import 'package:barcode_scanner_v3/Provider/cart_provider.dart';
import 'package:barcode_scanner_v3/views/cart.dart';
import 'package:barcode_scanner_v3/views/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Quicksand',
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  button: TextStyle(color: Colors.white),
                ),
            appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                    title: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            )),
        initialRoute: '/',
        routes: {
          '/': (context) => MyHomePage(),
          '/cart': (context) => CartView()
        },
      ),
    );
  }
}
