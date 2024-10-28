import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/reservation_model.dart';
import '../../data/models/user_model.dart';
import '../repositories/reservation_repository.dart';

@injectable
class GetUserReservationsUseCase {
  final ReservationRepository _repository;

  GetUserReservationsUseCase(this._repository);

  Either<void, List<ReservationModel>> getUserReservations(
      {required UserModel userModel}) {
    return _repository.getUserReservations(userModel: userModel);
  }
}
