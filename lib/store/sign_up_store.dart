import 'package:aps_mobile/model/user.dart';
import 'package:aps_mobile/repositories/user_repository.dart';
import 'package:aps_mobile/store/user_manager_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:aps_mobile/helpers/extensions.dart';

part 'sign_up_store.g.dart';

class SignUpStore = _SignUpStore with _$SignUpStore;

abstract class _SignUpStore with Store {

  UserRepository _userRepository = UserRepository();

  @observable
  String name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name.length > 6;

  String get nameError {
    if (name == null || nameValid)
      return null;
    else if (name.isEmpty)
      return 'Campo Obrigatório';
    else
      return 'Nome muito curto';
  }

  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email.isEmailValid();

  String get emailError {
    if (email == null || emailValid)
      return null;
    else if (email.isEmpty)
      return 'Campo Obrigatório';
    else
      return 'Email Inválido';
  }

  @observable
  String phone;

  @action
  void setPhone(String value) => phone = value;

  @computed
  bool get phoneValid => phone != null && phone.length >= 14;

  String get phoneError {
    if (phone == null || phoneValid)
      return null;
    else if (phone.isEmpty)
      return 'Campo Obrigatório';
    else
      return 'Telefone Inválido';
  }

  @observable
  String rua;

  @action
  void setRua(String value) => rua = value;

  @computed
  bool get ruaValid => rua != null;

  String get ruaError {
    if(rua == null || ruaValid){
      return null;
    } else if (rua.isEmpty) {
      return 'Campo Obrigatório';
    } else {
      return 'Rua Inválida';
    }
  }

  @observable
  String numero;

  @action
  void setNumero(String value) => numero = value;

  @computed
  bool get numeroValid => numero != null;

  String get numeroError{
    if(numero == null || numeroValid){
      return null;
    } else if (numero.isEmpty) {
      return 'Campo Obrigatório';
    } else {
      return 'Número Inválido';
    }
  }

  @observable
  String pass1;

  @action
  void setPass1(String value) => pass1 = value;

  @computed
  bool get pass1Valid => pass1 != null && pass1.length >= 6;

  String get pass1Error {
    if (pass1 == null || pass1Valid)
      return null;
    else if (pass1.isEmpty)
      return 'Campo Obrigatório';
    else
      return 'Senha Muito Curta';
  }

  @observable
  String pass2;

  @action
  void setPass2(String value) => pass2 = value;

  @computed
  bool get pass2Valid => pass2 != null && pass1 == pass2;

  String get pass2Error {
    if (pass2 == null || pass2Valid)
      return null;
    else if (pass2.isEmpty)
      return null;
    else
      return 'Senha Não Coincidem';
  }

  @computed
  bool get isFormValid =>
      nameValid && emailValid && phoneValid && ruaValid && numeroValid && pass1Valid && pass2Valid;

  @computed
  Function get signUpPressed => isFormValid && !loading ? _signUp : null;

  @observable
  bool loading = false;

  @observable
  String error;

  @action
  Future<void> _signUp() async{
    loading = true;

    final user = User(
        name: name,
        email: email,
        phone: phone,
        password: pass1,
        rua: rua,
        numero: numero,
    );

    try {
      final resultUser = await _userRepository.signUp(user);
      GetIt.I<UserManagerStore>().setUser(resultUser);
    } catch(e) {
        error = e.toString();
    }

    loading = false;
  }
}