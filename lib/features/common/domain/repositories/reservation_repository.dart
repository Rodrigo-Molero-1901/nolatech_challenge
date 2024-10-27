import 'package:fpdart/fpdart.dart';

import '../../data/models/reservation_model.dart';
import '../../data/models/user_model.dart';

abstract class ReservationRepository {
  Either<void, List<ReservationModel>> getReservations();

  Either<void, ReservationModel> getReservationById(
      {required int reservationId});

  Either<void, List<ReservationModel>> getUserReservations(
      {required UserModel userModel});

  void saveToFavorite(
      {required ReservationModel reservationModel,
      required UserModel userModel});

  void scheduleReservation(
      {required ReservationModel reservationModel,
      required UserModel userModel});

  Either<void, List<ReservationModel>> getUserFavoriteReservations(
      {required UserModel userModel});
}