import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:nolatech_challenge/di/injection.config.dart';

final injector = GetIt.instance;

@InjectableInit(preferRelativeImports: true)
Future<void> configureModuleDependencies() async => injector.init();
