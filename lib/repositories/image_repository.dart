import 'package:http/http.dart' as http;

class ImageRepository{

  Future<String> getImgFromLink(String imgLink) async{
    final response = await http.get(imgLink);
    if(response.statusCode == 200){
      return response.body;
    }else{
      return Future.error("Erro");
    }
  }

}