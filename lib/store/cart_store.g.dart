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

  final _$buscaCarrinhoClienteAsyncAction =
      AsyncAction('_CartStore.buscaCarrinhoCliente');

  @override
  Future<void> buscaCarrinhoClienteAndCalculaTotal(int idCliente) {
    return _$buscaCarrinhoClienteAsyncAction
        .run(() => super.buscaCarrinhoClienteAndCalculaTotal(idCliente));
  }

  final _$insereItemCarrinhoAsyncAction =
      AsyncAction('_CartStore.insereItemCarrinho');

  @override
  Future<void> insereItemCarrinho(User user, Product produto) {
    return _$insereItemCarrinhoAsyncAction
        .run(() => super.insereItemCarrinho(user, produto));
  }

  @override
  String toString() {
    return '''
itensCarrinho: ${itensCarrinho},
loading: ${loading}
    ''';
  }
}
