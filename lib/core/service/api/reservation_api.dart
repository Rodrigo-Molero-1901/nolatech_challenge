import 'package:flutter/foundation.dart';

import '../../../features/features.dart';
import '../../../objectbox.g.dart';
import '../../utils/mocks.dart';

class ReservationApi {
  final Store _store;
  late final Box<User> _userBox;
  late final Box<Reservation> _reservationBox;

  ReservationApi(
    this._store,
  ) {
    _userBox = _store.box<User>();
    _reservationBox = _store.box<Reservation>();
  }

  List<Reservation> getReservations() {
    debugPrint('Obteniendo lista de reservas...');
    var allReservations = _reservationBox.getAll();
    if (allReservations.isEmpty) {
      debugPrint('Creando reservas ficticias...');
      _reservationBox.putMany(reservationMockList);
      allReservations = _reservationBox.getAll();
    }
    return allReservations;
  }

  Reservation? getReservationById({required int reservationId}) {
    final reservation = _reservationBox
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

  void scheduleReservation({required int reservationId, required int userId}) {
    final user = _userBox.get(userId);
    if (user == null) return;

    final reservation = _reservationBox.get(userId);
    if (reservation == null) return;

    user.reservations.add(reservation);
    _userBox.put(user);
    debugPrint('Reserva agendada...');
  }

  void saveToFavorite({required int reservationId, required int userId}) {
    final user = _userBox.get(userId);
    if (user == null) return;

    final reservation = _reservationBox.get(userId);
    if (reservation == null) return;

    final userFavoriteList = user.favoriteReservations;
    final existsInFavorites = userFavoriteList.contains(reservation);

    if (!existsInFavorites) {
      userFavoriteList.add(reservation);
      debugPrint('Reserva guardada como favorita...');
    } else {
      userFavoriteList.remove(reservation);
      debugPrint('Reserva eliminada de favoritos...');
    }

    _userBox.put(user);
  }

  List<Reservation> getUserReservations({required int userId}) {
    final user = _userBox.get(userId);
    if (user == null) return [];
    debugPrint('Obteniendo lista de reservas para el usuario ${user.name}...');
    return user.reservations;
  }

  List<Reservation> getUserFavoriteReservations({required int userId}) {
    final user = _userBox.get(userId);
    if (user == null) return [];
    debugPrint('Obteniendo lista de favoritos para el usuario ${user.name}...');
    return user.favoriteReservations;
  }
}
