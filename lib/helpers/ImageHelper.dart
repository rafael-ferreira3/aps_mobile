import 'dart:convert';
import 'dart:typed_data';

Uint8List imageFromBase64String(String base64String) {
  String imgBase64 = base64String.split(',')[1];
  return base64Decode(imgBase64);
}