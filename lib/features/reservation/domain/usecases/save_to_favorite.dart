import 'package:injectable/injectable.dart';

import '../../../common/data/models/reservation_model.dart';
import '../../../common/data/models/user_model.dart';
import '../../../common/domain/repositories/reservation_repository.dart';

@injectable
class SaveToFavoriteUseCase {
  final ReservationRepository _repository;

  SaveToFavoriteUseCase(this._repository);

  void saveToFavorite(
      {required ReservationModel reservationModel,
      required UserModel userModel}) {
    _repository.saveToFavorite(
        reservationModel: reservationModel, userModel: userModel);
  }
}
