class ReservationModel {
  int? objectId;
  String? name;
  String? type;
  String? location;
  List<String>? imagesPath;
  int? price;
  String? comment;

  ReservationModel({
    this.objectId,
    this.name,
    this.type,
    this.location,
    this.imagesPath,
    this.price,
    this.comment,
  });
}
