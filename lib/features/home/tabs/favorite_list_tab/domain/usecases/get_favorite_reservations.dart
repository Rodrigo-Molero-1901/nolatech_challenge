import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:nolatech_challenge/features/common/data/models/reservation_model.dart';
import 'package:nolatech_challenge/features/common/data/models/user_model.dart';
import 'package:nolatech_challenge/features/common/domain/repositories/reservation_repository.dart';

@injectable
class GetFavoriteReservationsUseCase {
  final ReservationRepository _repository;

  GetFavoriteReservationsUseCase(this._repository);

  Either<void, List<ReservationModel>> getFavoriteReservations(
      {required UserModel userModel}) {
    return _repository.getFavoriteReservations(userModel: userModel);
  }
}
