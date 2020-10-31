class Category{

  Category({this.idCategoria, this.descricao, this.linkImg});

  int idCategoria;
  String descricao;
  String linkImg;

  @override
  String toString() {
    return 'Category{idCategoria: $idCategoria, descricao: $descricao, linkImg: $linkImg}';
  }
}