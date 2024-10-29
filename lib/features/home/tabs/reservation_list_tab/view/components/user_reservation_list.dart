part of '../reservation_list_tab_page.dart';

class _UserReservationList extends StatelessWidget {
  final ReservationListTabCubit cubit;
  final ReservationListTabViewModel viewModel;

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

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: viewModel.scheduledReservationViewModels.length,
      separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.spacing2x),
      itemBuilder: (context, i) {
        final viewModelItem = viewModel.scheduledReservationViewModels[i];
        return _UserReservationListItem(
          viewModel: viewModelItem,
          userName: viewModel.userViewModel.fullName,
          onSwipeLeft: () => cubit.onDeleteReservationTapped(pos: i),
        );
      },
    );
  }
}

class _UserReservationListItem extends StatelessWidget {
  final ReservationRowViewModel viewModel;
  final String userName;
  final Function() onSwipeLeft;

  const _UserReservationListItem({
    required this.viewModel,
    required this.userName,
    required this.onSwipeLeft,
  });

  static const _itemHeight = 152.0;
  static const _imageSize = 60.0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimensions.borderRadius3x),
      ),
      child: Slidable(
        key: UniqueKey(),
        endActionPane: ActionPane(
          motion: const BehindMotion(),
          openThreshold: 0.10,
          dismissible: DismissiblePane(onDismissed: onSwipeLeft),
          children: [
            SlidableAction(
              onPressed: (_) => onSwipeLeft.call(),
              backgroundColor: AppContextColors.slidableBackground,
              foregroundColor: AppContextColors.slidableForeground,
              icon: Icons.delete,
            ),
          ],
        ),
        child: Container(
          height: _itemHeight,
          padding: const EdgeInsets.symmetric(
            vertical: AppDimensions.reservationTabReservationRowVerticalPadding,
            horizontal:
                AppDimensions.reservationTabReservationRowHorizontalPadding,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(AppDimensions.borderRadius3x),
            ),
            border: Border.all(color: AppContextColors.reservationRowBorder),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              const SizedBox(width: AppSpacing.spacing1Dot5x),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    viewModel.name,
                    style: AppTextStyles.title.medium.copyWith(
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.spacing0Dot5x),
                  Text(
                    l10n.r_reservation_type(viewModel.type),
                    style: AppTextStyles.body.small,
                  ),
                  const SizedBox(height: AppSpacing.spacing1x),
                  Text(
                    '26 de octubre 2025',
                    style: AppTextStyles.body.small,
                  ),
                  const SizedBox(height: AppSpacing.spacing1Dot25x),
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
        ),
      ),
    );
  }
}
