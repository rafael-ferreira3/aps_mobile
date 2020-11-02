import 'package:aps_mobile/model/itens_pedidos.dart';
import 'package:aps_mobile/model/pedido.dart';
import 'package:flutter/material.dart';

class PedidoTile extends StatelessWidget {

  PedidoTile(this.pedido);

  final Pedido pedido;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Código do Pedido: ${pedido.idPedido}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.0,),
          Text(
            _buildProductText(pedido.itensPedido),
          ),
          SizedBox(height: 4.0),
        ],
      ),
      ),
    );
  }

  String _buildProductText(List<ItemPedido> itensPedido){
    String text  =  "Descrição:\n";
    for(ItemPedido item in itensPedido){
      text += "${item.quantidade} x ${item.product.descricao} (R\$${item.product.preco.toStringAsFixed(2)})\n";
    }
    text += "Total: R\$ ${pedido.valorTotal.toStringAsFixed(2)}";
    return text;
  }

}
