import 'package:nolatech_challenge/features/common/data/models/reservation_model.dart';

class ReservationRowViewModel {
  final String name;
  final String type;
  final String price;
  final List<String> imagePath;

  ReservationRowViewModel.fromModel(ReservationModel model)
      : name = model.name ?? '',
        type = model.type ?? '',
        imagePath = model.imagesPath ?? [],
        price = (model.price ?? 0).toString();
}
