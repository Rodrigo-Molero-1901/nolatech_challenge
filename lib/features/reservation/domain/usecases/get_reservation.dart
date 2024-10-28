import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../common/data/models/reservation_model.dart';
import '../../../common/domain/repositories/reservation_repository.dart';

@injectable
class GetReservationUseCase {
  final ReservationRepository _repository;

  GetReservationUseCase(this._repository);

  Either<void, ReservationModel> getReservationById(
      {required int reservationId}) {
    return _repository.getReservationById(reservationId: reservationId);
  }
}
