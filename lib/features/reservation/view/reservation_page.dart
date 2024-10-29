// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:nolatech_challenge/shared/shared.dart';

import '../../../core/core.dart';
import '../../common/params/reservation_params.dart';
import '../presentation/reservation_cubit.dart';
import '../presentation/viewmodels/reservation_view_model.dart';

part 'components/information_section.dart';
part 'components/reservation_navigation.dart';
part 'components/reservation_view.dart';
part 'components/schedule_section.dart';

@injectable
class ReservationPage extends StatefulWidget {
  final ReservationCubit _cubit;
  final ReservationParams params;

  const ReservationPage({
    required ReservationCubit cubit,
    @factoryParam required this.params,
  }) : _cubit = cubit;

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  late ReservationCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = widget._cubit;
    _cubit.initialize(
      userId: widget.params.userId,
      reservationId: widget.params.reservationId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppContextColors.reservationScheduleSectionBackground,
      body: SafeArea(
        child: BlocConsumer<ReservationCubit, ReservationState>(
          bloc: _cubit,
          listener: (context, state) {
            if (state case ReservationMain(:final viewModel)) {
              if (viewModel.navigation != null) {
                viewModel.navigation!.navigate(context, widget.params);
              }
            }
          },
          builder: (context, state) {
            return switch (state) {
              ReservationInitial() => const SizedBox.shrink(),
              ReservationMain(:final viewModel) => _ReservationView(
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
