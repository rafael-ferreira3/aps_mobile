import 'dart:typed_data';

import 'package:aps_mobile/helpers/ImageHelper.dart';
import 'package:aps_mobile/model/product.dart';
import 'package:aps_mobile/repositories/image_repository.dart';
import 'package:aps_mobile/repositories/product_repository.dart';
import 'package:mobx/mobx.dart';

part 'product_store.g.dart';

class ProductStore = _ProductStore with _$ProductStore;

abstract class _ProductStore with Store {

  final _productRepository = ProductRepository();
  final _imageRepository = ImageRepository();

  @observable
  List<Product> products = [];

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @action
  Future<void> buscaProductosCategoria(int idCategoria) async{
    loading = true;

    products = await _productRepository.buscaProdutosCategoria(idCategoria);

    loading = false;
  }

  Future<Uint8List> getProductImage(String imgLink) async{
    String imgBase64 = await _imageRepository.getImgFromLink(imgLink);
    return imageFromBase64String(imgBase64);
  }


}