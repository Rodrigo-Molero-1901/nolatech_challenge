import 'package:injectable/injectable.dart';

import '../../../common/data/models/reservation_model.dart';
import '../../../common/data/models/user_model.dart';
import '../../../common/domain/repositories/reservation_repository.dart';

@injectable
class ScheduleReservationUseCase {
  final ReservationRepository _repository;

  ScheduleReservationUseCase(this._repository);

  void scheduleReservation(
      {required ReservationModel reservationModel,
      required UserModel userModel}) {
    _repository.scheduleReservation(
        reservationModel: reservationModel, userModel: userModel);
  }
}
