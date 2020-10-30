import 'package:aps_mobile/view/screens/category/category_screen.dart';
import 'package:mobx/mobx.dart';
import 'package:aps_mobile/store/page_store.dart';
import 'package:aps_mobile/view/screens/home/home_screen.dart';
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
          HomeScreen(),
          CategoryScreen(),
          Container(color: Colors.yellow,),
          Container(color: Colors.purple,),
          Container(color: Colors.blue,),
        ],
      ),
    );
  }
}
