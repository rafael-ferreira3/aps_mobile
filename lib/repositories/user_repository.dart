import 'dart:convert';

import 'package:aps_mobile/helpers/repositoryMessageHandler.dart';
import 'package:aps_mobile/model/user.dart';
import 'package:http/http.dart' as http;
import '../helpers/constants.dart';

class UserRepository{

  final header = {'Content-Type': 'application/json;charset=UTF-8'};

  Future<User> loginWithEmail(String email, String password) async{
    final loginUrl = "$URL/api/logarCliente";

    final body = {
      'username' : email,
      'senha' : password
    };

    final response = await http.post(loginUrl,headers: header, body: jsonEncode((body)));
    if(response.statusCode == 200){
      return User.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    }else{
      return Future.error(getErrorMessage(utf8.decode(response.bodyBytes)));
    }
  }

  Future<User> signUp(User user) async{
    final signUpURL = "$URL/api/cliente";

    final body = {
      'nome' : user.name,
      'email' : user.email,
      'senha' : user.password,
      'telepone' : user.phone,
      'rua' : user.rua,
      'numero' : user.numero
    };

    final response = await http.post(signUpURL,headers: header, body: jsonEncode((body)));
    if(response.statusCode == 200){
      return User.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    }else{
      return Future.error(getErrorMessage(utf8.decode(response.bodyBytes)));
    }
  }

}