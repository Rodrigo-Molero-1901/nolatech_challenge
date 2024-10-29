import 'package:flutter/foundation.dart';

import '../../../features/features.dart';
import '../../../objectbox.g.dart';
import '../../utils/mocks.dart';

class ReservationApi {
  final Store _store;
  late final Box<User> _user;
  late final Box<Reservation> _reservation;
  late final Box<ScheduleLink> _scheduleLink;
  late final Box<FavoriteLink> _favoriteLink;

  ReservationApi(
    this._store,
  ) {
    _user = _store.box<User>();
    _reservation = _store.box<Reservation>();
    _scheduleLink = _store.box<ScheduleLink>();
    _favoriteLink = _store.box<FavoriteLink>();
  }

  List<Reservation> getReservations() {
    debugPrint('Obteniendo lista de reservas...');
    var allReservations = _reservation.getAll();
    if (allReservations.isEmpty) {
      debugPrint('Creando reservas ficticias...');
      _reservation.putMany(reservationMockList);
      allReservations = _reservation.getAll();
    }
    return allReservations;
  }

  Reservation? getReservationById({
    required int reservationId,
  }) {
    final reservation = _reservation
        .query(Reservation_.objectId.equals(reservationId))
        .build()
        .findFirst();

    if (reservation == null) {
      debugPrint('No existe una reservación con el id: $reservationId');
      return null;
    }

    debugPrint('Reservación encontrada...');
    return reservation;
  }

  void scheduleReservation({
    required int reservationId,
    required int userId,
  }) {
    final user = _user.get(userId);
    final reservation = _reservation.get(reservationId);
    if (user == null || reservation == null) return;

    final schedule = ScheduleLink()
      ..user.target = user
      ..reservation.target = reservation;

    _scheduleLink.put(schedule);
    debugPrint('Reserva agendada...');
  }

  bool isFavoriteReservation({
    required int reservationId,
    required int userId,
  }) {
    final favoriteReservation = _favoriteLink
        .query(
          FavoriteLink_.user.equals(userId) &
              FavoriteLink_.reservation.equals(reservationId),
        )
        .build()
        .findFirst();

    return favoriteReservation != null;
  }

  void saveToFavorite({
    required int reservationId,
    required int userId,
  }) {
    final user = _user.get(userId);
    final reservation = _reservation.get(reservationId);
    if (user == null || reservation == null) return;

    final favoriteReservation = _favoriteLink
        .query(
          FavoriteLink_.user.equals(userId) &
              FavoriteLink_.reservation.equals(reservationId),
        )
        .build()
        .findFirst();

    if (favoriteReservation != null) {
      _favoriteLink.remove(favoriteReservation.id);
      debugPrint('Reserva eliminada de favoritos...');
    } else {
      final newFavoriteReservation = FavoriteLink()
        ..user.target = user
        ..reservation.target = reservation;

      _favoriteLink.put(newFavoriteReservation);
      debugPrint('Reserva guardada como favorita...');
    }
  }

  List<Reservation> getUserReservations({
    required int userId,
  }) {
    final user = _user.get(userId);
    if (user == null) return [];
    debugPrint('Obteniendo lista de reservas para el usuario ${user.name}...');

    final scheduledReservations = _scheduleLink
        .query(ScheduleLink_.user.equals(user.objectId))
        .build()
        .find();

    return scheduledReservations
        .map((link) => link.reservation.target)
        .where((reservation) => reservation != null)
        .cast<Reservation>()
        .toList();
  }

  List<Reservation> getFavoriteReservations({
    required int userId,
  }) {
    final user = _user.get(userId);
    if (user == null) return [];
    debugPrint('Obteniendo lista de favoritos para el usuario ${user.name}...');

    final favoriteReservations = _favoriteLink
        .query(FavoriteLink_.user.equals(user.objectId))
        .build()
        .find();

    return favoriteReservations
        .map((link) => link.reservation.target)
        .where((reservation) => reservation != null)
        .cast<Reservation>()
        .toList();
  }

  void deleteScheduledReservation({
    required int userId,
    required int reservationId,
  }) {
    final scheduledReservation = _scheduleLink
        .query(
          ScheduleLink_.user.equals(userId) &
              ScheduleLink_.reservation.equals(reservationId),
        )
        .build()
        .findFirst();

    if (scheduledReservation == null) return;

    _scheduleLink.remove(scheduledReservation.id);
    debugPrint('Reserva eliminada...');
  }
}
