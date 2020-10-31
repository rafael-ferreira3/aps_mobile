import 'package:aps_mobile/store/category_store.dart';
import 'package:aps_mobile/view/custom_drawer/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProductsTab extends StatelessWidget {
  final CategoryStore _categoryStore = CategoryStore();

  ProductsTab() {
    _categoryStore.buscaTodasCategorias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Categorias'),
        centerTitle: true,
      ),
      body: Observer(
        builder: (context) {
          if (_categoryStore.loading) {
            return Center(
                child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            ));
          } else {
            return RefreshIndicator(
              onRefresh: _categoryStore.buscaTodasCategorias,
              child: ListView.builder(
                itemCount: _categoryStore.categorias.length,
                itemBuilder: (context, index) {
                  return _categoryCard(context, index);
                },
              ),
            );
          }
        },
      ),
    );
  }

  Widget _categoryCard(BuildContext context, int index) {
    return ListTile(
      leading: FutureBuilder(
        future: _categoryStore
            .getCategoryImage(_categoryStore.categorias[index].linkImg),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
                width: 50.0,
                height: 50.0,
                child: Center(
                  child: CircularProgressIndicator(
              valueColor:
                    AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            ),
                ));
          } else if (snapshot.hasError || !snapshot.hasData) {
            return Container(
              width: 50.0,
              height: 50.0,);
          } else {
            return CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.transparent,
              child: Image.memory(
                snapshot.data,
                width: 25.0,
                height: 25.0,
              ),
            );
          }
        },
      ),
      title: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(_categoryStore.categorias[index].descricao),
        ),
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: Theme.of(context).primaryColor,
      ),
      onTap: () {},
    );
  }
}
