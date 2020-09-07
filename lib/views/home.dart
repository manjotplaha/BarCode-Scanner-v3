import 'package:flutter/material.dart';
import 'package:barcode_scanner_v3/views/info.dart';
import 'package:barcode_scanner_v3/shared/bars.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title;
  String brand;
  String category;
  String scanBarcode = 'Unknown';
  @override
  void initState() {
    super.initState();
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() async {
      scanBarcode = barcodeScanRes;
      print('$scanBarcode');
      if (scanBarcode != '-1') {
        _modalBottomSheetInformation();
      } else {
        scanBarcode = 'Unable to Scan Barcode, Try Again!';
      }
    });
  }

  Future _modalBottomSheetInformation() {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Information(scanBarcode),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context, 'BarCode Scanner'),
        body: AnimatedContainer(
          width: double.infinity,
          duration: Duration(seconds: 2),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Here Goes the Scannner'),
                RaisedButton(
                    onPressed: () {
                      scanBarcodeNormal();
                    },
                    child: Text("Start barcode scan")),
                Text('Scan result : $scanBarcode\n',
                    style: TextStyle(fontSize: 20)),
              ]),
        ),
        bottomNavigationBar: BottomNavBar());
  }
}
