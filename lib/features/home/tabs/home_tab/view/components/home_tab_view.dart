part of '../home_tab_page.dart';

class _HomeTabView extends StatelessWidget {
  final HomeTabCubit cubit;
  final HomeTabViewModel viewModel;

  const _HomeTabView({
    required this.cubit,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimensions.homeWelcomeTitleVerticalPadding,
              horizontal: AppDimensions.homeHorizontalPadding,
            ),
            child: Text(
              l10n.h_welcome_title(viewModel.userViewModel.name),
              style: AppTextStyles.title.large.copyWith(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const _Divider(),
          _ReservationList(
            cubit: cubit,
            viewModel: viewModel,
          ),
          const _Divider(),
          _UserReservationList(
            cubit: cubit,
            viewModel: viewModel,
          ),
        ],
      ),
    );
  }
}
