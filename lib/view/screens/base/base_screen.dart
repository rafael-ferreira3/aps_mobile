import 'package:aps_mobile/view/tabs/home/home_tab.dart';
import 'package:aps_mobile/view/tabs/category/category_tab.dart';
import 'package:aps_mobile/view/tabs/pedido/pedido_tab.dart';
import 'file:///C:/aps/aps_mobile/lib/view/tabs/places/places_tab.dart';
import 'package:mobx/mobx.dart';
import 'package:aps_mobile/store/page_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {

  final PageController pageController = PageController();

  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  void initState() {
    super.initState();

    reaction((_) => pageStore.page,
            (page) => pageController.jumpToPage(page)

    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          HomeTab(),
          CategoryTab(),
          PedidoTab(),
          PlacesTab()
        ],
      ),
    );
  }
}
