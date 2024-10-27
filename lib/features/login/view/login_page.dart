// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:nolatech_challenge/core/router/routes.dart';
import 'package:nolatech_challenge/shared/shared.dart';

import '../presentation/login_cubit.dart';
import '../presentation/viewmodels/login_view_model.dart';

part 'components/login_navigation.dart';
part 'components/login_view.dart';

@injectable
class LoginPage extends StatefulWidget {
  final LoginCubit _cubit;

  const LoginPage({
    required LoginCubit cubit,
  }) : _cubit = cubit;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = widget._cubit;
    _cubit.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppContextColors.background,
      body: SafeArea(
        child: BlocConsumer<LoginCubit, LoginState>(
          bloc: _cubit,
          listener: (context, state) {
            if (state case LoginMain(:final viewModel)) {
              if (viewModel.navigation != null) {
                viewModel.navigation!.navigate(context);
              }
            }
          },
          builder: (context, state) {
            return switch (state) {
              LoginInitial() => const SizedBox.shrink(),
              LoginMain(:final viewModel) => _LoginView(
                  cubit: _cubit,
                  viewModel: viewModel,
                ),
            };
          },
        ),
      ),
    );
  }
}
