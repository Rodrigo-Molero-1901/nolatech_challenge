import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:nolatech_challenge/features/common/data/models/reservation_model.dart';
import 'package:nolatech_challenge/features/common/data/models/user_model.dart';
import 'package:nolatech_challenge/features/common/domain/usecases/get_user.dart';
import 'package:nolatech_challenge/features/common/domain/usecases/get_user_reservations.dart';
import 'package:nolatech_challenge/features/common/params/reservation_params.dart';

import '../domain/usecases/get_reservations.dart';
import 'viewmodels/home_tab_view_model.dart';

part 'home_tab_state.dart';

@injectable
class HomeTabCubit extends Cubit<HomeTabState> {
  final GetUserUseCase _getUserUseCase;
  final GetReservationsUseCase _getReservationsUseCase;
  final GetUserReservationsUseCase _getUserReservationsUseCase;

  HomeTabCubit({
    required GetUserUseCase getUserUseCase,
    required GetReservationsUseCase getReservationsUseCase,
    required GetUserReservationsUseCase getUserReservationsUseCase,
  })  : _getUserUseCase = getUserUseCase,
        _getReservationsUseCase = getReservationsUseCase,
        _getUserReservationsUseCase = getUserReservationsUseCase,
        super(HomeTabInitial());

  late final int _userId;
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
    HomeTabNavigationViewModel? navigation,
  }) {
    emit(
      HomeTabMain(
        viewModel: HomeTabViewModel.fromSuccessState(
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
    _emitMain();
  }
}
