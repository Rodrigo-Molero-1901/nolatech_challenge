part of '../home_tab_page.dart';

class _UserReservationList extends StatelessWidget {
  final HomeTabCubit cubit;
  final HomeTabViewModel viewModel;

  const _UserReservationList({
    required this.cubit,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        if (viewModel.scheduledReservationViewModels.isEmpty) ...[
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.homeHorizontalPadding,
            ),
            child: Text(
              l10n.h_empty_scheduled_reservations,
              textAlign: TextAlign.center,
              style: AppTextStyles.body.large,
            ),
          ),
        ] else
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: viewModel.scheduledReservationViewModels.length,
            separatorBuilder: (_, __) =>
                const SizedBox(height: AppSpacing.spacing1x),
            itemBuilder: (context, i) {
              final viewModelItem = viewModel.scheduledReservationViewModels[i];
              return _UserReservationListItem(
                viewModel: viewModelItem,
                userName: viewModel.userViewModel.fullName,
              );
            },
          ),
        const SizedBox(height: AppSpacing.spacing2x),
      ],
    );
  }
}

class _UserReservationListItem extends StatelessWidget {
  final ReservationRowViewModel viewModel;
  final String userName;

  const _UserReservationListItem({
    required this.viewModel,
    required this.userName,
  });

  static const _itemHeight = 120.0;
  static const _imageSize = 60.0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Container(
      height: _itemHeight,
      padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.homeTabReservationRowVerticalPadding,
      ),
      color: AppContextColors.reservationRowBackground,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: AppSpacing.spacing2Dot5x),
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(AppDimensions.borderRadius3x),
            ),
            child: Image.asset(
              viewModel.imagePath.first,
              height: _imageSize,
              width: _imageSize,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const FlutterLogo(),
            ),
          ),
          const SizedBox(width: AppSpacing.spacing1x),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                viewModel.name,
                style: AppTextStyles.title.medium.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppSpacing.spacing0Dot5x),
              Text(
                '26 de octubre 2025',
                style: AppTextStyles.body.small,
              ),
              const SizedBox(height: AppSpacing.spacing0Dot75x),
              Text(
                'Reservado por: $userName',
                style: AppTextStyles.body.small,
              ),
              const SizedBox(height: AppSpacing.spacing1Dot25x),
              Row(
                children: [
                  Assets.icons.clock.svg(),
                  const SizedBox(width: AppSpacing.spacing1x),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
