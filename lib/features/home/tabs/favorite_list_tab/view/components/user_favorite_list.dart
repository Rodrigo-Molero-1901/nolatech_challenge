part of '../favorite_list_tab_page.dart';

class _UserFavoriteList extends StatelessWidget {
  final FavoriteListTabViewModel viewModel;

  const _UserFavoriteList({
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    if (viewModel.favoriteReservationViewModels.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.homeHorizontalPadding,
        ),
        child: Text(
          l10n.h_empty_favorite_reservations,
          textAlign: TextAlign.center,
          style: AppTextStyles.body.large,
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: viewModel.favoriteReservationViewModels.length,
      separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.spacing2x),
      itemBuilder: (context, i) {
        final viewModelItem = viewModel.favoriteReservationViewModels[i];
        return _UserFavoriteListItem(
          viewModel: viewModelItem,
        );
      },
    );
  }
}

class _UserFavoriteListItem extends StatelessWidget {
  final ReservationRowViewModel viewModel;

  const _UserFavoriteListItem({
    required this.viewModel,
  });

  static const _itemHeight = 105.0;
  static const _imageSize = 60.0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Container(
      height: _itemHeight,
      padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.favoriteTabReservationRowVerticalPadding,
        horizontal: AppDimensions.favoriteTabReservationRowHorizontalPadding,
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
                viewModel.location,
                style: AppTextStyles.body.small,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
