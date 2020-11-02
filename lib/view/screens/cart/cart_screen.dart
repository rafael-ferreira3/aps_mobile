import 'package:aps_mobile/model/pedido.dart';
import 'package:aps_mobile/store/cart_store.dart';
import 'package:aps_mobile/store/user_manager_store.dart';
import 'package:aps_mobile/view/screens/cart/components/card_price.dart';
import 'package:aps_mobile/view/screens/cart/components/cart_tile.dart';
import 'package:aps_mobile/view/screens/login/login_screen.dart';
import 'package:aps_mobile/view/screens/pedido/pedido_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CartScreen extends StatelessWidget {

  final _userManagerStore = GetIt.I<UserManagerStore>();
  final _cartStore = GetIt.I<CartStore>();

  CartScreen(){
    if(_userManagerStore.isLoggedIn){
      _buscaCarrinho();
    }
  }

  Future<void> _buscaCarrinho() async{
    _cartStore.buscaCarrinhoClienteAndCalculaTotal(_userManagerStore.user.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: RefreshIndicator(
        onRefresh: _buscaCarrinho,
        child: Observer(
          builder: (context) {
            if (_cartStore.loading) {
              return Center(
                  child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
              ));
            } else {
              if(!_userManagerStore.isLoggedIn){
                return Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Icon(Icons.remove_shopping_cart,
                          size: 80.0, color: Theme.of(context).primaryColor),
                      SizedBox(height: 16.0),
                      Text("Faça login para adicionar produtos!",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                      SizedBox(height: 16.0),
                      RaisedButton(
                        child: Text("Entrar",
                            style: TextStyle(
                              fontSize: 18.0,)),
                        textColor: Colors.white,
                        color: Theme.of(context).primaryColor,
                        onPressed: () async{
                          await Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=>LoginScreen()));
                          _buscaCarrinho();
                        },
                      ),
                    ],
                  ),
                );
              } else if (_cartStore.itensCarrinho.isEmpty) {
                return Center(
                  child: Text("Nenhum Produto no Carrinho!",
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                );
              } else {
                return ListView(
                  padding: EdgeInsets.all(8.0),
                  children: [
                    Column(
                      children: _cartStore.itensCarrinho.map(
                          (cartItem) => CartTile(cart: cartItem)
                      ).toList(),
                    ),
                    CardPrice(),
                    RaisedButton(
                      child: Text("Finalizar Pedido",
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                      ),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: () async{
                        Pedido pedido = await _cartStore.finalizarPedidoCliente(_userManagerStore.user);
                        await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PedidoScreen(pedido: pedido)
                        ));
                        _cartStore.buscaCarrinhoClienteAndCalculaTotal(_userManagerStore.user.id);
                      },
                    )
                  ],
                );
              }
            }
          },
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text("Meu Carrinho"),
      actions: <Widget>[
        Container(
          padding: EdgeInsets.only(right: 8.0),
          alignment: Alignment.center,
          child: Observer(
            builder: (_) {
              int qtdeProdutos = _cartStore.itensCarrinho.length;
              return Text(
                "${qtdeProdutos ?? 0} ${qtdeProdutos == 1 ? "Item" : "Itens"}",
                style: TextStyle(fontSize: 17.0),
              );
            },
          ),
        ),
      ],
    );
  }
}
