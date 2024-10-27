part of '../home_page.dart';

class _UserReservationList extends StatelessWidget {
  final HomeCubit cubit;
  final HomeViewModel viewModel;

  const _UserReservationList({
    required this.cubit,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    if (viewModel.scheduledReservationViewModels.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.homeHorizontalPadding,
        ),
        child: Text(
          l10n.h_empty_scheduled_reservations,
          textAlign: TextAlign.center,
          style: AppTextStyles.body.large,
        ),
      );
    }

    return const Placeholder();
  }
}
