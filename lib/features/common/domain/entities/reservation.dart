import 'package:objectbox/objectbox.dart';

import '../../data/models/reservation_model.dart';

@Entity()
class Reservation {
  @Id()
  int objectId;
  String name;
  String type;
  String location;
  List<String> imagesPath;
  int price;

  Reservation({
    this.objectId = 0,
    required this.name,
    required this.type,
    required this.location,
    required this.imagesPath,
    required this.price,
  });

  factory Reservation.fromModel(ReservationModel model) {
    return Reservation(
      objectId: model.objectId ?? 0,
      name: model.name ?? '',
      type: model.type ?? '',
      location: model.location ?? '',
      imagesPath: model.imagesPath ?? [],
      price: model.price ?? 0,
    );
  }

  ReservationModel toModel() {
    return ReservationModel(
      objectId: objectId,
      name: name,
      type: type,
      location: location,
      imagesPath: imagesPath,
      price: price,
    );
  }
}
