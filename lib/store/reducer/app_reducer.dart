import 'package:food_ecom_sample/store/reducer/login/login_reducer.dart';
import 'package:food_ecom_sample/store/state/app_state.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    loginState: loginReducer(state.loginState!, action),
  );
}
