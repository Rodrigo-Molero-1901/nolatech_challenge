import 'package:fpdart/fpdart.dart';

import '../../../features/features.dart';
import '../api/api.dart';

class ReservationApiManager {
  final Api _api;

  ReservationApiManager(this._api);

  Either<void, List<Reservation>> getReservations() {
    try {
      final reservations = _api.reservationApi.getReservations();
      if (reservations.isEmpty) return const Left(null);
      return Right(reservations);
    } catch (_) {
      return const Left(null);
    }
  }

  Either<void, Reservation> getReservationById({required int reservationId}) {
    try {
      final reservation =
          _api.reservationApi.getReservationById(reservationId: reservationId);
      if (reservation == null) return const Left(null);
      return Right(reservation);
    } catch (_) {
      return const Left(null);
    }
  }

  void scheduleReservation({
    required ReservationModel reservationModel,
    required UserModel userModel,
  }) {
    _api.reservationApi.scheduleReservation(
      reservation: Reservation.fromModel(reservationModel),
      user: User.fromModel(userModel),
    );
  }

  void saveToFavorite({
    required ReservationModel reservationModel,
    required UserModel userModel,
  }) {
    _api.reservationApi.saveToFavorite(
      reservation: Reservation.fromModel(reservationModel),
      user: User.fromModel(userModel),
    );
  }

  Either<void, List<Reservation>> getUserReservations({
    required UserModel userModel,
  }) {
    try {
      final userReservations = _api.reservationApi.getUserReservations(
        user: User.fromModel(userModel),
      );
      if (userReservations.isEmpty) return const Left(null);
      return Right(userReservations);
    } catch (_) {
      return const Left(null);
    }
  }

  Either<void, List<Reservation>> getUserFavoriteReservations({
    required UserModel userModel,
  }) {
    try {
      final favoriteReservations =
          _api.reservationApi.getUserFavoriteReservations(
        user: User.fromModel(userModel),
      );
      if (favoriteReservations.isEmpty) return const Left(null);
      return Right(favoriteReservations);
    } catch (_) {
      return const Left(null);
    }
  }
}
