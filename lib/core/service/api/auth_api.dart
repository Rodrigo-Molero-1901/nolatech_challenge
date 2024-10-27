import 'package:flutter/foundation.dart';

import '../../../features/features.dart';
import '../../../objectbox.g.dart';

class AuthApi {
  final Store _store;
  late final Box<User> _box;

  AuthApi(
    this._store,
  ) {
    _box = _store.box<User>();
  }

  User? authenticateUser({
    required String email,
    required String password,
  }) {
    final user = _box
        .query(
          User_.email.equals(email) & User_.password.equals(password),
        )
        .build()
        .findFirst();

    if (user == null) {
      debugPrint('Correo o contraseña incorrectos...');
      return null;
    }

    debugPrint('Usuario autenticado...');
    return user;
  }

  User? registerUser({required User user}) {
    final existingUserWithEmail = _box
        .query(
          User_.email.equals(user.email),
        )
        .build()
        .findFirst();

    final existingUserWithPhoneNumber = _box
        .query(
          User_.phoneNumber.equals(user.phoneNumber),
        )
        .build()
        .findFirst();

    if (existingUserWithEmail != null || existingUserWithPhoneNumber != null) {
      debugPrint('Ya existe usuario con este correo o número de teléfono...');
      return null;
    }

    final id = _box.put(user, mode: PutMode.insert);
    debugPrint('Usuario registrado...');
    return _box.get(id);
  }

  User? getUserById({required int userId}) {
    final user = _box
        .query(
          User_.objectId.equals(userId),
        )
        .build()
        .findFirst();

    if (user == null) {
      debugPrint('No existe un usuario con el id: $userId');
      return null;
    }

    debugPrint('Usuario encontrado...');
    return user;
  }
}
