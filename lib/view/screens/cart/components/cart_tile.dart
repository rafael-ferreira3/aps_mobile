import 'package:aps_mobile/model/cart.dart';
import 'package:aps_mobile/store/cart_store.dart';
import 'package:aps_mobile/store/product_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CartTile extends StatelessWidget {
  CartTile({@required this.cart});

  final Cart cart;

  final _cartStore = GetIt.I<CartStore>();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            width: 120.0,
            height: 150.0,
            child: _productImg(context, cart.produto.img),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    cart.produto.descricao,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 17.0),
                  ),
                  Text(
                    "R\$ ${cart.produto.preco}",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.remove,
                        ),
                        color: Theme.of(context).primaryColor,
                        disabledColor: Colors.grey,
                        onPressed: _getDecrementFunction(),
                      ),
                      Text(cart.quantidade.toString()),
                      IconButton(
                        icon: Icon(Icons.add,
                            color: Theme.of(context).primaryColor),
                        disabledColor: Colors.grey,
                        onPressed: _getIncrementFunction(),
                      ),
                      FlatButton(
                        child: Text("Remover"),
                        textColor: Colors.grey[500],
                        onPressed: _getRemoveFuncion(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _isEnable() {
    return !_isLoading();
  }

  bool _isLoading() {
    return _cartStore.loading;
  }

  Function _getRemoveFuncion() {
    if (_isLoading()) {
      return null;
    }
    return _removeFunction;
  }

  Future<void> _removeFunction() async{
    await _cartStore.removerItemCarrinhoAndCalculaTotal(cart);
    _cartStore.buscaCarrinhoClienteAndCalculaTotal(cart.user.id);
  }

  Function _getIncrementFunction(){
    if (_isLoading()) {
      return null;
    }
    return _incrementFunction;
  }

  Function _getDecrementFunction(){
    if (_isLoading() || cart.quantidade <= 1) {
      return null;
    }
    return _decrementFunction;
  }

  Future<void> _incrementFunction() async{
    _cartStore.incrementarItemAndAtualizaCarrinhoAndCalculaTotal(cart);
  }

  Future<void> _decrementFunction() async{
    _cartStore.decrementarItemAndAtualizaCarrinhoAndCalculaTotal(cart);
  }

  Widget _productImg(BuildContext context, String imgLink) {
    ProductStore _productStore = ProductStore();

    return FutureBuilder(
      future: _productStore.getProductImage(imgLink),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            ),
          );
        } else if (snapshot.hasError || !snapshot.hasData) {
          return Container(width: 120);
        } else {
          return Container(
            width: 120,
            child: Image.memory(
              snapshot.data,
              fit: BoxFit.cover,
            ),
          );
        }
      },
    );
  }
}
