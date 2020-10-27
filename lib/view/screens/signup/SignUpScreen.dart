import 'package:aps_mobile/store/sign_up_store.dart';
import 'package:aps_mobile/store/user_manager_store.dart';
import 'package:aps_mobile/view/components/custom_form_field.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class SignUpScreen extends StatelessWidget {

  final SignUpStore _signUpStore = SignUpStore();
  final UserManagerStore userStore = GetIt.I<UserManagerStore>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  SignUpScreen(){
    reaction(
            (_) => _signUpStore.error,
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
        title: Text('Sign Up'),
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
                  label: "Nome",
                  enabled: _isNotLoading(),
                  errorText: _signUpStore.nameError,
                  onChange: _signUpStore.setName,
                );
              }),
              SizedBox(height: 16.0),
              Observer(builder: (_) {
                return CustomFormField(
                  label: "E-mail",
                  enabled: _isNotLoading(),
                  errorText: _signUpStore.emailError,
                  onChange: _signUpStore.setEmail,
                  keyboardType: TextInputType.emailAddress,
                );
              }),
              SizedBox(height: 16.0),
              Observer(builder: (_) {
                return CustomFormField(
                  label: "Telefone",
                  enabled: _isNotLoading(),
                  errorText: _signUpStore.phoneError,
                  onChange: _signUpStore.setPhone,
                  keyboardType: TextInputType.phone,
                  types: [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter()
                  ],
                );
              }),
              SizedBox(height: 16.0),
              Observer(builder: (_) {
                return CustomFormField(
                  label: "Rua",
                  enabled: _isNotLoading(),
                  errorText: _signUpStore.ruaError,
                  onChange: _signUpStore.setRua,
                );
              }),
              SizedBox(height: 16.0),
              Observer(builder: (_) {
                return CustomFormField(
                  label: "Numero",
                  enabled: _isNotLoading(),
                  errorText: _signUpStore.numeroError,
                  onChange: _signUpStore.setNumero,
                  keyboardType: TextInputType.number,
                  types: [
                    FilteringTextInputFormatter.digitsOnly
                  ],
                );
              }),
              SizedBox(height: 16.0),
              Observer(builder: (_) {
                return CustomFormField(
                  label: "Senha",
                  enabled: _isNotLoading(),
                  errorText: _signUpStore.pass1Error,
                  onChange: _signUpStore.setPass1,
                  obscure: true,
                );
              }),
              SizedBox(height: 16.0),
              Observer(builder: (_) {
                return CustomFormField(
                  label: "Confirmar Senha",
                  enabled: _isNotLoading(),
                  errorText: _signUpStore.pass2Error,
                  onChange: _signUpStore.setPass2,
                  obscure: true,
                );
              }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  spacing: 8.0,
                  children: [
                    const Text('Já tem uma conta?',
                        style: TextStyle(fontSize: 16)),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Entrar',
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
                    onPressed: _signUpStore.signUpPressed,
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
    return !_signUpStore.loading;
  }

  Widget _buttonChild(BuildContext context) {
    if (_isNotLoading()) {
      return Text(
        'Cadastre-se',
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


