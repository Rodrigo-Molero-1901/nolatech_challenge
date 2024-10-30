import 'package:objectbox/objectbox.dart';

import 'reservation.dart';
import 'user.dart';

@Entity()
class ScheduleLink {
  @Id()
  int objectId = 0;
  String instructor;
  String date;
  String time;
  String comment;

  final user = ToOne<User>();
  final reservation = ToOne<Reservation>();

  ScheduleLink({
    this.objectId = 0,
    required this.instructor,
    required this.date,
    required this.time,
    required this.comment,
  });
}
