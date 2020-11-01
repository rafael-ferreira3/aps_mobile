import 'dart:convert';

import 'package:aps_mobile/helpers/constants.dart';
import 'package:aps_mobile/helpers/repositoryMessageHandler.dart';
import 'package:aps_mobile/model/cart.dart';
import 'package:http/http.dart' as http;

class CartRepository {

  final header = {'Content-Type': 'application/json;charset=UTF-8'};

  Future<List<Cart>> buscaCarrinhoCliente(int idCliente) async{
    final buscaCarrinhoCliente = "$URL/api/carrinho/$idCliente";

    final response = await http.get(buscaCarrinhoCliente);
    if(response.statusCode == 200){
      return jsonDecode(utf8.decode(response.bodyBytes)).map<Cart>((data){
        return Cart.fromJson(data);
      }).toList();
    }else{
      print(response.body);
      return Future.error(getErrorMessage(utf8.decode(response.bodyBytes)));
    }
  }

  Future<List<Cart>> insereItemCarrinho(Cart cart) async{
    final buscaCarrinhoCliente = "$URL/api/carrinho";

    final body = cart.toJson();

    final response = await http.post(buscaCarrinhoCliente,headers: header, body: jsonEncode(body));

    if(response.statusCode == 200){
      return jsonDecode(utf8.decode(response.bodyBytes)).map<Cart>((data){
        return Cart.fromJson(data);
      }).toList();
    }else{
      return Future.error(getErrorMessage(utf8.decode(response.bodyBytes)));
    }
  }

  Future<void> incrementarItemCarrinho(Cart cart) async {
    final incremetarItemCarrinhoURL = '$URL/api/carrinho/increment/${cart.user.id}/${cart.idCart}';

    final response = await http.put(incremetarItemCarrinhoURL);

    if(response.statusCode != 200){
      return Future.error(getErrorMessage(utf8.decode(response.bodyBytes)));
    }

  }

  Future<void> decrementarItemCarrinho(Cart cart) async {
    final decrementarItemCarrinhoURL = '$URL/api/carrinho/decrement/${cart.user.id}/${cart.idCart}';

    final response = await http.put(decrementarItemCarrinhoURL);

    if(response.statusCode != 200){
      return Future.error(getErrorMessage(utf8.decode(response.bodyBytes)));
    }

  }

  Future<void> removerItemCarrinho(Cart cart) async{
    final removerItemCarrinhoURL = '$URL/api/carrinho/${cart.user.id}/${cart.idCart}';

    final response = await http.delete(removerItemCarrinhoURL);

    if(response.statusCode != 200){
      return Future.error(getErrorMessage(utf8.decode(response.bodyBytes)));
    }
  }

}