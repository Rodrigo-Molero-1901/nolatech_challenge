// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:nolatech_challenge/core/core.dart' as _i3;
import 'package:nolatech_challenge/core/service/manager/api_manager.dart'
    as _i6;
import 'package:nolatech_challenge/features/common/data/repositories/auth_repository_impl.dart'
    as _i5;
import 'package:nolatech_challenge/features/common/data/repositories/reservation_repository_impl.dart'
    as _i13;
import 'package:nolatech_challenge/features/common/domain/repositories/auth_repository.dart'
    as _i4;
import 'package:nolatech_challenge/features/common/domain/repositories/reservation_repository.dart'
    as _i12;
import 'package:nolatech_challenge/features/common/params/home_params.dart'
    as _i21;
import 'package:nolatech_challenge/features/home/domain/usecases/get_reservations.dart'
    as _i17;
import 'package:nolatech_challenge/features/home/domain/usecases/get_user.dart'
    as _i8;
import 'package:nolatech_challenge/features/home/domain/usecases/get_user_reservations.dart'
    as _i18;
import 'package:nolatech_challenge/features/home/presentation/home_cubit.dart'
    as _i19;
import 'package:nolatech_challenge/features/home/view/home_page.dart' as _i20;
import 'package:nolatech_challenge/features/login/domain/usecases/authenticate_user.dart'
    as _i7;
import 'package:nolatech_challenge/features/login/presentation/login_cubit.dart'
    as _i9;
import 'package:nolatech_challenge/features/login/view/login_page.dart' as _i10;
import 'package:nolatech_challenge/features/register/domain/usecases/register_user.dart'
    as _i11;
import 'package:nolatech_challenge/features/register/presentation/register_cubit.dart'
    as _i22;
import 'package:nolatech_challenge/features/register/view/register_page.dart'
    as _i23;
import 'package:nolatech_challenge/features/welcome/presentation/welcome_cubit.dart'
    as _i15;
import 'package:nolatech_challenge/features/welcome/view/welcome_page.dart'
    as _i16;
import 'package:nolatech_challenge/objectbox.g.dart' as _i14;

import 'app_module.dart' as _i24;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    await gh.factoryAsync<_i3.ApiManager>(
      () => appModule.apiManager,
      preResolve: true,
    );
    gh.factory<_i4.AuthRepository>(
        () => _i5.AuthRepositoryImpl(apiManager: gh<_i6.ApiManager>()));
    gh.factory<_i7.AuthenticateUserUseCase>(
        () => _i7.AuthenticateUserUseCase(gh<_i4.AuthRepository>()));
    gh.factory<_i8.GetUserUseCase>(
        () => _i8.GetUserUseCase(gh<_i4.AuthRepository>()));
    gh.factory<_i9.LoginCubit>(() => _i9.LoginCubit(
        authenticateUserUseCase: gh<_i7.AuthenticateUserUseCase>()));
    gh.factory<_i10.LoginPage>(
        () => _i10.LoginPage(cubit: gh<_i9.LoginCubit>()));
    gh.factory<_i11.RegisterUserUseCase>(
        () => _i11.RegisterUserUseCase(gh<_i4.AuthRepository>()));
    gh.factory<_i12.ReservationRepository>(
        () => _i13.ReservationRepositoryImpl(apiManager: gh<_i6.ApiManager>()));
    await gh.factoryAsync<_i14.Store>(
      () => appModule.objectBoxStore,
      preResolve: true,
    );
    gh.factory<_i15.WelcomeCubit>(() => _i15.WelcomeCubit());
    gh.factory<_i16.WelcomePage>(
        () => _i16.WelcomePage(cubit: gh<_i15.WelcomeCubit>()));
    gh.factory<_i17.GetReservationsUseCase>(
        () => _i17.GetReservationsUseCase(gh<_i12.ReservationRepository>()));
    gh.factory<_i18.GetUserReservationsUseCase>(() =>
        _i18.GetUserReservationsUseCase(gh<_i12.ReservationRepository>()));
    gh.factory<_i19.HomeCubit>(() => _i19.HomeCubit(
          getReservationsUseCase: gh<_i17.GetReservationsUseCase>(),
          getUserUseCase: gh<_i8.GetUserUseCase>(),
          getUserReservationsUseCase: gh<_i18.GetUserReservationsUseCase>(),
        ));
    gh.factoryParam<_i20.HomePage, _i21.HomeParams, dynamic>((
      params,
      _,
    ) =>
        _i20.HomePage(
          cubit: gh<_i19.HomeCubit>(),
          params: params,
        ));
    gh.factory<_i22.RegisterCubit>(() => _i22.RegisterCubit(
        registerUserUseCase: gh<_i11.RegisterUserUseCase>()));
    gh.factory<_i23.RegisterPage>(
        () => _i23.RegisterPage(cubit: gh<_i22.RegisterCubit>()));
    return this;
  }
}

class _$AppModule extends _i24.AppModule {}
