import 'package:aps_mobile/model/Category.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {

  CategoryScreen({@required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.descricao),
        centerTitle: true,
      ),

    );
  }

}
