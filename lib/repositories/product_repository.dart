import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:aps_mobile/helpers/constants.dart';
import 'package:aps_mobile/helpers/repositoryMessageHandler.dart';
import 'package:aps_mobile/model/product.dart';

class ProductRepository{

  final header = {'Content-Type': 'application/json;charset=UTF-8'};

  Future<List<Product>> buscaProdutosCategoria(int idCategoria) async{
    final buscaCategoriasURl = "$URL/api/produto/categoria/$idCategoria";

    final response = await http.get(buscaCategoriasURl);
    if(response.statusCode == 200){
      return jsonDecode(utf8.decode(response.bodyBytes)).map<Product>((data){
        return Product.fromJson(data);
      }).toList();
    }else{
      return Future.error(getErrorMessage(utf8.decode(response.bodyBytes)));
    }
  }

}