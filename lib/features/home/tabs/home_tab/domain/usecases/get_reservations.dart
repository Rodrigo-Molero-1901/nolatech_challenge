import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:nolatech_challenge/features/common/data/models/reservation_model.dart';
import 'package:nolatech_challenge/features/common/domain/repositories/reservation_repository.dart';

@injectable
class GetReservationsUseCase {
  final ReservationRepository _repository;

  GetReservationsUseCase(this._repository);

  Either<void, List<ReservationModel>> getReservations() {
    return _repository.getReservations();
  }
}
