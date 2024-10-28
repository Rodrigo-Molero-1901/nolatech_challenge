part of 'reservation_cubit.dart';

sealed class ReservationState {}

class ReservationInitial extends ReservationState {}

class ReservationMain extends ReservationState {
  final ReservationViewModel viewModel;

  ReservationMain({
    required this.viewModel,
  });
}
