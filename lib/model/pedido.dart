import 'package:aps_mobile/model/itens_pedidos.dart';

class Pedido{

  Pedido({this.idPedido, this.idCliente, this.valorTotal, this.itensPedido});

  int idPedido;
  int idCliente;
  double valorTotal;
  List<ItemPedido> itensPedido;

  factory Pedido.fromJson(Map<String, dynamic> pedidoMap){
    return Pedido(
      idPedido: pedidoMap['idPedido'],
      idCliente: pedidoMap['idCliente'],
      valorTotal: pedidoMap['valorTotal'],
      itensPedido: pedidoMap['itensPedido'].map<ItemPedido>(
          (itemPedidMap) => ItemPedido.fromJson(itemPedidMap)
      ).toList()
    );
  }

  @override
  String toString() {
    return 'Pedido{idPedido: $idPedido, idCliente: $idCliente, valorTotal: $valorTotal, itensPedido: $itensPedido}';
  }
}