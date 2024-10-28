part of 'home_cubit.dart';

sealed class HomeState {}

class HomeInitial extends HomeState {}

class HomeTab extends HomeState {}

class ReservationListTab extends HomeState {}

class FavoriteListTab extends HomeState {}
