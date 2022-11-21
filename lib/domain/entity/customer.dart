class Customer {
  final int? id;
  final String? fio;
  final String? login;
  final String? password;
  final String email;
  final int? role_id;

  Customer(
      {this.id,
      this.fio,
      this.login,
      this.password,
      required this.email,
      this.role_id});

  factory Customer.fromMap(Map<String, dynamic> json) => Customer(
        id: json['id'],
        fio: json['fio'],
        login: json['login'],
        password: json['password'],
        email: json['email'],
        role_id: json['role_id'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fio': fio,
      'login': login,
      'password': password,
      'email': email,
      'role_id': role_id,
    };
  }
}
