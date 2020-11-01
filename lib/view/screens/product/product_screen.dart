import 'package:aps_mobile/model/product.dart';
import 'package:aps_mobile/store/cart_store.dart';
import 'package:aps_mobile/store/product_store.dart';
import 'package:aps_mobile/store/user_manager_store.dart';
import 'package:aps_mobile/view/screens/cart/cart_screen.dart';
import 'package:aps_mobile/view/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class ProductScreen extends StatelessWidget {
  final Product product;

  final _productStore = ProductStore();
  final _userManagerStore = GetIt.I<UserManagerStore>();
  final _cartStore = GetIt.I<CartStore>();

  ProductScreen({@required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.descricao),
        centerTitle: true,
      ),
      body: Observer(
        builder: (context){
          if(_cartStore.loading){
            return Center(
                child: CircularProgressIndicator(
                  valueColor:
                  AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                ));
          }else{
            return ListView(
              children: [
                _productImg(context, product.img),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        product.descricao,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 3,
                      ),
                      Text("R\$ ${product.preco.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).primaryColor)),
                      SizedBox(height: 16.0),
                      SizedBox(
                        height: 44.0,
                        child: RaisedButton(
                          onPressed: () async{
                            if (_userManagerStore.isLoggedIn) {
                              await _cartStore.insereItemCarrinho(_userManagerStore.user, product);
                              await Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => CartScreen())
                              );
                            } else {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                            }
                          },
                          child: Observer(
                            builder: (context) {
                              return Text(
                                  _userManagerStore.isLoggedIn
                                      ? "Adicionar ao carrinho"
                                      : "Entre para Comprar",
                                  style: TextStyle(fontSize: 18.0));
                            },
                          ),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _productImg(BuildContext context, String imgLink) {
    return FutureBuilder(
      future: _productStore.getProductImage(imgLink),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return AspectRatio(
              aspectRatio: 0.9,
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor),
                ),
              ));
        } else if (snapshot.hasError || !snapshot.hasData) {
          return AspectRatio(aspectRatio: 0.9, child: Container());
        } else {
          return AspectRatio(
            aspectRatio: 0.9,
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
