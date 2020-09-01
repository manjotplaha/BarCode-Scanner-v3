import 'package:barcode_scanner_v3/services/AuthService.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      height: 45,
      style: TabStyle.fixedCircle, backgroundColor: Colors.teal[900],
      items: [
        TabItem(icon: Icons.shopping_cart, title: 'Cart'),
        TabItem(icon: Icons.add, title: 'Add'),
        TabItem(icon: Icons.people, title: 'Profile'),
      ],
      // initialActiveIndex: pageNumber, //optional, default as 0
      onTap: (int i) {
        if (i == 0) {
          setState(() {
            Navigator.pushNamed(context, '/cart');
          });
        } else if (i == 1) {
          setState(() {
            Navigator.pushNamed(context, '/home');
          });
        }
      },
    );
  }
}

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
          Navigator.pushNamed(context, '/firstPage');
        },
        child: Row(children: [Icon(Icons.exit_to_app), Text('Sign Out')]),
      )
    ],
  );
}
