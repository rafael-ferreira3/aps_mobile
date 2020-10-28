import 'dart:convert';

String getErrorMessage(String body){
  Map<String, dynamic> result = jsonDecode(body);
  if(result["message"] == ""){
    return result["error"];
  }
  return result["message"];
}