import 'package:aps_mobile/store/cart_store.dart';
import 'package:aps_mobile/store/user_manager_store.dart';
import 'package:aps_mobile/view/screens/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/services.dart';
import 'helpers/colors_constants.dart';
import 'store/page_store.dart';

void main() {
  setupConfiguration();
  setupLocations();
  runApp(MyApp());
}

void setupLocations() {
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(UserManagerStore());
  GetIt.I.registerSingleton(CartStore());
}

void setupConfiguration(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: statusBar, //or set color with: Color(0xFF0000FF)
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Loja",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primaryColor: Color(0xff00bfa5),
        primaryColor: primaryColor,
        focusColor: primaryColor,
        buttonTheme: ButtonThemeData(
          buttonColor: primaryColor,
          textTheme: ButtonTextTheme.primary
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xff7b1fa2),
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 18.0, color: Colors.white),
          headline6: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
        appBarTheme: AppBarTheme(
            actionsIconTheme: IconThemeData(
              color: Colors.white,
            ),
            textTheme: TextTheme(
              bodyText1: TextStyle(fontSize: 18.0, color: Colors.white),
              headline6: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            )),
        textSelectionTheme:
        TextSelectionThemeData(cursorColor: primaryColor),
      ),
      home: BaseScreen(),
    );
  }
}
