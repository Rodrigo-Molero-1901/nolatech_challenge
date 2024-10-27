import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'viewmodels/welcome_view_model.dart';

part 'welcome_state.dart';

@injectable
class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit() : super(WelcomeInitial());

  void initialize() {
    _emitMain();
  }

  void _emitMain({
    WelcomeNavigationViewModel? navigation,
  }) {
    emit(
      WelcomeMain(
        viewModel: WelcomeViewModel.fromSuccessState(
          navigation: navigation,
        ),
      ),
    );
  }

  void onLoginTapped() {
    _emitMain(navigation: LoginNavigation());
  }

  void onRegisterTapped() {
    _emitMain(navigation: RegisterNavigation());
  }
}
