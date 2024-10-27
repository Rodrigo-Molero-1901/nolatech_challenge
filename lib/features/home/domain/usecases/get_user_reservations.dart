import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../common/data/models/reservation_model.dart';
import '../../../common/data/models/user_model.dart';
import '../../../common/domain/repositories/reservation_repository.dart';

@injectable
class GetUserReservationsUseCase {
  final ReservationRepository _repository;

  GetUserReservationsUseCase(this._repository);

  Either<void, List<ReservationModel>> getUserReservations(
      {required UserModel userModel}) {
    return _repository.getUserReservations(userModel: userModel);
  }
}
