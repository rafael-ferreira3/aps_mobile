import 'dart:convert';

import 'package:aps_mobile/model/user.dart';
import 'package:http/http.dart' as http;
import '../helpers/constants.dart';

class UserRepository{

  final header = {'Content-Type': 'application/json'};

  Future<User> loginWithEmail(String email, String password) async{
    final loginUrl = "$URL/api/logarCliente";

    final body = {
      'username' : email,
      'senha' : password
    };

    final response = await http.post(loginUrl,headers: header, body: jsonEncode((body)));
    if(response.statusCode == 200){
      return User.fromJson(jsonDecode(response.body));
    }else{
      return Future.error(response.body);
    }
  }

  Future<User> signUp(User user) async{
    final loginUrl = "$URL/api/cliente";

    final body = {
      'nome' : user.name,
      'email' : user.email,
      'senha' : user.password,
      'telepone' : user.phone,
      'rua' : user.rua,
      'numero' : user.numero
    };

    final response = await http.post(loginUrl,headers: header, body: jsonEncode((body)));
    if(response.statusCode == 200){
      return User.fromJson(jsonDecode(response.body));
    }else{
      return Future.error(response.body);
    }
  }

}