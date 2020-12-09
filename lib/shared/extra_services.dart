import 'package:flutter/material.dart';

class ExtrasWidget extends StatelessWidget {
  const ExtrasWidget({
    Key key,
    @required this.context,
    @required this.heading,
    @required this.body,
  }) : super(key: key);

  final BuildContext context;
  final String heading;
  final String body;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      SliverList(
        delegate: SliverChildListDelegate([
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Column(children: [
                Text(
                  heading,
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Text(body),
                ),
              ]),
            ),
          )
        ]),
      )
    ]);
  }
}
