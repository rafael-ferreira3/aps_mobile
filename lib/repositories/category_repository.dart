import 'dart:convert';
import 'package:aps_mobile/helpers/constants.dart';
import 'package:aps_mobile/helpers/repositoryMessageHandler.dart';
import 'package:aps_mobile/model/category.dart';
import 'package:http/http.dart' as http;

class CategoryRepository{

  final header = {'Content-Type': 'application/json;charset=UTF-8'};

  Future<List<Category>> buscaTodasCategorias() async{
    final buscaCategoriasURl = "$URL/api/categorias";

    final response = await http.get(buscaCategoriasURl);
    if(response.statusCode == 200){
      return jsonDecode(utf8.decode(response.bodyBytes)).map<Category>((data){
        return Category(idCategoria: data['idCategoria'],descricao: data['descr'],linkImg:data['img'] );
      }).toList();
    }else{
      return Future.error(getErrorMessage(utf8.decode(response.bodyBytes)));
    }
  }

}