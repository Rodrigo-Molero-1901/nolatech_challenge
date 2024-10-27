// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nolatech_challenge/core/router/routes.dart';
import 'package:injectable/injectable.dart';

import '../../../shared/shared.dart';
import '../presentation/viewmodels/welcome_view_model.dart';
import '../presentation/welcome_cubit.dart';

part 'components/welcome_navigation.dart';
part 'components/welcome_view.dart';

@injectable
class WelcomePage extends StatefulWidget {
  final WelcomeCubit _cubit;

  const WelcomePage({
    required WelcomeCubit cubit,
  }) : _cubit = cubit;

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late WelcomeCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = widget._cubit;
    _cubit.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<WelcomeCubit, WelcomeState>(
          bloc: _cubit,
          listener: (context, state) {
            if (state case WelcomeMain(:final viewModel)) {
              if (viewModel.navigation != null) {
                viewModel.navigation!.navigate(context);
              }
            }
          },
          builder: (context, state) {
            return switch (state) {
              WelcomeInitial() => const SizedBox.shrink(),
              WelcomeMain(:final viewModel) => _WelcomeView(
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
