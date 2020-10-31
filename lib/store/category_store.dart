import 'dart:typed_data';
import 'package:aps_mobile/helpers/ImageHelper.dart';
import 'package:aps_mobile/model/category.dart';
import 'package:aps_mobile/repositories/category_repository.dart';
import 'package:aps_mobile/repositories/image_repository.dart';
import 'package:mobx/mobx.dart';

part 'category_store.g.dart';

class CategoryStore = _CategoryStore with _$CategoryStore;

abstract class _CategoryStore with Store {

  final _categoryRepository = CategoryRepository();
  final _imageRepository = ImageRepository();

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
    String imgBase64 = await _imageRepository.getImgFromLink(imgLink);
    return imageFromBase64String(imgBase64);
  }


}