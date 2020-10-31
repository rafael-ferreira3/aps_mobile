import 'package:aps_mobile/model/product.dart';
import 'package:mobx/mobx.dart';

part 'product_store.g.dart';

class ProductStore = _ProductStore with _$ProductStore;

abstract class _ProductStore with Store {

  @observable
  List<Product> products;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @action
  Future<void> buscaProductosCategoria(int idCategoria) async{
    loading = true;

    //BUSCA PRODUTOS POR CTAGEORIA

    loading = false;
  }

}