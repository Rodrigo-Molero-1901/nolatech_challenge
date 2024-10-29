import 'package:nolatech_challenge/features/common/data/models/reservation_model.dart';

class ReservationRowViewModel {
  final String name;
  final String type;
  final String price;
  final String location;
  final List<String> imagePath;

  ReservationRowViewModel.fromModel(ReservationModel model)
      : name = model.name ?? '',
        type = model.type ?? '',
        price = (model.price ?? 0).toString(),
        location = model.location ?? '',
        imagePath = model.imagesPath ?? [];
}
