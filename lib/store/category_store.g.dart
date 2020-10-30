// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoryStore on _CategoryStore, Store {
  final _$categoriasAtom = Atom(name: '_CategoryStore.categorias');

  @override
  List<Category> get categorias {
    _$categoriasAtom.reportRead();
    return super.categorias;
  }

  @override
  set categorias(List<Category> value) {
    _$categoriasAtom.reportWrite(value, super.categorias, () {
      super.categorias = value;
    });
  }

  final _$loadingAtom = Atom(name: '_CategoryStore.loading');

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

  final _$buscaTodasCategoriasAsyncAction =
      AsyncAction('_CategoryStore.buscaTodasCategorias');

  @override
  Future<void> buscaTodasCategorias() {
    return _$buscaTodasCategoriasAsyncAction
        .run(() => super.buscaTodasCategorias());
  }

  final _$_CategoryStoreActionController =
      ActionController(name: '_CategoryStore');

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_CategoryStoreActionController.startAction(
        name: '_CategoryStore.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_CategoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categorias: ${categorias},
loading: ${loading}
    ''';
  }
}
