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
    as _i16;
import 'package:nolatech_challenge/features/common/domain/repositories/auth_repository.dart'
    as _i4;
import 'package:nolatech_challenge/features/common/domain/repositories/reservation_repository.dart'
    as _i15;
import 'package:nolatech_challenge/features/common/domain/usecases/get_user.dart'
    as _i8;
import 'package:nolatech_challenge/features/common/domain/usecases/get_user_reservations.dart'
    as _i26;
import 'package:nolatech_challenge/features/common/params/home_params.dart'
    as _i11;
import 'package:nolatech_challenge/features/common/params/reservation_params.dart'
    as _i36;
import 'package:nolatech_challenge/features/home/presentation/home_cubit.dart'
    as _i9;
import 'package:nolatech_challenge/features/home/tabs/favorite_list_tab/domain/usecases/get_favorite_reservations.dart'
    as _i23;
import 'package:nolatech_challenge/features/home/tabs/favorite_list_tab/presentation/favorite_list_tab_cubit.dart'
    as _i37;
import 'package:nolatech_challenge/features/home/tabs/favorite_list_tab/view/favorite_list_tab_page.dart'
    as _i38;
import 'package:nolatech_challenge/features/home/tabs/home_tab/domain/usecases/get_reservations.dart'
    as _i25;
import 'package:nolatech_challenge/features/home/tabs/home_tab/presentation/home_tab_cubit.dart'
    as _i27;
import 'package:nolatech_challenge/features/home/tabs/home_tab/view/home_tab_page.dart'
    as _i28;
import 'package:nolatech_challenge/features/home/tabs/reservation_list_tab/domain/usecases/delete_scheduled_reservation.dart'
    as _i22;
import 'package:nolatech_challenge/features/home/tabs/reservation_list_tab/presentation/reservation_list_tab_cubit.dart'
    as _i33;
import 'package:nolatech_challenge/features/home/tabs/reservation_list_tab/view/reservation_list_tab_page.dart'
    as _i34;
import 'package:nolatech_challenge/features/home/view/home_page.dart' as _i10;
import 'package:nolatech_challenge/features/login/domain/usecases/authenticate_user.dart'
    as _i7;
import 'package:nolatech_challenge/features/login/presentation/login_cubit.dart'
    as _i12;
import 'package:nolatech_challenge/features/login/view/login_page.dart' as _i13;
import 'package:nolatech_challenge/features/register/domain/usecases/register_user.dart'
    as _i14;
import 'package:nolatech_challenge/features/register/presentation/register_cubit.dart'
    as _i30;
import 'package:nolatech_challenge/features/register/view/register_page.dart'
    as _i31;
import 'package:nolatech_challenge/features/reservation/domain/usecases/get_reservation.dart'
    as _i24;
import 'package:nolatech_challenge/features/reservation/domain/usecases/is_favorite_reservation.dart'
    as _i29;
import 'package:nolatech_challenge/features/reservation/domain/usecases/save_to_favorite.dart'
    as _i17;
import 'package:nolatech_challenge/features/reservation/domain/usecases/schedule_reservation.dart'
    as _i18;
import 'package:nolatech_challenge/features/reservation/presentation/reservation_cubit.dart'
    as _i32;
import 'package:nolatech_challenge/features/reservation/view/reservation_page.dart'
    as _i35;
import 'package:nolatech_challenge/features/welcome/presentation/welcome_cubit.dart'
    as _i20;
import 'package:nolatech_challenge/features/welcome/view/welcome_page.dart'
    as _i21;
import 'package:nolatech_challenge/objectbox.g.dart' as _i19;

import 'app_module.dart' as _i39;

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
    gh.factory<_i9.HomeCubit>(() => _i9.HomeCubit());
    gh.factoryParam<_i10.HomePage, _i11.HomeParams, dynamic>((
      params,
      _,
    ) =>
        _i10.HomePage(
          cubit: gh<_i9.HomeCubit>(),
          params: params,
        ));
    gh.factory<_i12.LoginCubit>(() => _i12.LoginCubit(
        authenticateUserUseCase: gh<_i7.AuthenticateUserUseCase>()));
    gh.factory<_i13.LoginPage>(
        () => _i13.LoginPage(cubit: gh<_i12.LoginCubit>()));
    gh.factory<_i14.RegisterUserUseCase>(
        () => _i14.RegisterUserUseCase(gh<_i4.AuthRepository>()));
    gh.factory<_i15.ReservationRepository>(
        () => _i16.ReservationRepositoryImpl(apiManager: gh<_i6.ApiManager>()));
    gh.factory<_i17.SaveToFavoriteUseCase>(
        () => _i17.SaveToFavoriteUseCase(gh<_i15.ReservationRepository>()));
    gh.factory<_i18.ScheduleReservationUseCase>(() =>
        _i18.ScheduleReservationUseCase(gh<_i15.ReservationRepository>()));
    await gh.factoryAsync<_i19.Store>(
      () => appModule.objectBoxStore,
      preResolve: true,
    );
    gh.factory<_i20.WelcomeCubit>(() => _i20.WelcomeCubit());
    gh.factory<_i21.WelcomePage>(
        () => _i21.WelcomePage(cubit: gh<_i20.WelcomeCubit>()));
    gh.factory<_i22.DeleteScheduledReservationUseCase>(() =>
        _i22.DeleteScheduledReservationUseCase(
            gh<_i15.ReservationRepository>()));
    gh.factory<_i23.GetFavoriteReservationsUseCase>(() =>
        _i23.GetFavoriteReservationsUseCase(gh<_i15.ReservationRepository>()));
    gh.factory<_i24.GetReservationUseCase>(
        () => _i24.GetReservationUseCase(gh<_i15.ReservationRepository>()));
    gh.factory<_i25.GetReservationsUseCase>(
        () => _i25.GetReservationsUseCase(gh<_i15.ReservationRepository>()));
    gh.factory<_i26.GetUserReservationsUseCase>(() =>
        _i26.GetUserReservationsUseCase(gh<_i15.ReservationRepository>()));
    gh.factory<_i27.HomeTabCubit>(() => _i27.HomeTabCubit(
          getUserUseCase: gh<_i8.GetUserUseCase>(),
          getReservationsUseCase: gh<_i25.GetReservationsUseCase>(),
          getUserReservationsUseCase: gh<_i26.GetUserReservationsUseCase>(),
        ));
    gh.factoryParam<_i28.HomeTabPage, _i11.HomeParams, dynamic>((
      params,
      _,
    ) =>
        _i28.HomeTabPage(
          cubit: gh<_i27.HomeTabCubit>(),
          params: params,
        ));
    gh.factory<_i29.IsFavoriteReservationUseCase>(() =>
        _i29.IsFavoriteReservationUseCase(gh<_i15.ReservationRepository>()));
    gh.factory<_i30.RegisterCubit>(() => _i30.RegisterCubit(
        registerUserUseCase: gh<_i14.RegisterUserUseCase>()));
    gh.factory<_i31.RegisterPage>(
        () => _i31.RegisterPage(cubit: gh<_i30.RegisterCubit>()));
    gh.factory<_i32.ReservationCubit>(() => _i32.ReservationCubit(
          getUserUseCase: gh<_i8.GetUserUseCase>(),
          getReservationUseCase: gh<_i24.GetReservationUseCase>(),
          isFavoriteReservationUseCase: gh<_i29.IsFavoriteReservationUseCase>(),
          saveToFavoriteUseCase: gh<_i17.SaveToFavoriteUseCase>(),
          scheduleReservationUseCase: gh<_i18.ScheduleReservationUseCase>(),
        ));
    gh.factory<_i33.ReservationListTabCubit>(() => _i33.ReservationListTabCubit(
          getUserUseCase: gh<_i8.GetUserUseCase>(),
          getUserReservationsUseCase: gh<_i26.GetUserReservationsUseCase>(),
          deleteScheduledReservationUseCase:
              gh<_i22.DeleteScheduledReservationUseCase>(),
        ));
    gh.factoryParam<_i34.ReservationListTabPage, _i11.HomeParams, dynamic>((
      params,
      _,
    ) =>
        _i34.ReservationListTabPage(
          cubit: gh<_i33.ReservationListTabCubit>(),
          params: params,
        ));
    gh.factoryParam<_i35.ReservationPage, _i36.ReservationParams, dynamic>((
      params,
      _,
    ) =>
        _i35.ReservationPage(
          cubit: gh<_i32.ReservationCubit>(),
          params: params,
        ));
    gh.factory<_i37.FavoriteListTabCubit>(() => _i37.FavoriteListTabCubit(
          getUserUseCase: gh<_i8.GetUserUseCase>(),
          getFavoriteReservationsUseCase:
              gh<_i23.GetFavoriteReservationsUseCase>(),
        ));
    gh.factoryParam<_i38.FavoriteListTabPage, _i11.HomeParams, dynamic>((
      params,
      _,
    ) =>
        _i38.FavoriteListTabPage(
          cubit: gh<_i37.FavoriteListTabCubit>(),
          params: params,
        ));
    return this;
  }
}

class _$AppModule extends _i39.AppModule {}
