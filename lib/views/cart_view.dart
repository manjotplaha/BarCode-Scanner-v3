import 'package:barcode_scanner_v3/Provider/cart_provider.dart';
import 'package:barcode_scanner_v3/services/square_payments.dart';
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
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                        delegate: SliverChildListDelegate([
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
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
                                      subtitle: Text('${cartItem[i].brand}'),
                                      trailing: FittedBox(
                                        child: ButtonBar(
                                          children: [
                                            IconButton(
                                                icon: Icon(Icons
                                                    .remove_circle_outline),
                                                onPressed: null),
                                            Text('${cartItem[i].quantity}'),
                                            IconButton(
                                                icon: Icon(
                                                    Icons.add_circle_outline),
                                                onPressed: null)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/coupons');
                                },
                                child: Card(
                                  child: Container(
                                      child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Icon(Icons.local_offer),
                                            SizedBox(width: 8),
                                            Text(
                                              'Apply Coupon',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Icon(Icons.keyboard_arrow_right)
                                    ],
                                  )),
                                ),
                              ),
                            ),
                            Card(
                              child: Table(
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.top,
                                // defaultColumnWidth: IntrinsicColumnWidth(),
                                children: [
                                  buildTableRow('Cart Total', '80.0'),
                                  buildTableRow('Discount', '10.0'),
                                  TableRow(children: [
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10.0, 15.0, 10.0, 0.0),
                                        child: Text(
                                          'Coupon Savings',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/coupons');
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10.0, 15.0, 10.0, 0.0),
                                            child: Center(
                                              child: Text(
                                                'Apply Coupon',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.teal[600]),
                                              ),
                                            ),
                                          )),
                                    ),
                                  ]),
                                  buildTableRow('Order Total', '70.0'),
                                ],
                              ),
                            ),
                            ButtonBar(
                              buttonHeight: 20.0,
                              children: [
                                Expanded(
                                  child: FlatButton(
                                      onPressed: null,
                                      child: Column(children: [
                                        Text('\$ 70.0',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54,
                                                fontSize: 18.0)),
                                        Text(
                                          'View Order Summary',
                                          style: TextStyle(
                                              color: Colors.teal[400]),
                                        )
                                      ])),
                                ),
                                Expanded(
                                  child: MaterialButton(
                                    onPressed: () {
                                      payment();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 10.0, 20.0, 10.0),
                                      child: Text('PROCEED TO PAY'),
                                    ),
                                    color: Colors.amber,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ]))
                  ],
                ),
              ),
      ),
    );
  }

  TableRow buildTableRow(String field, String value) {
    return TableRow(children: [
      TableCell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
          child: Text(
            '$field',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      TableCell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
          child: Center(
            child: Text(
              '\$ $value',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      )
    ]);
  }
}
