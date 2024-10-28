import 'package:objectbox/objectbox.dart';

import 'reservation.dart';
import 'user.dart';

@Entity()
class ScheduleLink {
  @Id()
  int id = 0;

  final user = ToOne<User>();
  final reservation = ToOne<Reservation>();

  ScheduleLink();
}
