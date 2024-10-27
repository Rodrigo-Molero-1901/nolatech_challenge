import '../../../common/data/models/reservation_model.dart';
import '../../../common/data/models/user_model.dart';
import 'reservation_carousel_view_model.dart';
import 'user_view_model.dart';

part 'home_navigation_view_model.dart';

class HomeViewModel {
  final UserViewModel userViewModel;
  final List<CarouselReservationViewModel> carouselReservationViewModels;
  final List<CarouselReservationViewModel> scheduledReservationViewModels;
  final HomeNavigationViewModel? navigation;

  HomeViewModel.fromSuccessState({
    required UserModel user,
    required List<ReservationModel> carouselReservations,
    required List<ReservationModel> scheduledReservations,
    this.navigation,
  })  : userViewModel = UserViewModel.fromModel(user),
        carouselReservationViewModels = carouselReservations
            .map(CarouselReservationViewModel.fromModel)
            .toList(),
        scheduledReservationViewModels = scheduledReservations
            .map(CarouselReservationViewModel.fromModel)
            .toList();
}
