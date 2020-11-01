import 'package:aps_mobile/model/category.dart';
import 'package:aps_mobile/store/product_store.dart';
import 'package:aps_mobile/view/tabs/product/components/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProductTab extends StatelessWidget {

  final Category category;

  final ProductStore _productStore = ProductStore();

  ProductTab({@required this.category}){
    _productStore.buscaProductosCategoria(category.idCategoria);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.descricao),
        centerTitle: true,
      ),
      body: Observer(
        builder: (context) {
          if (_productStore.loading) {
            return Center(
                child: CircularProgressIndicator(
                  valueColor:
                  AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                ));
          } else {
            return RefreshIndicator(
              onRefresh: () => _productStore.buscaProductosCategoria(category.idCategoria),
              child: GridView.builder(
                padding: EdgeInsets.all(4.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  childAspectRatio: 0.65,
                ),
                itemCount: _productStore.products.length,
                itemBuilder: (context, index) {
                  return ProductTile(product: _productStore.products[index],);
                },
              ),
            );
          }
        },
      ),
    );
  }
}
