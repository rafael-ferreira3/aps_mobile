import 'package:aps_mobile/store/page_store.dart';
import 'package:aps_mobile/store/user_manager_store.dart';
import 'package:aps_mobile/view/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'drawer_constants.dart';

class CustomDrawerHeader extends StatelessWidget {

  final userManagerStore = GetIt.I<UserManagerStore>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        if(userManagerStore.isLoggedIn){
          //GetIt.I<PageStore>().setPage(MINHA_CONTA_PAGE);
        } else {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => LoginScreen())
          );
        }
      },
      child: Container(
        color: Theme.of(context).primaryColor,
        height: 95.0,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Icon(
              Icons.person,
              color: Colors.white,
              size: 35.0,
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_getUserNameText(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500)),
                  Text(_getUserEmailText(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String _getUserNameText(){
    if(userManagerStore.isLoggedIn){
      return userManagerStore.user.name;
    }
    return 'Acesse sua Conta agora!';
  }

  String _getUserEmailText(){
    if(userManagerStore.isLoggedIn){
      return userManagerStore.user.email;
    }
    return 'Clique Aqui';
  }

}
