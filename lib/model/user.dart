class User {

  User(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.rua,
        this.numero,
        this.password});

  factory User.fromJson(Map<String, dynamic> userLogged){
    return User(
      id: userLogged["idCliente"],
      name: userLogged["nome"],
      email: userLogged["email"],
      phone: userLogged["telefone"],
      rua: userLogged["rua"],
      numero: userLogged["numero"]
    );
  }

  int id;
  String name;
  String email;
  String phone;
  String rua;
  String numero;
  String password;



  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, phone: $phone, rua: $rua, numero: $numero, password: $password}';
  }
}
