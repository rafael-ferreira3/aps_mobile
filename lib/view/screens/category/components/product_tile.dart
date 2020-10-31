import 'package:aps_mobile/model/product.dart';
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
              child: Image.network(product.images[0], fit: BoxFit.cover),
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

  Widget _productImg(BuildContext context){
    return FutureBuilder(
      future: ,
      builder: (context, snapshot){
        return Container();
      },
    );
  }

}
