// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartStore on _CartStore, Store {
  final _$itensCarrinhoAtom = Atom(name: '_CartStore.itensCarrinho');

  @override
  List<Cart> get itensCarrinho {
    _$itensCarrinhoAtom.reportRead();
    return super.itensCarrinho;
  }

  @override
  set itensCarrinho(List<Cart> value) {
    _$itensCarrinhoAtom.reportWrite(value, super.itensCarrinho, () {
      super.itensCarrinho = value;
    });
  }

  final _$freteAtom = Atom(name: '_CartStore.frete');

  @override
  double get frete {
    _$freteAtom.reportRead();
    return super.frete;
  }

  @override
  set frete(double value) {
    _$freteAtom.reportWrite(value, super.frete, () {
      super.frete = value;
    });
  }

  final _$loadingAtom = Atom(name: '_CartStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$totalProdutosAtom = Atom(name: '_CartStore.totalProdutos');

  @override
  double get totalProdutos {
    _$totalProdutosAtom.reportRead();
    return super.totalProdutos;
  }

  @override
  set totalProdutos(double value) {
    _$totalProdutosAtom.reportWrite(value, super.totalProdutos, () {
      super.totalProdutos = value;
    });
  }

  final _$buscaCarrinhoClienteAndCalculaTotalAsyncAction =
      AsyncAction('_CartStore.buscaCarrinhoClienteAndCalculaTotal');

  @override
  Future<void> buscaCarrinhoClienteAndCalculaTotal(int idCliente) {
    return _$buscaCarrinhoClienteAndCalculaTotalAsyncAction
        .run(() => super.buscaCarrinhoClienteAndCalculaTotal(idCliente));
  }

  final _$insereItemCarrinhoAsyncAction =
      AsyncAction('_CartStore.insereItemCarrinho');

  @override
  Future<void> insereItemCarrinho(User user, Product produto) {
    return _$insereItemCarrinhoAsyncAction
        .run(() => super.insereItemCarrinho(user, produto));
  }

  final _$incrementarItemAndAtualizaCarrinhoAndCalculaTotalAsyncAction =
      AsyncAction(
          '_CartStore.incrementarItemAndAtualizaCarrinhoAndCalculaTotal');

  @override
  Future<void> incrementarItemAndAtualizaCarrinhoAndCalculaTotal(Cart cart) {
    return _$incrementarItemAndAtualizaCarrinhoAndCalculaTotalAsyncAction.run(
        () => super.incrementarItemAndAtualizaCarrinhoAndCalculaTotal(cart));
  }

  final _$decrementarItemAndAtualizaCarrinhoAndCalculaTotalAsyncAction =
      AsyncAction(
          '_CartStore.decrementarItemAndAtualizaCarrinhoAndCalculaTotal');

  @override
  Future<void> decrementarItemAndAtualizaCarrinhoAndCalculaTotal(Cart cart) {
    return _$decrementarItemAndAtualizaCarrinhoAndCalculaTotalAsyncAction.run(
        () => super.decrementarItemAndAtualizaCarrinhoAndCalculaTotal(cart));
  }

  final _$removerItemCarrinhoAndCalculaTotalAsyncAction =
      AsyncAction('_CartStore.removerItemCarrinhoAndCalculaTotal');

  @override
  Future<void> removerItemCarrinhoAndCalculaTotal(Cart cart) {
    return _$removerItemCarrinhoAndCalculaTotalAsyncAction
        .run(() => super.removerItemCarrinhoAndCalculaTotal(cart));
  }

  final _$_CartStoreActionController = ActionController(name: '_CartStore');

  @override
  void setTotalProdutos(double value) {
    final _$actionInfo = _$_CartStoreActionController.startAction(
        name: '_CartStore.setTotalProdutos');
    try {
      return super.setTotalProdutos(value);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculaTotalProdutos() {
    final _$actionInfo = _$_CartStoreActionController.startAction(
        name: '_CartStore.calculaTotalProdutos');
    try {
      return super.calculaTotalProdutos();
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itensCarrinho: ${itensCarrinho},
frete: ${frete},
loading: ${loading},
totalProdutos: ${totalProdutos}
    ''';
  }
}
