// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:nolatech_challenge/shared/shared.dart';

import '../../../../common/params/home_params.dart';
import '../../../../common/presentation/viewmodels/reservation_row_view_model.dart';
import '../presentation/favorite_list_tab_cubit.dart';
import '../presentation/viewmodels/favorite_list_tab_view_model.dart';

part 'components/favorite_list_tab_view.dart';
part 'components/user_favorite_list.dart';

@injectable
class FavoriteListTabPage extends StatefulWidget {
  final FavoriteListTabCubit _cubit;
  final HomeParams params;

  const FavoriteListTabPage({
    required FavoriteListTabCubit cubit,
    @factoryParam required this.params,
  }) : _cubit = cubit;

  @override
  State<FavoriteListTabPage> createState() => _FavoriteListTabPageState();
}

class _FavoriteListTabPageState extends State<FavoriteListTabPage> {
  late FavoriteListTabCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = widget._cubit;
    _cubit.initialize(userId: widget.params.loggedUserId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteListTabCubit, FavoriteListTabState>(
      bloc: _cubit,
      builder: (context, state) {
        return switch (state) {
          FavoriteListTabInitial() => const SizedBox.shrink(),
          FavoriteListTabMain(:final viewModel) => _FavoriteListTabView(
              cubit: _cubit,
              viewModel: viewModel,
            ),
        };
      },
    );
  }
}
