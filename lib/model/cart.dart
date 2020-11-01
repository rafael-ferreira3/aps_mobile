import 'package:aps_mobile/model/product.dart';
import 'package:aps_mobile/model/user.dart';

class Cart{

  Cart({this.idCart, this.user, this.produto, this.quantidade});

  int idCart;
  User user;
  Product produto;
  int quantidade;

  factory Cart.fromJson(Map<String, dynamic> cartMap){
    return Cart(
      idCart: cartMap['idCarrinho'],
      user: User.fromJson(cartMap['cliente']),
      produto: Product.fromJson(cartMap['produto']),
      quantidade: cartMap['quantidade']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'idCarrinho': idCart,
      'idCliente': user.id,
      'idProduto': produto.idProduto,
      'quantidade' : quantidade
    };
  }

  @override
  String toString() {
    return 'Cart{idCart: $idCart, idCliente: ${user.id}, idProduto: ${produto.idProduto}, quantidade: $quantidade}';
  }
}