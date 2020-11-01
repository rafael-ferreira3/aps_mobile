import 'package:aps_mobile/store/cart_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CardPrice extends StatelessWidget {

  final _cartStore = GetIt.I<CartStore>();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Observer(
          builder: (context){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Resumo do Pedido",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Subtotal"),
                    Text("R\$ ${_cartStore.totalProdutos.toStringAsFixed(2)}"),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Frete"),
                    Text("R\$ ${_cartStore.frete}"),
                  ],
                ),
                Divider(),
                SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Total",style: TextStyle(fontWeight: FontWeight.w700),),
                    Text("R\$ ${(_cartStore.totalProdutos + _cartStore.frete).toStringAsFixed(2)}",
                      style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 16.0, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: 12.0),
              ],
            );
          },
        ),
      ),
    );
  }
}
