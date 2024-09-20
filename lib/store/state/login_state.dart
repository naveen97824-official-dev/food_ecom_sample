import 'package:food_ecom_sample/models/user/user.dart';

class LoginState {
  User? userDetail;

  LoginState({this.userDetail});

  factory LoginState.initial() {
    return LoginState(
      userDetail: null,
    );
  }

  LoginState copyWith({User? userDetail}) {
    this.userDetail = userDetail;
    return this;
  }

  static LoginState fromJson(Map<String, dynamic> json) {
    return LoginState(
      userDetail:
          json['userDetail'] != null ? User.fromJson(json['userDetail']) : null,
    );
  }

  dynamic toJson() =>
      {'userDetail': userDetail != null ? userDetail!.toJson() : null};
}
