// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:nolatech_challenge/core/router/routes.dart';
import 'package:nolatech_challenge/shared/shared.dart';

import '../presentation/register_cubit.dart';
import '../presentation/viewmodels/register_view_model.dart';

part 'components/register_navigation.dart';
part 'components/register_view.dart';

@injectable
class RegisterPage extends StatefulWidget {
  final RegisterCubit _cubit;

  const RegisterPage({
    required RegisterCubit cubit,
  }) : _cubit = cubit;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late RegisterCubit _cubit;

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
        child: BlocConsumer<RegisterCubit, RegisterState>(
          bloc: _cubit,
          listener: (context, state) {
            if (state case RegisterMain(:final viewModel)) {
              if (viewModel.navigation != null) {
                viewModel.navigation!.navigate(context);
              }
            }
          },
          builder: (context, state) {
            return switch (state) {
              RegisterInitial() => const SizedBox.shrink(),
              RegisterMain(:final viewModel) => _RegisterView(
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
