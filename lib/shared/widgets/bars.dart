import 'package:barcode_scanner_v3/Provider/AuthService.dart';
import 'package:barcode_scanner_v3/views/cart_view.dart';
import 'package:barcode_scanner_v3/views/first_view.dart';
import 'package:barcode_scanner_v3/views/home_view.dart';
import 'package:barcode_scanner_v3/views/profile_view.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with TickerProviderStateMixin {
  // int activeIndex;
  TabController _tabController;
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      controller: TabController(length: 3, vsync: this),
      cornerRadius: 20,
      height: 45,
      style: TabStyle.fixedCircle, backgroundColor: Colors.teal[900],
      items: [
        TabItem(icon: Icons.shopping_cart, title: 'Cart'),
        TabItem(icon: Icons.add, title: 'Add'),
        TabItem(icon: Icons.people, title: 'Profile'),
      ],
      initialActiveIndex: 1, //optional, default as 0
      onTap: (int i) {
        if (i == 0) {
          setState(() {
            // Navigator.pushNamed(context, '/cart');
            Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return CartView();
              },
              transitionDuration: Duration(milliseconds: 200),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                animation = CurvedAnimation(
                    curve: Curves.easeInCubic, parent: animation);
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            ));
          });
        } else if (i == 1) {
          setState(() {
            Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return MyHomePage();
              },
              transitionDuration: Duration(milliseconds: 200),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                animation = CurvedAnimation(
                    curve: Curves.easeInCubic, parent: animation);
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            ));
          });
        } else if (i == 2) {
          setState(() {
            Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return ProfileView();
              },
              transitionDuration: Duration(milliseconds: 200),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                animation = CurvedAnimation(
                    curve: Curves.easeInCubic, parent: animation);
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            ));
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
