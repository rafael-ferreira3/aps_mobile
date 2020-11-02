import 'package:aps_mobile/store/pedido_store.dart';
import 'package:aps_mobile/store/user_manager_store.dart';
import 'package:aps_mobile/view/custom_drawer/custom_drawer.dart';
import 'package:aps_mobile/view/screens/login/login_screen.dart';
import 'package:aps_mobile/view/tabs/pedido/components/PedidoTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class PedidoTab extends StatelessWidget {

  final _userManagewrStore = GetIt.I<UserManagerStore>();
  final _pedidoStore = PedidoStore();

  PedidoTab(){
   if(_userManagewrStore.isLoggedIn){
     buscaPedidos();
   }
  }

  void buscaPedidos(){
    _pedidoStore.buscaPedidoPorCliente(_userManagewrStore.user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Pedidos'),
        centerTitle: true,
      ),
      body: Observer(
        builder: (context){
          if(_userManagewrStore.isLoggedIn){
            if(_pedidoStore.loading){
              return Center(
                  child: CircularProgressIndicator(
                    valueColor:
                    AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                  ));
            } else {
              return RefreshIndicator(
                onRefresh: () => _pedidoStore.buscaPedidoPorCliente(_userManagewrStore.user),
                child: ListView(
                  children: _pedidoStore.pedidos.map<PedidoTile>((pedido) =>
                      PedidoTile(pedido)).toList(),
                ),
              );
            }
          }else{
            return Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(Icons.view_list,
                      size: 80.0, color: Theme.of(context).primaryColor),
                  SizedBox(height: 16.0),
                  Text("Faça login para acompanhar!",
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
                          MaterialPageRoute(builder: (context)=> LoginScreen()));
                      buscaPedidos();
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
