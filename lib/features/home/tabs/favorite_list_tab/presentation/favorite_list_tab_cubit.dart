import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:nolatech_challenge/features/common/data/models/reservation_model.dart';
import 'package:nolatech_challenge/features/common/data/models/user_model.dart';
import 'package:nolatech_challenge/features/common/domain/usecases/get_user.dart';

import '../domain/usecases/get_favorite_reservations.dart';
import 'viewmodels/favorite_list_tab_view_model.dart';

part 'favorite_list_tab_state.dart';

@injectable
class FavoriteListTabCubit extends Cubit<FavoriteListTabState> {
  final GetUserUseCase _getUserUseCase;
  final GetFavoriteReservationsUseCase _getFavoriteReservationsUseCase;

  FavoriteListTabCubit({
    required GetUserUseCase getUserUseCase,
    required GetFavoriteReservationsUseCase getFavoriteReservationsUseCase,
  })  : _getUserUseCase = getUserUseCase,
        _getFavoriteReservationsUseCase = getFavoriteReservationsUseCase,
        super(FavoriteListTabInitial());

  late final int _userId;
  var _userModel = UserModel();
  var _favoriteReservations = <ReservationModel>[];

  void initialize({required int? userId}) {
    _userId = userId ?? 0;
    _getLoggedUser();
    _getUserFavoriteReservations();
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

  void _getUserFavoriteReservations() {
    final result = _getFavoriteReservationsUseCase.getFavoriteReservations(
      userModel: _userModel,
    );
    result.fold(
      (error) {},
      (reservations) {
        _favoriteReservations = reservations;
      },
    );
  }

  void _emitMain() {
    emit(
      FavoriteListTabMain(
        viewModel: FavoriteListTabViewModel.fromSuccessState(
          user: _userModel,
          favoriteReservations: _favoriteReservations,
        ),
      ),
    );
  }
}
