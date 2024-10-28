import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void initialize() {
    emit(HomeTab());
  }

  void onHomeTabTapped() {
    emit(HomeTab());
  }

  void onReservationListTabTapped() {
    emit(ReservationListTab());
  }

  void onFavoriteListTapTapped() {
    emit(FavoriteListTab());
  }
}
