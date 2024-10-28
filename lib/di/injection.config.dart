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
import 'package:nolatech_challenge/features/common/domain/usecases/get_user.dart'
    as _i8;
import 'package:nolatech_challenge/features/common/params/home_params.dart'
    as _i23;
import 'package:nolatech_challenge/features/common/params/reservation_params.dart'
    as _i28;
import 'package:nolatech_challenge/features/home/domain/usecases/get_reservations.dart'
    as _i19;
import 'package:nolatech_challenge/features/home/domain/usecases/get_user_reservations.dart'
    as _i20;
import 'package:nolatech_challenge/features/home/presentation/home_cubit.dart'
    as _i21;
import 'package:nolatech_challenge/features/home/view/home_page.dart' as _i22;
import 'package:nolatech_challenge/features/login/domain/usecases/authenticate_user.dart'
    as _i7;
import 'package:nolatech_challenge/features/login/presentation/login_cubit.dart'
    as _i9;
import 'package:nolatech_challenge/features/login/view/login_page.dart' as _i10;
import 'package:nolatech_challenge/features/register/domain/usecases/register_user.dart'
    as _i11;
import 'package:nolatech_challenge/features/register/presentation/register_cubit.dart'
    as _i24;
import 'package:nolatech_challenge/features/register/view/register_page.dart'
    as _i25;
import 'package:nolatech_challenge/features/reservation/domain/usecases/get_reservation.dart'
    as _i18;
import 'package:nolatech_challenge/features/reservation/domain/usecases/schedule_reservation.dart'
    as _i14;
import 'package:nolatech_challenge/features/reservation/presentation/reservation_cubit.dart'
    as _i26;
import 'package:nolatech_challenge/features/reservation/view/reservation_page.dart'
    as _i27;
import 'package:nolatech_challenge/features/welcome/presentation/welcome_cubit.dart'
    as _i16;
import 'package:nolatech_challenge/features/welcome/view/welcome_page.dart'
    as _i17;
import 'package:nolatech_challenge/objectbox.g.dart' as _i15;

import 'app_module.dart' as _i29;

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
    gh.factory<_i14.ScheduleReservationUseCase>(() =>
        _i14.ScheduleReservationUseCase(gh<_i12.ReservationRepository>()));
    await gh.factoryAsync<_i15.Store>(
      () => appModule.objectBoxStore,
      preResolve: true,
    );
    gh.factory<_i16.WelcomeCubit>(() => _i16.WelcomeCubit());
    gh.factory<_i17.WelcomePage>(
        () => _i17.WelcomePage(cubit: gh<_i16.WelcomeCubit>()));
    gh.factory<_i18.GetReservationUseCase>(
        () => _i18.GetReservationUseCase(gh<_i12.ReservationRepository>()));
    gh.factory<_i19.GetReservationsUseCase>(
        () => _i19.GetReservationsUseCase(gh<_i12.ReservationRepository>()));
    gh.factory<_i20.GetUserReservationsUseCase>(() =>
        _i20.GetUserReservationsUseCase(gh<_i12.ReservationRepository>()));
    gh.factory<_i21.HomeCubit>(() => _i21.HomeCubit(
          getUserUseCase: gh<_i8.GetUserUseCase>(),
          getReservationsUseCase: gh<_i19.GetReservationsUseCase>(),
          getUserReservationsUseCase: gh<_i20.GetUserReservationsUseCase>(),
        ));
    gh.factoryParam<_i22.HomePage, _i23.HomeParams, dynamic>((
      params,
      _,
    ) =>
        _i22.HomePage(
          cubit: gh<_i21.HomeCubit>(),
          params: params,
        ));
    gh.factory<_i24.RegisterCubit>(() => _i24.RegisterCubit(
        registerUserUseCase: gh<_i11.RegisterUserUseCase>()));
    gh.factory<_i25.RegisterPage>(
        () => _i25.RegisterPage(cubit: gh<_i24.RegisterCubit>()));
    gh.factory<_i26.ReservationCubit>(() => _i26.ReservationCubit(
          getUserUseCase: gh<_i8.GetUserUseCase>(),
          getReservationUseCase: gh<_i18.GetReservationUseCase>(),
          scheduleReservationUseCase: gh<_i14.ScheduleReservationUseCase>(),
        ));
    gh.factoryParam<_i27.ReservationPage, _i28.ReservationParams, dynamic>((
      params,
      _,
    ) =>
        _i27.ReservationPage(
          cubit: gh<_i26.ReservationCubit>(),
          params: params,
        ));
    return this;
  }
}

class _$AppModule extends _i29.AppModule {}
