import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:nolatech_challenge/core/service/manager/api_manager.dart';

import '../../domain/repositories/reservation_repository.dart';
import '../models/reservation_model.dart';
import '../models/user_model.dart';

@Injectable(as: ReservationRepository)
class ReservationRepositoryImpl implements ReservationRepository {
  final ApiManager _apiManager;

  ReservationRepositoryImpl({
    required ApiManager apiManager,
  }) : _apiManager = apiManager;

  @override
  Either<void, List<ReservationModel>> getReservations() {
    final response = _apiManager.reservationApiManager.getReservations();
    return response.fold(
      (error) => Left(error),
      (reservations) => Right(List.from(reservations.map((e) => e.toModel()))),
    );
  }

  @override
  Either<void, ReservationModel> getReservationById({
    required int reservationId,
  }) {
    final response = _apiManager.reservationApiManager.getReservationById(
      reservationId: reservationId,
    );
    return response.fold(
      (error) => Left(error),
      (reservation) => Right(reservation.toModel()),
    );
  }

  @override
  Either<void, List<ReservationModel>> getUserReservations({
    required UserModel userModel,
  }) {
    final response = _apiManager.reservationApiManager.getUserReservations(
      userModel: userModel,
    );
    return response.fold(
      (error) => Left(error),
      (reservations) => Right(List.from(reservations.map((e) => e.toModel()))),
    );
  }

  @override
  Either<void, bool> isFavoriteReservation({
    required ReservationModel reservationModel,
    required UserModel userModel,
  }) {
    final response = _apiManager.reservationApiManager.isFavoriteReservation(
      reservationModel: reservationModel,
      userModel: userModel,
    );
    return response.fold(
      (error) => Left(error),
      (isFavoriteReservation) => Right(isFavoriteReservation),
    );
  }

  @override
  void saveToFavorite({
    required ReservationModel reservationModel,
    required UserModel userModel,
  }) {
    _apiManager.reservationApiManager.saveToFavorite(
      reservationModel: reservationModel,
      userModel: userModel,
    );
  }

  @override
  void scheduleReservation({
    required ReservationModel reservationModel,
    required UserModel userModel,
  }) {
    _apiManager.reservationApiManager.scheduleReservation(
      reservationModel: reservationModel,
      userModel: userModel,
    );
  }

  @override
  Either<void, List<ReservationModel>> getFavoriteReservations({
    required UserModel userModel,
  }) {
    final response = _apiManager.reservationApiManager.getFavoriteReservations(
      userModel: userModel,
    );
    return response.fold(
      (error) => Left(error),
      (reservations) => Right(List.from(reservations.map((e) => e.toModel()))),
    );
  }

  @override
  void deleteScheduledReservation({
    required ReservationModel reservationModel,
    required UserModel userModel,
  }) {
    _apiManager.reservationApiManager.deleteScheduledReservation(
      reservationModel: reservationModel,
      userModel: userModel,
    );
  }
}
