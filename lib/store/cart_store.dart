import 'package:aps_mobile/model/cart.dart';
import 'package:aps_mobile/model/pedido.dart';
import 'package:aps_mobile/model/product.dart';
import 'package:aps_mobile/model/user.dart';
import 'package:aps_mobile/repositories/cart_repository.dart';
import 'package:aps_mobile/repositories/pedido_repository.dart';
import 'package:mobx/mobx.dart';

part 'cart_store.g.dart';

class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {

  final _cartRepository = CartRepository();
  final _pedidoRepository = PedidoRepository();

  @observable
  List<Cart> itensCarrinho = [];

  @observable
  double frete = 19.99;

  @observable
  bool loading = false;

  @action
  Future<void> buscaCarrinhoClienteAndCalculaTotal(int idCliente) async{
    loading = true;

    itensCarrinho = await _cartRepository.buscaCarrinhoCliente(idCliente);
    calculaTotalProdutos();

    loading = false;
  }

  @action
  Future<void> insereItemCarrinho(User user, Product produto) async{
    loading = true;

    Cart cart = Cart(user: user, produto: produto, quantidade: 1);

    await _cartRepository.insereItemCarrinho(cart);

    loading = false;
  }

  @action
  Future<void> incrementarItemAndAtualizaCarrinhoAndCalculaTotal(Cart cart) async {

    await _cartRepository.incrementarItemCarrinho(cart);
    itensCarrinho = await _cartRepository.buscaCarrinhoCliente(cart.user.id);
    calculaTotalProdutos();
  }

  @action
  Future<void> decrementarItemAndAtualizaCarrinhoAndCalculaTotal(Cart cart) async {

    await _cartRepository.decrementarItemCarrinho(cart);
    itensCarrinho = await _cartRepository.buscaCarrinhoCliente(cart.user.id);
    calculaTotalProdutos();
  }

  @action
  Future<void> removerItemCarrinhoAndCalculaTotal(Cart cart) async {
    loading = true;

    await _cartRepository.removerItemCarrinho(cart);
    calculaTotalProdutos();

    loading = false;
  }

  @observable
  double totalProdutos = 0.0;

  @action
  void setTotalProdutos(double value) => totalProdutos = value;

  @action
  void calculaTotalProdutos(){
    totalProdutos = 0.0;
    for(Cart cart in itensCarrinho) {
      totalProdutos += cart.produto.preco * cart.quantidade;
    }
  }


  Future<Pedido> finalizarPedidoCliente(User user) async{
    loading = true;

    Pedido pedido = await _pedidoRepository.finalizarPedidoCliente(user.id);

    loading = false;
    return pedido;
  }

}