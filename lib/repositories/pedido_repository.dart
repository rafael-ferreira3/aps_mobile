import 'dart:convert';

import 'package:aps_mobile/helpers/constants.dart';
import 'package:aps_mobile/helpers/repositoryMessageHandler.dart';
import 'package:aps_mobile/model/pedido.dart';
import 'package:http/http.dart' as http;

class PedidoRepository{

  final header = {'Content-Type': 'application/json;charset=UTF-8'};

  Future<Pedido> finalizarPedidoCliente(int idCliente) async{
    final finalizarPedidoClienteURl = "$URL/api/pedido";

    final body = {
      "idCliente" : idCliente
    };

    final response = await http.post(finalizarPedidoClienteURl, headers: header, body: jsonEncode(body));
    if(response.statusCode == 200){
      return Pedido.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    }else{
      print(response.body);
      return Future.error(getErrorMessage(utf8.decode(response.bodyBytes)));
    }
  }

  Future<List<Pedido>> buscaPedidosPorCliente(int idCliente) async{
    final buscaPedidoPorClienteURl = "$URL/api/pedidos/$idCliente";

    final response = await http.get(buscaPedidoPorClienteURl);
    if(response.statusCode == 200){
      return jsonDecode(utf8.decode(response.bodyBytes)).map<Pedido>(
          (pedido) => Pedido.fromJson(pedido)
      ).toList();
    }else{
      print(response.body);
      return Future.error(getErrorMessage(utf8.decode(response.bodyBytes)));
    }
  }

}