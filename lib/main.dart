import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import 'di/injection.dart';
import 'features/features.dart';
import 'shared/shared.dart';
import 'core/core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  await configureModuleDependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter _router = _createRouter();

  GoRouter _createRouter() {
    return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: Routes.pathWelcome,
      routes: [
        GoRoute(
          path: Routes.pathWelcome,
          name: Routes.nameWelcome,
          builder: (context, state) {
            return injector<WelcomePage>();
          },
        ),
        GoRoute(
          path: Routes.pathLogin,
          name: Routes.nameLogin,
          builder: (context, state) {
            return injector<LoginPage>();
          },
        ),
        GoRoute(
          path: Routes.pathRegister,
          name: Routes.nameRegister,
          builder: (context, state) {
            return injector<RegisterPage>();
          },
        ),
        GoRoute(
          path: Routes.pathHome,
          name: Routes.nameHome,
          builder: (context, state) {
            final params = state.extra! as HomeParams;
            return injector<HomePage>(
              param1: params,
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Airmiles Example App',
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      routerConfig: _router,
    );
  }
}
