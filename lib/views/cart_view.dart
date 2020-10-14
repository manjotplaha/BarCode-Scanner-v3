import 'package:barcode_scanner_v3/Provider/cart_provider.dart';
import 'package:barcode_scanner_v3/shared/widgets/bars.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartView extends StatefulWidget {
  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  var _isInit = true;
  @override
  void initState() {
    // Provider.of<CartProvider>(context).fetchAndSetProducts();
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<CartProvider>(context).fetchAndSetProducts();
    // });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<CartProvider>(context).fetchAndSetProducts();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _refreshCart(BuildContext context) async {
    await Provider.of<CartProvider>(context, listen: false)
        .fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    var cartItem = Provider.of<CartProvider>(context, listen: false).cartItems;
    return Scaffold(
      appBar: buildAppBar(context, 'CartView'),
      body: RefreshIndicator(
        onRefresh: () => _refreshCart(context),
        child: cartItem.isEmpty
            ? Center(
                child: Text(
                'Add Something to your Cart !',
                style: Theme.of(context).textTheme.headline6,
              ))
            : ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: ListView.builder(
                    itemCount: cartItem.length,
                    itemBuilder: (context, i) {
                      return Slidable(
                        key: Key(cartItem[i].id),
                        // background: Container(color: Colors.red),
                        // onDismissed: (direction) {
                        //   try {
                        //     setState(() {
                        //       cartItem.removeAt(i);
                        //       print(cartItem[i].id);
                        //     });
                        //   } catch (e) {
                        //     print('Error deleting Item');
                        //   }
                        // },
                        dismissal: SlidableDismissal(
                          child: SlidableDrawerDismissal(),
                          onDismissed: (actionType) {
                            try {
                              setState(() {
                                cartItem.removeAt(i);
                                print('${cartItem[i].id} Dismissed');
                              });
                            } catch (e) {
                              print('Error Dismissing');
                            }
                          },
                        ),
                        actionPane: SlidableDrawerActionPane(),
                        actionExtentRatio: 0.25,
                        direction: Axis.horizontal,
                        actions: <Widget>[
                          IconSlideAction(
                            caption: 'Archive',
                            color: Colors.blue,
                            icon: Icons.archive,
                            // onTap: () => _showSnackBar('Archive'),
                          ),
                          IconSlideAction(
                            caption: 'Share',
                            color: Colors.indigo,
                            icon: Icons.share,
                            // onTap: () => _showSnackBar('Share'),
                          ),
                        ],
                        secondaryActions: <Widget>[
                          IconSlideAction(
                            caption: 'More',
                            color: Colors.black45,
                            icon: Icons.more_horiz,
                            // onTap: () => _showSnackBar('More'),
                          ),
                          IconSlideAction(
                            caption: 'Delete',
                            color: Colors.red,
                            icon: Icons.delete,
                            // onTap: () => _showSnackBar('Delete'),
                          ),
                        ],

                        child: Card(
                          child: ListTile(
                            title: Text('${cartItem[i].title}'),
                            subtitle: Text('${cartItem[i].upc}'),
                            trailing: FittedBox(
                              child: ButtonBar(children: [
                                IconButton(
                                    icon: Icon(Icons.remove_circle_outline),
                                    onPressed: null),
                                Text('${cartItem[i].quantity}'),
                                IconButton(
                                    icon: Icon(Icons.add_circle_outline),
                                    onPressed: null)
                              ]),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
