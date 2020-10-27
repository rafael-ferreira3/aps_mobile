import 'package:aps_mobile/store/login_store.dart';
import 'package:aps_mobile/store/user_manager_store.dart';
import 'package:aps_mobile/view/components/custom_form_field.dart';
import 'package:aps_mobile/view/screens/signup/SignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class LoginScreen extends StatelessWidget {
  final LoginStore _loginStore = LoginStore();
  final UserManagerStore userStore = GetIt.I<UserManagerStore>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  LoginScreen() {
    reaction(
        (_) => _loginStore.error,
        (erro) => {
              _scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text(erro,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500
                  ),
                ),
                backgroundColor: Theme.of(_scaffoldKey.currentContext).primaryColor,
                duration: Duration(seconds: 2),
              ))
            });

    when((_) => userStore.isLoggedIn,() => popScreen());
  }

  void popScreen(){
    Navigator.pop(_scaffoldKey.currentContext);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Sign In'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Observer(builder: (_) {
                return CustomFormField(
                  label: "E-mail",
                  enabled: _isNotLoading(),
                  errorText: _loginStore.emailError,
                  onChange: _loginStore.setEmail,
                  keyboardType: TextInputType.emailAddress,
                );
              }),
              SizedBox(height: 8.0),
              Observer(builder: (_) {
                return CustomFormField(
                    label: "Senha",
                    obscure: true,
                    enabled: _isNotLoading(),
                    errorText: _loginStore.passwordError,
                    onChange: _loginStore.setPassword);
              }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  spacing: 8.0,
                  children: [
                    const Text('Não tem uma conta?',
                        style: TextStyle(fontSize: 16)),
                    GestureDetector(
                      onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => SignUpScreen())
                      );
                      },
                      child: Text('Cadastre-se',
                          style: TextStyle(
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                              color: Theme.of(context).primaryColor
                          )),
                    ),
                  ],
                ),
              ),
              Observer(builder: (_) {
                return SizedBox(
                  height: 45,
                  child: RaisedButton(
                    onPressed: _loginStore.loginPressed,
                    child: _buttonChild(context),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  bool _isNotLoading() {
    return !_loginStore.loading;
  }

  Widget _buttonChild(BuildContext context) {
    if (_isNotLoading()) {
      return Text(
        'Entrar',
        style: Theme.of(context).textTheme.headline6,
      );
    }
    return Container(
        height: 35,
        width: 35,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
        ));
  }
}
