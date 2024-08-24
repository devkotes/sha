class FormUserEditModel {
  final String? email;
  final String? password;
  final String? username;
  final String? name;

  FormUserEditModel({
    this.email,
    this.password,
    this.username,
    this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'username': username,
      'name': name,
    };
  }
}
