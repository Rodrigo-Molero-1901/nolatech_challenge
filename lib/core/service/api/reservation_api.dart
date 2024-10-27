import 'package:flutter/foundation.dart';

import '../../../features/features.dart';
import '../../../objectbox.g.dart';
import '../../utils/mocks.dart';

class ReservationApi {
  final Store _store;
  late final Box<Reservation> _box;

  ReservationApi(
    this._store,
  ) {
    _box = _store.box<Reservation>();
  }

  List<Reservation> getReservations() {
    debugPrint('Obteniendo lista de reservas...');
    var allReservations = _box.getAll();
    if (allReservations.isEmpty) {
      debugPrint('Creando reservas ficticias...');
      _box.putMany(reservationMockList);
      allReservations = _box.getAll();
    }
    return List.from(allReservations.where((e) => e.users.isEmpty));
  }

  Reservation? getReservationById({required int reservationId}) {
    final reservation = _box
        .query(
          Reservation_.objectId.equals(reservationId),
        )
        .build()
        .findFirst();

    if (reservation == null) {
      debugPrint('No existe una reservación con el id: $reservationId');
      return null;
    }

    debugPrint('Reservación encontrada...');
    return reservation;
  }

  void scheduleReservation(
      {required Reservation reservation, required User user}) {
    user.reservations.add(reservation);
    reservation.users.add(user);
    user.reservations.applyToDb();
    reservation.users.applyToDb();
  }

  void saveToFavorite({required Reservation reservation, required User user}) {
    final userFavoriteList = user.favoriteReservations;
    final existsInFavorites = userFavoriteList.contains(reservation);

    if (!existsInFavorites) {
      userFavoriteList.add(reservation);
      debugPrint('Reserva guardada como favorita...');
    } else {
      userFavoriteList.remove(reservation);
      debugPrint('Reserva eliminada de favoritos...');
    }

    userFavoriteList.applyToDb();
  }

  List<Reservation> getUserReservations({required User user}) {
    debugPrint('Obteniendo lista de reservas para el usuario ${user.name}...');
    return user.reservations;
  }

  List<Reservation> getUserFavoriteReservations({required User user}) {
    debugPrint('Obteniendo lista de favoritos para el usuario ${user.name}...');
    return user.favoriteReservations;
  }
}
