import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../common/data/models/reservation_model.dart';
import '../../common/data/models/user_model.dart';
import '../../common/domain/usecases/get_user.dart';
import '../domain/usecases/get_reservation.dart';
import '../domain/usecases/is_favorite_reservation.dart';
import '../domain/usecases/save_to_favorite.dart';
import '../domain/usecases/schedule_reservation.dart';
import 'viewmodels/reservation_view_model.dart';

part 'reservation_state.dart';

@injectable
class ReservationCubit extends Cubit<ReservationState> {
  final GetUserUseCase _getUserUseCase;
  final GetReservationUseCase _getReservationUseCase;
  final IsFavoriteReservationUseCase _isFavoriteReservationUseCase;
  final SaveToFavoriteUseCase _saveToFavoriteUseCase;
  final ScheduleReservationUseCase _scheduleReservationUseCase;

  ReservationCubit({
    required GetUserUseCase getUserUseCase,
    required GetReservationUseCase getReservationUseCase,
    required IsFavoriteReservationUseCase isFavoriteReservationUseCase,
    required SaveToFavoriteUseCase saveToFavoriteUseCase,
    required ScheduleReservationUseCase scheduleReservationUseCase,
  })  : _getUserUseCase = getUserUseCase,
        _getReservationUseCase = getReservationUseCase,
        _isFavoriteReservationUseCase = isFavoriteReservationUseCase,
        _saveToFavoriteUseCase = saveToFavoriteUseCase,
        _scheduleReservationUseCase = scheduleReservationUseCase,
        super(ReservationInitial());

  var _userModel = UserModel();
  var _reservationModel = ReservationModel();
  var _isFavorite = false;

  void initialize({
    required int? userId,
    required int? reservationId,
  }) {
    _getUser(userId ?? 0);
    _getReservation(reservationId ?? 0);
    _reservationIsFavorite();
    _emitMain();
  }

  void _getUser(int userId) {
    final result = _getUserUseCase.getUserById(userId: userId);
    result.fold(
      (error) {},
      (user) {
        _userModel = user;
      },
    );
  }

  void _getReservation(int reservationId) {
    final result = _getReservationUseCase.getReservationById(
      reservationId: reservationId,
    );
    result.fold(
      (error) {},
      (reservation) {
        _reservationModel = reservation;
      },
    );
  }

  void _reservationIsFavorite() {
    final result = _isFavoriteReservationUseCase.isFavoriteReservation(
      reservationModel: _reservationModel,
      userModel: _userModel,
    );
    result.fold(
      (error) {},
      (isFavorite) {
        _isFavorite = isFavorite;
      },
    );
  }

  void _emitMain({
    ReservationNavigationViewModel? navigation,
  }) {
    emit(
      ReservationMain(
        viewModel: ReservationViewModel.fromSuccessState(
          user: _userModel,
          reservation: _reservationModel,
          isFavorite: _isFavorite,
          navigation: navigation,
        ),
      ),
    );
  }

  void onFavoriteTapped() {
    _saveToFavoriteUseCase.saveToFavorite(
      reservationModel: _reservationModel,
      userModel: _userModel,
    );
  }

  void onReserveTapped({
    required String instructor,
    required String date,
    required String time,
    required String comment,
  }) {
    _reservationModel
      ..instructor = instructor
      ..date = date
      ..time = time
      ..comment = comment;

    _scheduleReservationUseCase.scheduleReservation(
      reservationModel: _reservationModel,
      userModel: _userModel,
    );

    _emitMain(navigation: ReservationDoneNavigation());
  }
}
