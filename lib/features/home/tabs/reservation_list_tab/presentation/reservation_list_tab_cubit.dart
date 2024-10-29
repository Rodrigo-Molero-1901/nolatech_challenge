import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:nolatech_challenge/features/common/data/models/reservation_model.dart';
import 'package:nolatech_challenge/features/common/data/models/user_model.dart';
import 'package:nolatech_challenge/features/common/domain/usecases/get_user.dart';
import 'package:nolatech_challenge/features/common/domain/usecases/get_user_reservations.dart';

import '../domain/usecases/delete_scheduled_reservation.dart';
import 'viewmodels/reservation_list_tab_view_model.dart';

part 'reservation_list_tab_state.dart';

@injectable
class ReservationListTabCubit extends Cubit<ReservationListTabState> {
  final GetUserUseCase _getUserUseCase;
  final GetUserReservationsUseCase _getUserReservationsUseCase;
  final DeleteScheduledReservationUseCase _deleteScheduledReservationUseCase;

  ReservationListTabCubit({
    required GetUserUseCase getUserUseCase,
    required GetUserReservationsUseCase getUserReservationsUseCase,
    required DeleteScheduledReservationUseCase
        deleteScheduledReservationUseCase,
  })  : _getUserUseCase = getUserUseCase,
        _getUserReservationsUseCase = getUserReservationsUseCase,
        _deleteScheduledReservationUseCase = deleteScheduledReservationUseCase,
        super(ReservationListTabInitial());

  late final int _userId;
  var _userModel = UserModel();
  var _scheduledReservations = <ReservationModel>[];

  void initialize({required int? userId}) {
    _userId = userId ?? 0;
    _getLoggedUser();
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
    ReservationListTabNavigationViewModel? navigation,
  }) {
    emit(
      ReservationListTabMain(
        viewModel: ReservationListTabViewModel.fromSuccessState(
          user: _userModel,
          scheduledReservations: _scheduledReservations,
          navigation: navigation,
        ),
      ),
    );
  }

  void onDeleteReservationTapped({required int pos}) {
    _deleteScheduledReservationUseCase.deleteScheduledReservation(
      reservationModel: _scheduledReservations[pos],
      userModel: _userModel,
    );

    _scheduledReservations.removeAt(pos);
    _emitMain();
  }
}
