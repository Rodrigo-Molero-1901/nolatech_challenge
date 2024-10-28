import '../../../common/data/models/reservation_model.dart';
import '../../../common/data/models/user_model.dart';
import '../../../common/presentation/viewmodels/user_view_model.dart';

part 'reservation_navigation_view_model.dart';

class ReservationViewModel {
  final UserViewModel userViewModel;
  final ReservationNavigationViewModel? navigation;
  final String name;
  final String type;
  final String location;
  final List<String> imagePath;
  final String price;
  final String comment;

  ReservationViewModel.fromSuccessState({
    required UserModel user,
    required ReservationModel reservation,
    this.navigation,
  })  : userViewModel = UserViewModel.fromModel(user),
        name = reservation.name ?? '',
        type = reservation.type ?? '',
        location = reservation.location ?? '',
        imagePath = reservation.imagesPath ?? [],
        price = (reservation.price ?? 0).toString(),
        comment = reservation.comment ?? '';
}
