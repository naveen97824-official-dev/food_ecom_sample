
import 'package:food_ecom_sample/store/state/login_state.dart';

class AppState {
  final LoginState? loginState;

  AppState({required this.loginState});

  factory AppState.initial() {
    return AppState(
      loginState: LoginState.initial(),
    );
  }

  static AppState fromJson(dynamic json) {
    return AppState(
      loginState: json?['loginState'] != null
          ? LoginState.fromJson(json['loginState'])
          : null,
    );
  }

  dynamic toJson() => {'loginState': loginState!.toJson()};
}