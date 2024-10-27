import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../common/data/models/reservation_model.dart';
import '../../../common/domain/repositories/reservation_repository.dart';

@injectable
class GetReservationsUseCase {
  final ReservationRepository _repository;

  GetReservationsUseCase(this._repository);

  Either<void, List<ReservationModel>> getReservations() {
    return _repository.getReservations();
  }
}
