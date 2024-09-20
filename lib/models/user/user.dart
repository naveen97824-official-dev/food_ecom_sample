class User {
  String? emailId;
  String? password;

  User({this.emailId, this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      emailId: json['emailId'],
      password: json['password'],
    );
  }

  toJson() => {'emailId': emailId, 'password': password};
}
