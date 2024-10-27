import 'package:objectbox/objectbox.dart';

import 'auth_api.dart';
import 'reservation_api.dart';

class Api {
  final Store _store;

  Api(this._store);

  AuthApi get authApi => AuthApi(_store);

  ReservationApi get reservationApi => ReservationApi(_store);
}
