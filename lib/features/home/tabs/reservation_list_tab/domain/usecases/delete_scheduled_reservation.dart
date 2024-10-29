import 'package:injectable/injectable.dart';
import 'package:nolatech_challenge/features/common/data/models/reservation_model.dart';
import 'package:nolatech_challenge/features/common/data/models/user_model.dart';
import 'package:nolatech_challenge/features/common/domain/repositories/reservation_repository.dart';

@injectable
class DeleteScheduledReservationUseCase {
  final ReservationRepository _repository;

  DeleteScheduledReservationUseCase(this._repository);

  void deleteScheduledReservation(
      {required ReservationModel reservationModel,
      required UserModel userModel}) {
    _repository.deleteScheduledReservation(
        reservationModel: reservationModel, userModel: userModel);
  }
}
