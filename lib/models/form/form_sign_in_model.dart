class FormSignInModel {
  final String? email;
  final String? password;

  FormSignInModel({this.email, this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
