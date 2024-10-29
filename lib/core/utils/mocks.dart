import '../../features/features.dart';
import '../../shared/shared.dart';

final reservationMockList = [
  Reservation(
    name: 'Epic Box',
    type: 'A',
    location: 'Vía Av. Caracas y Av. P.º Caroni',
    imagesPath: List.generate(3, (_) => Assets.images.field1.path),
    price: 25,
    comment: '',
  ),
  Reservation(
    name: 'Rusty Tenis',
    type: 'C',
    location: 'Vía Av. Caracas y Av. P.º Caroni',
    imagesPath: List.generate(3, (_) => Assets.images.field2.path),
    price: 40,
    comment: '',
  ),
  Reservation(
    name: 'Sport Box',
    type: 'B',
    location: 'Vía Av. Caracas y Av. P.º Caroni',
    imagesPath: List.generate(3, (_) => Assets.images.field3.path),
    price: 50,
    comment: '',
  ),
];

final instructorMockList = [
  'Mark Gonzales',
  'Novak Djokovic',
  'Roger Federer',
];
