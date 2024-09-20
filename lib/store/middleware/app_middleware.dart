

import 'package:food_ecom_sample/store/state/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';



List<Middleware<AppState>> appMiddleWare(Persistor<AppState> persistor) {
  return [
    persistor.createMiddleware(),
  ];
}