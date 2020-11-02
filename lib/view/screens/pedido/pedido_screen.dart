import 'package:aps_mobile/model/pedido.dart';
import 'package:flutter/material.dart';

class PedidoScreen extends StatelessWidget {

  PedidoScreen({@required this.pedido});

  final Pedido pedido;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedido Realizado"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.check,
              color: Theme.of(context).primaryColor,
              size: 80.0,
            ),
            Text("Pedido Realizado com Sucesso!",
              style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
            ),
            Text("Código do Pedido: ${pedido.idPedido}",
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
