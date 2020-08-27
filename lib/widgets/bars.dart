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
  return AppBar(
    title: Text(
      '$pageTitle',
      style: Theme.of(context).textTheme.title,
    ),
    actions: <Widget>[
      PopupMenuButton(
          itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text('Settings'),
                  value: 0,
                )
              ],
          icon: Icon(Icons.more_vert))
    ],
  );
}
