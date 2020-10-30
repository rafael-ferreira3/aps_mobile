import 'package:aps_mobile/repositories/category_repository.dart';
import 'package:aps_mobile/store/category_store.dart';
import 'package:aps_mobile/view/custom_drawer/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart),
        onPressed: () async{
          /*CategoryRepository categoryRepository = CategoryRepository();
          print(await categoryRepository.buscaTodasCategorias());
          print(await categoryRepository.getCategoryImg('http://15.228.34.148:8082/api/categoria/img/7'));
          CategoryStore categoryStore = CategoryStore();
          print(await categoryStore.getCategoryImage('http://15.228.34.148:8082/api/categoria/img/7'));*/
        },
      ),
      drawer: CustomDrawer(),
      backgroundColor: Theme.of(context).primaryColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            iconTheme: Theme.of(context).appBarTheme.actionsIconTheme,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            textTheme: Theme.of(context).appBarTheme.textTheme,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "Novidades",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              centerTitle: true,
            ),
            centerTitle: true,
          ),
          SliverStaggeredGrid.count(
            crossAxisCount: 2,
            staggeredTiles: _tileList(),
            children: _imagens(),
          ),
        ],
      ),
    ));
  }

  final List<Map<String, dynamic>> imgs = [
    {
      "imgLink":
          "https://images.unsplash.com/photo-1512436991641-6745cdb1723f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
      "x": 2,
      "y": 1
    },
    {
      "imgLink":
          "https://images.unsplash.com/photo-1558769132-cb1aea458c5e?ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80",
      "x": 1,
      "y": 1
    },
    {
      "imgLink":
          "https://images.unsplash.com/photo-1516762689617-e1cffcef479d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=654&q=80",
      "x": 1,
      "y": 2
    },
    {
      "imgLink":
          "https://images.unsplash.com/photo-1551488831-00ddcb6c6bd3?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
      "x": 1,
      "y": 1
    },
    {
      "imgLink":
          "https://images.unsplash.com/photo-1567401893414-76b7b1e5a7a5?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
      "x": 1,
      "y": 1
    },
    {
      "imgLink":
          "https://images.unsplash.com/photo-1556905055-8f358a7a47b2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
      "x": 1,
      "y": 1
    },
    {
      "imgLink":
          "https://images.unsplash.com/photo-1512436991641-6745cdb1723f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
      "x": 2,
      "y": 1
    },
    {
      "imgLink":
          "https://images.unsplash.com/photo-1558769132-cb1aea458c5e?ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80",
      "x": 1,
      "y": 1
    },
    {
      "imgLink":
          "https://images.unsplash.com/photo-1516762689617-e1cffcef479d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=654&q=80",
      "x": 1,
      "y": 2
    },
    {
      "imgLink":
          "https://images.unsplash.com/photo-1551488831-00ddcb6c6bd3?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
      "x": 1,
      "y": 1
    },
    {
      "imgLink":
          "https://images.unsplash.com/photo-1567401893414-76b7b1e5a7a5?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
      "x": 1,
      "y": 1
    },
    {
      "imgLink":
          "https://images.unsplash.com/photo-1556905055-8f358a7a47b2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
      "x": 1,
      "y": 1
    }
  ];

  List<StaggeredTile> _tileList() {
    return imgs.map((img) {
      return StaggeredTile.count(img["x"], img["y"]);
    }).toList();
  }

  List<Widget> _imagens() {
    return imgs.map<Widget>((img) {
      return FittedBox(fit: BoxFit.fill, child: Image.network(img["imgLink"]));
    }).toList();
  }
}
