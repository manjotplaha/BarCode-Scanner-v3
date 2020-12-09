import 'package:barcode_scanner_v3/shared/constants.dart';
import 'package:barcode_scanner_v3/shared/extra_services.dart';
import 'package:barcode_scanner_v3/shared/widgets/bars.dart';
import 'package:flutter/material.dart';

class CustomerCareView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: buildAppBar(context, customerCare[0]),
      body: ExtrasWidget(
          context: context,
          heading: '${customerCare[0]}',
          body: '${customerCare[1]}'),
    );
  }
}
