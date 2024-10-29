import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../common/data/models/reservation_model.dart';
import '../../../common/data/models/user_model.dart';
import '../../../common/domain/repositories/reservation_repository.dart';

@injectable
class IsFavoriteReservationUseCase {
  final ReservationRepository _repository;

  IsFavoriteReservationUseCase(this._repository);

  Either<void, bool> isFavoriteReservation(
      {required ReservationModel reservationModel,
      required UserModel userModel}) {
    return _repository.isFavoriteReservation(
        reservationModel: reservationModel, userModel: userModel);
  }
}
