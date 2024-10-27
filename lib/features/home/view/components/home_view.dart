part of '../home_page.dart';

class _HomeView extends StatefulWidget {
  final HomeCubit cubit;
  final HomeViewModel viewModel;

  const _HomeView({
    required this.cubit,
    required this.viewModel,
  });

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      children: [
        _Header(cubit: widget.cubit),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppDimensions.homeWelcomeTitleVerticalPadding,
                    horizontal: AppDimensions.homeHorizontalPadding,
                  ),
                  child: Text(
                    l10n.h_welcome_title(widget.viewModel.userViewModel.name),
                    style: AppTextStyles.title.large.copyWith(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const _Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.homeHorizontalPadding,
                  ),
                  child: Text(
                    l10n.h_reservations_section,
                    style: AppTextStyles.title.medium.copyWith(fontSize: 18.0),
                  ),
                ),
                const SizedBox(height: AppSpacing.spacing2x),
                _ReservationList(
                  cubit: widget.cubit,
                  viewModel: widget.viewModel,
                ),
                const SizedBox(height: AppSpacing.spacing2Dot5x),
                const _Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.homeHorizontalPadding,
                  ),
                  child: Text(
                    l10n.h_scheduled_reservation_section,
                    style: AppTextStyles.title.medium.copyWith(fontSize: 18.0),
                  ),
                ),
                const SizedBox(height: AppSpacing.spacing2x),
                _UserReservationList(
                  cubit: widget.cubit,
                  viewModel: widget.viewModel,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
