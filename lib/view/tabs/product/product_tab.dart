import 'package:aps_mobile/store/product_store.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {

  ProductScreen({@required this.categoryDescr});

  final String categoryDescr;

  final ProductStore _productStore = ProductStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryDescr),
        centerTitle: true,
      ),
    );
  }
}
