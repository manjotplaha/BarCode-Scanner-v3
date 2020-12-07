import 'package:barcode_scanner_v3/views/cart_view.dart';
import 'package:barcode_scanner_v3/views/home_view.dart';
import 'package:barcode_scanner_v3/views/products_view.dart';
import 'package:barcode_scanner_v3/views/profile_view.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currIndex = 1;
  final tabs = [ProductsView(), MyHomePage(), CartView(), ProfileView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 20,
        selectedIconTheme: IconThemeData(size: 20, color: Colors.black87),
        selectedLabelStyle: TextStyle(color: Colors.black87),
        backgroundColor: Colors.white70,
        selectedFontSize: 13,
        fixedColor: Colors.white70,
        unselectedItemColor: Colors.black54,
        currentIndex: currIndex,
        elevation: 2,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                'Catalogue',
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w600),
              ),
              backgroundColor: Colors.white70),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo),
              title: Text(
                'Scan',
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w600),
              ),
              backgroundColor: Colors.white70),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text(
                'Cart',
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w600),
              ),
              backgroundColor: Colors.white70),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text(
                'Account',
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w600),
              ),
              backgroundColor: Colors.white70),
        ],
        onTap: (index) {
          setState(() {
            currIndex = index;
          });
        },
      ),
    );
  }
}
