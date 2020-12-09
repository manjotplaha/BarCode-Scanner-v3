import 'package:barcode_scanner_v3/shared/widgets/bars.dart';
import 'package:flutter/material.dart';

class CouponsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Offers'),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            // color: Colors.black38,
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/error_emoji.webp'),
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        Text(
                          'Oops! No Offers Found.',
                          style: Theme.of(context).textTheme.headline5,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
