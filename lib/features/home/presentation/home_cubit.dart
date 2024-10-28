import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../common/data/models/reservation_model.dart';
import '../../common/data/models/user_model.dart';
import '../../common/domain/usecases/get_user.dart';
import '../../common/params/reservation_params.dart';
import '../domain/usecases/get_reservations.dart';
import '../domain/usecases/get_user_reservations.dart';
import 'viewmodels/home_view_model.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetUserUseCase _getUserUseCase;
  final GetReservationsUseCase _getReservationsUseCase;
  final GetUserReservationsUseCase _getUserReservationsUseCase;

  HomeCubit({
    required GetUserUseCase getUserUseCase,
    required GetReservationsUseCase getReservationsUseCase,
    required GetUserReservationsUseCase getUserReservationsUseCase,
  })  : _getUserUseCase = getUserUseCase,
        _getReservationsUseCase = getReservationsUseCase,
        _getUserReservationsUseCase = getUserReservationsUseCase,
        super(HomeInitial());

  late final _userId;
  var _userModel = UserModel();
  var _carouselReservations = <ReservationModel>[];
  var _scheduledReservations = <ReservationModel>[];

  void initialize({required int? userId}) {
    _userId = userId ?? 0;
    _getLoggedUser();
    _getReservations();
    _getUserReservations();
    _emitMain();
  }

  void _getLoggedUser() {
    final result = _getUserUseCase.getUserById(userId: _userId);
    result.fold(
      (error) {},
      (loggedUser) {
        _userModel = loggedUser;
      },
    );
  }

  void _getReservations() {
    final result = _getReservationsUseCase.getReservations();
    result.fold(
      (error) {},
      (reservations) {
        _carouselReservations = reservations;
      },
    );
  }

  void _getUserReservations() {
    final result =
        _getUserReservationsUseCase.getUserReservations(userModel: _userModel);
    result.fold(
      (error) {},
      (reservations) {
        _scheduledReservations = reservations;
      },
    );
  }

  void _emitMain({
    HomeNavigationViewModel? navigation,
  }) {
    emit(
      HomeMain(
        viewModel: HomeViewModel.fromSuccessState(
          user: _userModel,
          carouselReservations: _carouselReservations,
          scheduledReservations: _scheduledReservations,
          navigation: navigation,
        ),
      ),
    );
  }

  void onReservationTapped({required int pos}) {
    _emitMain(
      navigation: ReservationNavigation(
        params: ReservationParams(
          userId: _userModel.objectId ?? 0,
          reservationId: _carouselReservations[pos].objectId ?? 0,
          onReserveTapped: refresh,
        ),
      ),
    );
  }

  void refresh() {
    _getLoggedUser();
    _getUserReservations();
  }
}
