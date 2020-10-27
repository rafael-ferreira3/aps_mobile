import 'package:aps_mobile/repositories/user_repository.dart';
import 'package:aps_mobile/store/user_manager_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:aps_mobile/helpers/extensions.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {

  UserRepository _userRepository = UserRepository();

  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid =>email != null &&email.isEmailValid();

  String get emailError {
    if(email == null || emailValid)
      return null;
    return 'Email Inválido';
  }

  @observable
  String password;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get passwordValid => password != null && password.length >= 6;

  String get passwordError {
    if (password == null || passwordValid)
      return null;
    else
      return 'Senha Inválida';
  }

  bool _isAllFieldValid(){
    return emailValid && passwordValid;
  }

  @computed
  Function get loginPressed{
    if(_isAllFieldValid() && !loading){
      return _login;
    }
    return null;
  }

  @observable
  bool loading = false;

  @observable
  String error;

  @action
  Future<void> _login() async{
    loading = true;

    error = null;

    try{
      final user = await _userRepository.loginWithEmail(email, password);
      GetIt.I<UserManagerStore>().setUser(user);
    } catch (e) {
      error = e;
    }

    loading = false;
  }

}