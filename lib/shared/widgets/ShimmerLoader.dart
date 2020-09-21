import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class SmallLoadingBars extends StatelessWidget {
  const SmallLoadingBars({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 15,
      color: Colors.white,
    );
  }
}

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 70,
                  color: Colors.white,
                ),
                SizedBox(height: 5),
                SmallLoadingBars(),
                SizedBox(height: 5),
                SmallLoadingBars(),
                SizedBox(height: 5),
                SmallLoadingBars(),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 70,
                  color: Colors.white,
                ),
              ]),
        ),
      ),
    );
  }
}
