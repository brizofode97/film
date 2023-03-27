class ConnecterModele {
  late String username;
  late String password;

  ConnecterModele({required this.username, required this.password});

  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "password": password,
    };
  }

  ConnecterModele.fromMap(Map<String, dynamic> map) {
    username = map['username'];
    password = map['password'];
  }
}
