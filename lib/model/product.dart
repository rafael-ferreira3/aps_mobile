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

  Map<String, dynamic> toJson(){
    return {
      'idProduto' : idProduto,
      'idCategoria' : idCategoria,
      'descricao' : descricao,
      'img' : img,
      'preco' : preco
    };
  }

  factory Product.fromJson(Map<String, dynamic> productMap){
    return Product(
      idProduto: productMap['idProduto'],
      idCategoria: productMap['idCategoria'],
      descricao: productMap['descricao'],
      img: productMap['img'],
      preco: productMap['preco'],
    );
  }

  @override
  String toString() {
    return 'Product{idProduto: $idProduto, idCategoria: $idCategoria, descricao: $descricao, preco: $preco, img: $img}';
  }
}
