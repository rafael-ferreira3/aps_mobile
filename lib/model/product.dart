class Product {

  Product({
    this.idProduto,
    this.idCategoria,
    this.descricao,
    this.preco,
    this.img});

  int idProduto;

  int idCategoria;

  String descricao;

  double preco;

  String img;

  @override
  String toString() {
    return 'Product{idProduto: $idProduto, idCategoria: $idCategoria, descricao: $descricao, preco: $preco, img: $img}';
  }
}
