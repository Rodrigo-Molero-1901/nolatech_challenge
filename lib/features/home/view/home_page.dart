// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:nolatech_challenge/core/core.dart';
import 'package:nolatech_challenge/shared/shared.dart';

import '../../common/params/home_params.dart';
import '../presentation/home_cubit.dart';
import '../presentation/viewmodels/home_view_model.dart';
import '../presentation/viewmodels/reservation_carousel_view_model.dart';

part 'components/divider.dart';
part 'components/header.dart';
part 'components/home_navigation.dart';
part 'components/home_view.dart';
part 'components/reservation_list.dart';
part 'components/user_reservation_list.dart';

@injectable
class HomePage extends StatefulWidget {
  final HomeCubit _cubit;
  final HomeParams params;

  const HomePage({required HomeCubit cubit, @factoryParam required this.params})
      : _cubit = cubit;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = widget._cubit;
    _cubit.initialize(userId: widget.params.loggedUserId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppContextColors.background,
      body: SafeArea(
        child: BlocConsumer<HomeCubit, HomeState>(
          bloc: _cubit,
          listener: (context, state) {
            if (state case HomeMain(:final viewModel)) {
              if (viewModel.navigation != null) {
                viewModel.navigation!.navigate(context);
              }
            }
          },
          builder: (context, state) {
            return switch (state) {
              HomeInitial() => const SizedBox.shrink(),
              HomeMain(:final viewModel) => _HomeView(
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
