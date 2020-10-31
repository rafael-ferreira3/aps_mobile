import 'package:aps_mobile/model/product.dart';
import 'package:aps_mobile/store/product_store.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {

  ProductTile({@required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 0.8,
              child: Image.network(product.img, fit: BoxFit.cover),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(product.descricao,
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    Text("R\$ ${product.preco.toStringAsFixed(2)}",
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _productImg(BuildContext context, String imgLink){

    ProductStore _productStore = ProductStore();

    return FutureBuilder(
      future: _productStore.getProductImage(imgLink),
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return AspectRatio(
            aspectRatio: 0.8,
              child: Center(
                child: CircularProgressIndicator(
                  valueColor:
                  AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                ),
              ));
        } else if (snapshot.hasError || !snapshot.hasData) {
          return AspectRatio(aspectRatio: 0.8,child: Container());
        } else {
          return AspectRatio(
            aspectRatio: 0.8,
            child: Image.memory(
              snapshot.data,
              width: 25.0,
              height: 25.0,
            ),
          );
        }
      },
    );
  }

}
