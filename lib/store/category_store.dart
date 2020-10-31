import 'dart:convert';
import 'dart:typed_data';
import 'package:aps_mobile/model/category.dart';
import 'package:aps_mobile/repositories/category_repository.dart';
import 'package:mobx/mobx.dart';

part 'category_store.g.dart';

class CategoryStore = _CategoryStore with _$CategoryStore;

abstract class _CategoryStore with Store {

  CategoryRepository _categoryRepository = CategoryRepository();

  @observable
  List<Category> categorias = [];

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @action
  Future<void> buscaTodasCategorias() async{
    loading = true;

    categorias = await _categoryRepository.buscaTodasCategorias();

    loading = false;
  }

  Future<Uint8List> getCategoryImage(String imgLink) async{
    String imgBase64 = await _categoryRepository.getCategoryImg(imgLink);
    return _imageFromBase64String(imgBase64);
  }

  Uint8List _imageFromBase64String(String base64String) {
    String imgBase64 = base64String.split(',')[1];
    return base64Decode(imgBase64);
  }


}