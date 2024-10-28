import 'package:nolatech_challenge/features/common/data/models/reservation_model.dart';
import 'package:nolatech_challenge/features/common/data/models/user_model.dart';
import 'package:nolatech_challenge/features/common/params/reservation_params.dart';
import 'package:nolatech_challenge/features/common/presentation/viewmodels/user_view_model.dart';

import 'reservation_carousel_view_model.dart';
import 'reservation_row_view_model.dart';

part 'home_tab_navigation_view_model.dart';

class HomeTabViewModel {
  final UserViewModel userViewModel;
  final List<CarouselReservationViewModel> carouselReservationViewModels;
  final List<ReservationRowViewModel> scheduledReservationViewModels;
  final HomeTabNavigationViewModel? navigation;

  HomeTabViewModel.fromSuccessState({
    required UserModel user,
    required List<ReservationModel> carouselReservations,
    required List<ReservationModel> scheduledReservations,
    this.navigation,
  })  : userViewModel = UserViewModel.fromModel(user),
        carouselReservationViewModels = carouselReservations
            .map(CarouselReservationViewModel.fromModel)
            .toList(),
        scheduledReservationViewModels = scheduledReservations
            .map(ReservationRowViewModel.fromModel)
            .toList();
}
