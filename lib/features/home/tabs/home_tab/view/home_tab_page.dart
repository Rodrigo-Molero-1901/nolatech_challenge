// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:nolatech_challenge/core/core.dart';
import 'package:nolatech_challenge/shared/shared.dart';

import '../../../../common/params/home_params.dart';
import '../presentation/home_tab_cubit.dart';
import '../presentation/viewmodels/home_tab_view_model.dart';
import '../presentation/viewmodels/reservation_carousel_view_model.dart';
import '../presentation/viewmodels/reservation_row_view_model.dart';

part 'components/divider.dart';
part 'components/header.dart';
part 'components/home_tab_navigation.dart';
part 'components/home_tab_view.dart';
part 'components/reservation_list.dart';
part 'components/user_reservation_list.dart';

@injectable
class HomeTabPage extends StatefulWidget {
  final HomeTabCubit _cubit;
  final HomeParams params;

  const HomeTabPage({
    required HomeTabCubit cubit,
    @factoryParam required this.params,
  }) : _cubit = cubit;

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  late HomeTabCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = widget._cubit;
    _cubit.initialize(userId: widget.params.loggedUserId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTabCubit, HomeTabState>(
      bloc: _cubit,
      listener: (context, state) {
        if (state case HomeTabMain(:final viewModel)) {
          if (viewModel.navigation != null) {
            viewModel.navigation!.navigate(context);
          }
        }
      },
      builder: (context, state) {
        return switch (state) {
          HomeTabInitial() => const SizedBox.shrink(),
          HomeTabMain(:final viewModel) => _HomeTabView(
              cubit: _cubit,
              viewModel: viewModel,
            ),
        };
      },
    );
  }
}
