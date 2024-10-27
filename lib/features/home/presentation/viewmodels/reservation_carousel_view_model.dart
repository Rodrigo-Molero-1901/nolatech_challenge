import '../../../common/data/models/reservation_model.dart';

class CarouselReservationViewModel {
  final String name;
  final String type;
  final String location;
  final List<String> imagePath;
  final String price;
  final String comment;

  CarouselReservationViewModel.fromModel(ReservationModel model)
      : name = model.name ?? '',
        type = model.type ?? '',
        location = model.location ?? '',
        imagePath = model.imagesPath ?? [],
        price = (model.price ?? 0).toString(),
        comment = model.comment ?? '';
}
