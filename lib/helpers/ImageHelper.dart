import 'dart:convert';
import 'dart:typed_data';

Uint8List imageFromBase64String(String base64String) {
  String imgBase64;
  if(base64String.contains(",")){
    imgBase64 = base64String.split(',')[1];
  } else {
    imgBase64 = base64String;
  }
  return base64Decode(imgBase64);
}