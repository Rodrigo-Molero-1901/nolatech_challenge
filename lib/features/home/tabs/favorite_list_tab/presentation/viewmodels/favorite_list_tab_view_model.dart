import 'package:nolatech_challenge/features/common/data/models/reservation_model.dart';
import 'package:nolatech_challenge/features/common/data/models/user_model.dart';
import 'package:nolatech_challenge/features/common/presentation/viewmodels/reservation_row_view_model.dart';
import 'package:nolatech_challenge/features/common/presentation/viewmodels/user_view_model.dart';

class FavoriteListTabViewModel {
  final UserViewModel userViewModel;
  final List<ReservationRowViewModel> favoriteReservationViewModels;

  FavoriteListTabViewModel.fromSuccessState({
    required UserModel user,
    required List<ReservationModel> favoriteReservations,
  })  : userViewModel = UserViewModel.fromModel(user),
        favoriteReservationViewModels = favoriteReservations
            .map(ReservationRowViewModel.fromModel)
            .toList();
}
