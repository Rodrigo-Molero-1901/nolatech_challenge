import 'package:objectbox/objectbox.dart';

import '../api/api.dart';
import 'auth_api_manager.dart';
import 'reservation_api_manager.dart';

class ApiManager {
  final Store store;
  late Api _api;

  static Future<ApiManager> init({
    required Store store,
  }) async {
    var apiManager = ApiManager._(store: store);
    return apiManager;
  }

  ApiManager._({
    required this.store,
  }) {
    _api = Api(store);
  }

  AuthApiManager get authApiManager => AuthApiManager(_api);

  ReservationApiManager get reservationApiManager =>
      ReservationApiManager(_api);
}
