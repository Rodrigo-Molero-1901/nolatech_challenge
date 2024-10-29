// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:nolatech_challenge/shared/shared.dart';

import '../../../../common/params/home_params.dart';
import '../../../../common/presentation/viewmodels/reservation_row_view_model.dart';
import '../presentation/reservation_list_tab_cubit.dart';
import '../presentation/viewmodels/reservation_list_tab_view_model.dart';

part 'components/reservation_list_tab_view.dart';
part 'components/user_reservation_list.dart';

@injectable
class ReservationListTabPage extends StatefulWidget {
  final ReservationListTabCubit _cubit;
  final HomeParams params;

  const ReservationListTabPage({
    required ReservationListTabCubit cubit,
    @factoryParam required this.params,
  }) : _cubit = cubit;

  @override
  State<ReservationListTabPage> createState() => _ReservationListTabPageState();
}

class _ReservationListTabPageState extends State<ReservationListTabPage> {
  late ReservationListTabCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = widget._cubit;
    _cubit.initialize(userId: widget.params.loggedUserId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReservationListTabCubit, ReservationListTabState>(
      bloc: _cubit,
      listener: (context, state) {
        if (state case ReservationListTabMain(:final viewModel)) {
          if (viewModel.navigation != null) {
            // viewModel.navigation!.navigate(context);
          }
        }
      },
      builder: (context, state) {
        return switch (state) {
          ReservationListTabInitial() => const SizedBox.shrink(),
          ReservationListTabMain(:final viewModel) => _ReservationListTabView(
              cubit: _cubit,
              viewModel: viewModel,
            ),
        };
      },
    );
  }
}
