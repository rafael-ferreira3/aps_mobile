import 'package:aps_mobile/model/product.dart';

class ItemPedido{

  ItemPedido({this.idItemPedido, this.quantidade, this.idPedido, this.product});

  int idItemPedido;
  int quantidade;
  int idPedido;
  Product product;

  factory ItemPedido.fromJson(Map<String, dynamic> itemPedidMap){
    return new ItemPedido(
      idItemPedido: itemPedidMap['idPedidoItem'],
      idPedido: itemPedidMap['idPedido'],
      product: Product.fromJson(itemPedidMap['produto']),
      quantidade: itemPedidMap['quantidade'],
    );
  }

  @override
  String toString() {
    return 'ItemPedido{idItemPedido: $idItemPedido, quantidade: $quantidade, idPedido: $idPedido, product: $product}';
  }
}