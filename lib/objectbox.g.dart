// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'features/common/domain/entities/favorite_link.dart';
import 'features/common/domain/entities/reservation.dart';
import 'features/common/domain/entities/schedule_link.dart';
import 'features/common/domain/entities/user.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 2164901721695193185),
      name: 'Reservation',
      lastPropertyId: const obx_int.IdUid(7, 8598965613034956423),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 6582137517972967086),
            name: 'objectId',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 986980068073218628),
            name: 'name',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 5115289646585353190),
            name: 'type',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 8626581613448842239),
            name: 'location',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 1111806654402499643),
            name: 'imagesPath',
            type: 30,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 5678029305548785169),
            name: 'price',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 8598965613034956423),
            name: 'comment',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(2, 7409338475108926508),
      name: 'User',
      lastPropertyId: const obx_int.IdUid(5, 9179094519127155276),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 4046982878155067277),
            name: 'objectId',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 3097359315424326664),
            name: 'name',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 2688224539192308008),
            name: 'phoneNumber',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 4622293277829058336),
            name: 'email',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 9179094519127155276),
            name: 'password',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(3, 6007300013225282654),
      name: 'FavoriteLink',
      lastPropertyId: const obx_int.IdUid(3, 6083565944430559182),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 8415960908692658859),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 4532792937845403490),
            name: 'userId',
            type: 11,
            flags: 520,
            indexId: const obx_int.IdUid(1, 8464532788700545662),
            relationTarget: 'User'),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 6083565944430559182),
            name: 'reservationId',
            type: 11,
            flags: 520,
            indexId: const obx_int.IdUid(2, 7954993229426010145),
            relationTarget: 'Reservation')
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(4, 5407647217594621540),
      name: 'ScheduleLink',
      lastPropertyId: const obx_int.IdUid(3, 7433358694243872794),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 7187369152124941206),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 9110931653614356524),
            name: 'userId',
            type: 11,
            flags: 520,
            indexId: const obx_int.IdUid(3, 5217423456557762732),
            relationTarget: 'User'),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 7433358694243872794),
            name: 'reservationId',
            type: 11,
            flags: 520,
            indexId: const obx_int.IdUid(4, 7812577401165715482),
            relationTarget: 'Reservation')
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(getObjectBoxModel(),
      directory: directory ?? (await defaultStoreDirectory()).path,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(4, 5407647217594621540),
      lastIndexId: const obx_int.IdUid(4, 7812577401165715482),
      lastRelationId: const obx_int.IdUid(1, 6414415473362961583),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [6414415473362961583],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    Reservation: obx_int.EntityDefinition<Reservation>(
        model: _entities[0],
        toOneRelations: (Reservation object) => [],
        toManyRelations: (Reservation object) => {},
        getId: (Reservation object) => object.objectId,
        setId: (Reservation object, int id) {
          object.objectId = id;
        },
        objectToFB: (Reservation object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final typeOffset = fbb.writeString(object.type);
          final locationOffset = fbb.writeString(object.location);
          final imagesPathOffset = fbb.writeList(
              object.imagesPath.map(fbb.writeString).toList(growable: false));
          final commentOffset = fbb.writeString(object.comment);
          fbb.startTable(8);
          fbb.addInt64(0, object.objectId);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, typeOffset);
          fbb.addOffset(3, locationOffset);
          fbb.addOffset(4, imagesPathOffset);
          fbb.addInt64(5, object.price);
          fbb.addOffset(6, commentOffset);
          fbb.finish(fbb.endTable());
          return object.objectId;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final objectIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final typeParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final locationParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final imagesPathParam = const fb.ListReader<String>(
                  fb.StringReader(asciiOptimization: true),
                  lazy: false)
              .vTableGet(buffer, rootOffset, 12, []);
          final priceParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0);
          final commentParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 16, '');
          final object = Reservation(
              objectId: objectIdParam,
              name: nameParam,
              type: typeParam,
              location: locationParam,
              imagesPath: imagesPathParam,
              price: priceParam,
              comment: commentParam);

          return object;
        }),
    User: obx_int.EntityDefinition<User>(
        model: _entities[1],
        toOneRelations: (User object) => [],
        toManyRelations: (User object) => {},
        getId: (User object) => object.objectId,
        setId: (User object, int id) {
          object.objectId = id;
        },
        objectToFB: (User object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final phoneNumberOffset = fbb.writeString(object.phoneNumber);
          final emailOffset = fbb.writeString(object.email);
          final passwordOffset = fbb.writeString(object.password);
          fbb.startTable(6);
          fbb.addInt64(0, object.objectId);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, phoneNumberOffset);
          fbb.addOffset(3, emailOffset);
          fbb.addOffset(4, passwordOffset);
          fbb.finish(fbb.endTable());
          return object.objectId;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final objectIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final phoneNumberParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, '');
          final emailParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final passwordParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 12, '');
          final object = User(
              objectId: objectIdParam,
              name: nameParam,
              phoneNumber: phoneNumberParam,
              email: emailParam,
              password: passwordParam);

          return object;
        }),
    FavoriteLink: obx_int.EntityDefinition<FavoriteLink>(
        model: _entities[2],
        toOneRelations: (FavoriteLink object) =>
            [object.user, object.reservation],
        toManyRelations: (FavoriteLink object) => {},
        getId: (FavoriteLink object) => object.id,
        setId: (FavoriteLink object, int id) {
          object.id = id;
        },
        objectToFB: (FavoriteLink object, fb.Builder fbb) {
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.user.targetId);
          fbb.addInt64(2, object.reservation.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = FavoriteLink()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          object.user.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0);
          object.user.attach(store);
          object.reservation.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          object.reservation.attach(store);
          return object;
        }),
    ScheduleLink: obx_int.EntityDefinition<ScheduleLink>(
        model: _entities[3],
        toOneRelations: (ScheduleLink object) =>
            [object.user, object.reservation],
        toManyRelations: (ScheduleLink object) => {},
        getId: (ScheduleLink object) => object.id,
        setId: (ScheduleLink object, int id) {
          object.id = id;
        },
        objectToFB: (ScheduleLink object, fb.Builder fbb) {
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.user.targetId);
          fbb.addInt64(2, object.reservation.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = ScheduleLink()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          object.user.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0);
          object.user.attach(store);
          object.reservation.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          object.reservation.attach(store);
          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [Reservation] entity fields to define ObjectBox queries.
class Reservation_ {
  /// See [Reservation.objectId].
  static final objectId =
      obx.QueryIntegerProperty<Reservation>(_entities[0].properties[0]);

  /// See [Reservation.name].
  static final name =
      obx.QueryStringProperty<Reservation>(_entities[0].properties[1]);

  /// See [Reservation.type].
  static final type =
      obx.QueryStringProperty<Reservation>(_entities[0].properties[2]);

  /// See [Reservation.location].
  static final location =
      obx.QueryStringProperty<Reservation>(_entities[0].properties[3]);

  /// See [Reservation.imagesPath].
  static final imagesPath =
      obx.QueryStringVectorProperty<Reservation>(_entities[0].properties[4]);

  /// See [Reservation.price].
  static final price =
      obx.QueryIntegerProperty<Reservation>(_entities[0].properties[5]);

  /// See [Reservation.comment].
  static final comment =
      obx.QueryStringProperty<Reservation>(_entities[0].properties[6]);
}

/// [User] entity fields to define ObjectBox queries.
class User_ {
  /// See [User.objectId].
  static final objectId =
      obx.QueryIntegerProperty<User>(_entities[1].properties[0]);

  /// See [User.name].
  static final name = obx.QueryStringProperty<User>(_entities[1].properties[1]);

  /// See [User.phoneNumber].
  static final phoneNumber =
      obx.QueryStringProperty<User>(_entities[1].properties[2]);

  /// See [User.email].
  static final email =
      obx.QueryStringProperty<User>(_entities[1].properties[3]);

  /// See [User.password].
  static final password =
      obx.QueryStringProperty<User>(_entities[1].properties[4]);
}

/// [FavoriteLink] entity fields to define ObjectBox queries.
class FavoriteLink_ {
  /// See [FavoriteLink.id].
  static final id =
      obx.QueryIntegerProperty<FavoriteLink>(_entities[2].properties[0]);

  /// See [FavoriteLink.user].
  static final user =
      obx.QueryRelationToOne<FavoriteLink, User>(_entities[2].properties[1]);

  /// See [FavoriteLink.reservation].
  static final reservation = obx.QueryRelationToOne<FavoriteLink, Reservation>(
      _entities[2].properties[2]);
}

/// [ScheduleLink] entity fields to define ObjectBox queries.
class ScheduleLink_ {
  /// See [ScheduleLink.id].
  static final id =
      obx.QueryIntegerProperty<ScheduleLink>(_entities[3].properties[0]);

  /// See [ScheduleLink.user].
  static final user =
      obx.QueryRelationToOne<ScheduleLink, User>(_entities[3].properties[1]);

  /// See [ScheduleLink.reservation].
  static final reservation = obx.QueryRelationToOne<ScheduleLink, Reservation>(
      _entities[3].properties[2]);
}
