// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:nolatech_challenge/di/injection.dart';

import '../../../../shared/shared.dart';
import '../../common/params/home_params.dart';
import '../presentation/home_cubit.dart';
import '../tabs/favorite_list_tab/view/favorite_list_tab_page.dart';
import '../tabs/home_tab/view/home_tab_page.dart';
import '../tabs/reservation_list_tab/view/reservation_list_tab_page.dart';

part 'components/bottom_bar.dart';
part 'components/header.dart';

@injectable
class HomePage extends StatefulWidget {
  final HomeCubit _cubit;
  final HomeParams params;

  const HomePage({
    required HomeCubit cubit,
    @factoryParam required this.params,
  }) : _cubit = cubit;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeCubit _cubit;

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
        child: BlocBuilder<HomeCubit, HomeState>(
          bloc: _cubit,
          builder: (context, state) {
            return Column(
              children: [
                const _Header(),
                Expanded(
                  child: switch (state) {
                    HomeInitial() => const SizedBox.shrink(),
                    HomeTab() => injector<HomeTabPage>(
                        param1: widget.params,
                      ),
                    ReservationListTab() => injector<ReservationListTabPage>(
                        param1: widget.params,
                      ),
                    FavoriteListTab() => injector<FavoriteListTabPage>(
                        param1: widget.params,
                      ),
                  },
                ),
                _BottomBar(
                  cubit: _cubit,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
