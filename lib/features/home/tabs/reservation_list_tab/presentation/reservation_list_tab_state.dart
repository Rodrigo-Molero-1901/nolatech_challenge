part of 'reservation_list_tab_cubit.dart';

sealed class ReservationListTabState {}

class ReservationListTabInitial extends ReservationListTabState {}

class ReservationListTabMain extends ReservationListTabState {
  final ReservationListTabViewModel viewModel;

  ReservationListTabMain({
    required this.viewModel,
  });
}
