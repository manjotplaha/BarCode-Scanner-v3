import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  String title;
  String type;
  num variant_max_price;
  num variant_price;
  String option;
  List image_src;

  ProductProvider(
      {this.title,
      this.option,
      this.type,
      this.variant_price,
      this.variant_max_price,
      this.image_src});
  // });

  CollectionReference _products =
      FirebaseFirestore.instance.collection('products');

  final List<ProductProvider> productsCatalogue = [];
  final List<ProductProvider> tobaccoProductsCatalogue = [];
  final List<ProductProvider> candyProductsCatalogue = [];
  final List<ProductProvider> clothesProductsCatalogue = [];
  final List<ProductProvider> generalProductsCatalogue = [];
  final List<ProductProvider> hygieneProductsCatalogue = [];
  final List<ProductProvider> medicineProductsCatalogue = [];
  final List<ProductProvider> mexicanCandyProductsCatalogue = [];
  final List<ProductProvider> toysProductsCatalogue = [];
  final List<ProductProvider> toiliteriesProductsCatalogue = [];
  final List<ProductProvider> carAcessProductsCatalogue = [];

  Future<List> fetchData() async {
    await _products.get().then(
      (QuerySnapshot querySnapshot) {
        print('query exists on the database');
        querySnapshot.docs.forEach(
          (doc) {
            // print('${doc["title"]}, ${doc['option']}');
            productsCatalogue.add(
              ProductProvider(
                title: doc['title'],
                option: doc['option'],
                type: doc['type'],
                variant_price: doc['variant_price'],
                variant_max_price: doc['variant_max_price'],
                image_src: doc['image_src'],
              ),
            );
          },
        );
      },
    );

    // productsCatalogue.forEach((element) {
    //   print('Model Prices ${element.variant_price}');
    // });
    notifyListeners();
  }

  Future<List> fetchDataByTobaccoAcess() async {
    await _products.where('type', isEqualTo: 'Tobacco accessories').get().then(
      (QuerySnapshot querySnapshot) {
        print('query exists on the database');
        querySnapshot.docs.forEach(
          (doc) {
            // print('${doc["title"]}, ${doc['option']}');
            tobaccoProductsCatalogue.add(
              ProductProvider(
                title: doc['title'],
                option: doc['option'],
                type: doc['type'],
                variant_price: doc['variant_price'],
                variant_max_price: doc['variant_max_price'],
                image_src: doc['image_src'],
              ),
            );
          },
        );
      },
    );
    notifyListeners();
  }

  Future<List> fetchDataByCarAcess() async {
    await _products.where('type', isEqualTo: 'Car Accessories').get().then(
      (QuerySnapshot querySnapshot) {
        print('query exists on the database');
        querySnapshot.docs.forEach(
          (doc) {
            // print('${doc["title"]}, ${doc['option']}');
            carAcessProductsCatalogue.add(
              ProductProvider(
                title: doc['title'],
                option: doc['option'],
                type: doc['type'],
                variant_price: doc['variant_price'],
                variant_max_price: doc['variant_max_price'],
                image_src: doc['image_src'],
              ),
            );
          },
        );
      },
    );
    notifyListeners();
  }

  Future<List> fetchDataByCandy() async {
    await _products.where('type', isEqualTo: 'Candy').get().then(
      (QuerySnapshot querySnapshot) {
        print('query exists on the database');
        querySnapshot.docs.forEach(
          (doc) {
            // print('${doc["title"]}, ${doc['option']}');
            candyProductsCatalogue.add(
              ProductProvider(
                title: doc['title'],
                option: doc['option'],
                type: doc['type'],
                variant_price: doc['variant_price'],
                variant_max_price: doc['variant_max_price'],
                image_src: doc['image_src'],
              ),
            );
          },
        );
      },
    );
    notifyListeners();
  }

  Future<List> fetchDataByMexicanCandy() async {
    await _products.where('type', isEqualTo: 'Mexican Candy').get().then(
      (QuerySnapshot querySnapshot) {
        print('query exists on the database');
        querySnapshot.docs.forEach(
          (doc) {
            // print('${doc["title"]}, ${doc['option']}');
            mexicanCandyProductsCatalogue.add(
              ProductProvider(
                title: doc['title'],
                option: doc['option'],
                type: doc['type'],
                variant_price: doc['variant_price'],
                variant_max_price: doc['variant_max_price'],
                image_src: doc['image_src'],
              ),
            );
          },
        );
      },
    );
    notifyListeners();
  }

  Future<List> fetchDataByHygiene() async {
    await _products.where('type', isEqualTo: 'Hygiene').get().then(
      (QuerySnapshot querySnapshot) {
        print('query exists on the database');
        querySnapshot.docs.forEach(
          (doc) {
            // print('${doc["title"]}, ${doc['option']}');
            hygieneProductsCatalogue.add(
              ProductProvider(
                title: doc['title'],
                option: doc['option'],
                type: doc['type'],
                variant_price: doc['variant_price'],
                variant_max_price: doc['variant_max_price'],
                image_src: doc['image_src'],
              ),
            );
          },
        );
      },
    );
    notifyListeners();
  }

  Future<List> fetchDataByToiletries() async {
    await _products.where('type', isEqualTo: 'Toiletries').get().then(
      (QuerySnapshot querySnapshot) {
        print('query exists on the database');
        querySnapshot.docs.forEach(
          (doc) {
            // print('${doc["title"]}, ${doc['option']}');
            toiliteriesProductsCatalogue.add(
              ProductProvider(
                title: doc['title'],
                option: doc['option'],
                type: doc['type'],
                variant_price: doc['variant_price'],
                variant_max_price: doc['variant_max_price'],
                image_src: doc['image_src'],
              ),
            );
          },
        );
      },
    );
    notifyListeners();
  }

  Future<List> fetchDataByClothes() async {
    await _products.where('type', isEqualTo: 'Clothes').get().then(
      (QuerySnapshot querySnapshot) {
        print('query exists on the database');
        querySnapshot.docs.forEach(
          (doc) {
            // print('${doc["title"]}, ${doc['option']}');
            clothesProductsCatalogue.add(
              ProductProvider(
                title: doc['title'],
                option: doc['option'],
                type: doc['type'],
                variant_price: doc['variant_price'],
                variant_max_price: doc['variant_max_price'],
                image_src: doc['image_src'],
              ),
            );
          },
        );
      },
    );
    notifyListeners();
  }

  Future<List> fetchDataByGeneral() async {
    await _products.where('type', isEqualTo: 'General').get().then(
      (QuerySnapshot querySnapshot) {
        print('query exists on the database');
        querySnapshot.docs.forEach(
          (doc) {
            // print('${doc["title"]}, ${doc['option']}');
            generalProductsCatalogue.add(
              ProductProvider(
                title: doc['title'],
                option: doc['option'],
                type: doc['type'],
                variant_price: doc['variant_price'],
                variant_max_price: doc['variant_max_price'],
                image_src: doc['image_src'],
              ),
            );
          },
        );
      },
    );
    notifyListeners();
  }

  Future<List> fetchDataByMedicines() async {
    await _products.where('type', isEqualTo: 'Medicine').get().then(
      (QuerySnapshot querySnapshot) {
        print('query exists on the database');
        querySnapshot.docs.forEach(
          (doc) {
            // print('${doc["title"]}, ${doc['option']}');
            medicineProductsCatalogue.add(
              ProductProvider(
                title: doc['title'],
                option: doc['option'],
                type: doc['type'],
                variant_price: doc['variant_price'],
                variant_max_price: doc['variant_max_price'],
                image_src: doc['image_src'],
              ),
            );
          },
        );
      },
    );
    notifyListeners();
  }

  Future<List> fetchDataByToys() async {
    await _products.where('type', isEqualTo: 'toys').get().then(
      (QuerySnapshot querySnapshot) {
        print('query exists on the database');
        querySnapshot.docs.forEach(
          (doc) {
            // print('${doc["title"]}, ${doc['option']}');
            toysProductsCatalogue.add(
              ProductProvider(
                title: doc['title'],
                option: doc['option'],
                type: doc['type'],
                variant_price: doc['variant_price'],
                variant_max_price: doc['variant_max_price'],
                image_src: doc['image_src'],
              ),
            );
          },
        );
      },
    );
    notifyListeners();
  }
}
