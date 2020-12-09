import 'package:barcode_scanner_v3/Provider/product_provider.dart';
import 'package:barcode_scanner_v3/views/products_view.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scanner_v3/views/info_view.dart';
import 'package:barcode_scanner_v3/shared/widgets/bars.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
        isScrollControlled: true,
        enableDrag: true,
        context: context,
        builder: (context) => Container(
            height: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).size.height / 3),
            child: Information(scanBarcode)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    ImageCache().maximumSizeBytes = 10;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar(context, 'BarCode Scanner'),
      body: Container(
        width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  enlargeCenterPage: true,
                  // autoPlay: true,
                  initialPage: 1,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: false,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                ),
                items: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: AssetImage('assets/images/open_sign.jpg'),
                              fit: BoxFit.cover))),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: AssetImage('assets/images/sale2.jpg'),
                              fit: BoxFit.cover))),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: AssetImage('assets/images/store.jpg'),
                              fit: BoxFit.cover))),
                ],
              ),
              Column(children: [
                Text('Scan a Barcode to get the Product Information'),
                RaisedButton(
                    onPressed: () {
                      scanBarcodeNormal();
                    },
                    child: Text("Start barcode scan")),
                Text('Scan result : $scanBarcode\n',
                    style: TextStyle(fontSize: 20)),
              ])
            ]),
      ),
    );
  }
}
