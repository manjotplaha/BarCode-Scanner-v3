import 'package:barcode_scanner_v3/Provider/product_provider.dart';
import 'package:barcode_scanner_v3/shared/widgets/bars.dart';
import 'package:barcode_scanner_v3/shared/widgets/productsListTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsView extends StatefulWidget {
  @override
  _ProductsViewState createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  var _isInit = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    var productProvider = Provider.of<ProductProvider>(context, listen: false);
    if (_isInit) {
      productProvider.fetchData();
      productProvider.fetchDataByCandy();
      productProvider.fetchDataByCarAcess();
      productProvider.fetchDataByClothes();
      productProvider.fetchDataByGeneral();
      productProvider.fetchDataByHygiene();
      productProvider.fetchDataByMedicines();
      productProvider.fetchDataByMexicanCandy();
      productProvider.fetchDataByTobaccoAcess();
      productProvider.fetchDataByToiletries();
      productProvider.fetchDataByToys();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context, listen: false);
    return Scaffold(
        appBar: buildAppBar(context, 'ProductsGrid'),
        body: CustomScrollView(
          slivers: <Widget>[
            // SliverAppBar(
            //   title: Text('SliverAppBar'),
            //   backgroundColor: Colors.green,
            // expandedHeight: 10.0,
            //   // flexibleSpace: FlexibleSpaceBar(
            //   //   background: Image.asset('assets/forest.jpg', fit: BoxFit.cover),
            //   // ),
            //   snap: ,
            // ),
            SliverFixedExtentList(
                delegate: SliverChildListDelegate([
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildHeader(productType: 'Tobacco Products'),
                      // SizedBox(height: 1),
                      Expanded(
                          child: TobaccoListView(
                              productProvider: productProvider)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildHeader(productType: 'Medicines'),
                      // SizedBox(height: 1),
                      Expanded(
                          child: MedicineListView(
                              productProvider: productProvider)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildHeader(productType: 'Hygiene'),
                      // SizedBox(height: 1),
                      Expanded(
                          child: HygieneListView(
                              productProvider: productProvider)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildHeader(productType: 'Candies'),
                      // SizedBox(height: 1),
                      Expanded(
                          child:
                              CandyListView(productProvider: productProvider)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildHeader(productType: 'Clothes'),
                      // SizedBox(height: 1),
                      Expanded(
                          child: ClothesListView(
                              productProvider: productProvider)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildHeader(productType: 'General'),
                      // SizedBox(height: 1),
                      Expanded(
                          child: GeneralListView(
                              productProvider: productProvider)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildHeader(productType: 'Mexican Candies'),
                      // SizedBox(height: 1),
                      Expanded(
                          child: MexicanCandyListView(
                              productProvider: productProvider)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildHeader(productType: 'Toys'),
                      // SizedBox(height: 1),
                      Expanded(
                          child:
                              ToysListView(productProvider: productProvider)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildHeader(productType: 'Car Accessories'),
                      // SizedBox(height: 1),
                      Expanded(
                          child: CarAcessListView(
                              productProvider: productProvider)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildHeader(productType: 'Toileteries'),
                      // SizedBox(height: 1),
                      Expanded(
                          child: ToileteriesListView(
                              productProvider: productProvider)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildHeader(productType: 'All Products'),
                      // SizedBox(height: 1),
                      Expanded(
                          child: ProductListView(
                              productProvider: productProvider)),
                    ],
                  ),
                ]),
                itemExtent: 320)
          ],
        )
        // bottomNavigationBar: BottomNavBar(),
        );
  }
}

class BuildHeader extends StatelessWidget {
  const BuildHeader({
    Key key,
    @required this.productType,
  }) : super(key: key);

  final String productType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Text('$productType', style: Theme.of(context).textTheme.headline6),
    );
  }
}
