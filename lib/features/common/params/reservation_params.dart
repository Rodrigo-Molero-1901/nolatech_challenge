class ReservationParams {
  final int? userId;
  final int? reservationId;
  final Function()? onReserveTapped;

  ReservationParams({
    required this.userId,
    required this.reservationId,
    required this.onReserveTapped,
  });
}
