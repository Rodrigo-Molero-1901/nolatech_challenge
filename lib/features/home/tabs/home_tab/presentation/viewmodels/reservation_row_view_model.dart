import 'package:nolatech_challenge/features/common/data/models/reservation_model.dart';

class ReservationRowViewModel {
  final String name;
  final String price;
  final List<String> imagePath;

  ReservationRowViewModel.fromModel(ReservationModel reservationModel)
      : name = reservationModel.name ?? '',
        imagePath = reservationModel.imagesPath ?? [],
        price = (reservationModel.price ?? 0).toString();
}
