


import 'package:food_ecom_sample/store/action/login/login_action.dart';
import 'package:food_ecom_sample/store/state/login_state.dart';

LoginState loginReducer(LoginState state, dynamic action){
  if(action is LoginAction){
    return state.copyWith(userDetail: action.userDetails);
  }

  return state;
}