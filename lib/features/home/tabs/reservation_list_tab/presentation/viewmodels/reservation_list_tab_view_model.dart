import 'package:nolatech_challenge/features/common/data/models/reservation_model.dart';
import 'package:nolatech_challenge/features/common/data/models/user_model.dart';
import 'package:nolatech_challenge/features/common/presentation/viewmodels/reservation_row_view_model.dart';
import 'package:nolatech_challenge/features/common/presentation/viewmodels/user_view_model.dart';

part 'reservation_list_tab_navigation_view_model.dart';

class ReservationListTabViewModel {
  final UserViewModel userViewModel;
  final List<ReservationRowViewModel> scheduledReservationViewModels;
  final ReservationListTabNavigationViewModel? navigation;

  ReservationListTabViewModel.fromSuccessState({
    required UserModel user,
    required List<ReservationModel> scheduledReservations,
    this.navigation,
  })  : userViewModel = UserViewModel.fromModel(user),
        scheduledReservationViewModels = scheduledReservations
            .map(ReservationRowViewModel.fromModel)
            .toList();
}
