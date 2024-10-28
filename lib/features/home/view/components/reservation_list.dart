part of '../home_page.dart';

class _ReservationList extends StatelessWidget {
  final HomeCubit cubit;
  final HomeViewModel viewModel;

  const _ReservationList({
    required this.cubit,
    required this.viewModel,
  });

  static const _listHeight = 337.0;

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
            l10n.h_reservations_section,
            style: AppTextStyles.title.medium.copyWith(fontSize: 18.0),
          ),
        ),
        const SizedBox(height: AppSpacing.spacing2x),
        SizedBox(
          height: _listHeight,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.homeHorizontalPadding,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: viewModel.carouselReservationViewModels.length,
            separatorBuilder: (_, __) =>
                const SizedBox(width: AppSpacing.spacing2Dot5x),
            itemBuilder: (context, index) {
              final viewModelItem =
                  viewModel.carouselReservationViewModels[index];
              return _ReservationListItem(
                onTap: () => cubit.onReservationTapped(pos: index),
                viewModel: viewModelItem,
              );
            },
          ),
        ),
        const SizedBox(height: AppSpacing.spacing2Dot5x),
      ],
    );
  }
}

class _ReservationListItem extends StatelessWidget {
  final Function() onTap;
  final CarouselReservationViewModel viewModel;

  const _ReservationListItem({
    required this.onTap,
    required this.viewModel,
  });

  static const _itemWidth = 245.0;
  static const _imageHeight = 135.0;
  static const _imageWidth = 245.0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Container(
      width: _itemWidth,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDimensions.borderRadius3x),
        ),
        border: Border.all(color: AppContextColors.carouselReservationBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(AppDimensions.borderRadius3x),
            ),
            child: Image.asset(
              viewModel.imagePath.first,
              height: _imageHeight,
              width: _imageWidth,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const FlutterLogo(),
            ),
          ),
          const SizedBox(height: AppSpacing.spacing1Dot5x),
          Padding(
            padding: const EdgeInsets.only(
              left: AppDimensions.carouselReservationHorizontalPadding,
            ),
            child: Text(
              viewModel.name,
              style: AppTextStyles.title.medium.copyWith(fontSize: 18.0),
            ),
          ),
          const SizedBox(height: AppSpacing.spacing0Dot5x),
          Padding(
            padding: const EdgeInsets.only(
              left: AppDimensions.carouselReservationHorizontalPadding,
            ),
            child: Text(
              l10n.h_carousel_reservation_type(viewModel.type),
              style: AppTextStyles.body.small,
            ),
          ),
          const SizedBox(height: AppSpacing.spacing1Dot5x),
          Padding(
            padding: const EdgeInsets.only(
              left: AppDimensions.carouselReservationHorizontalPadding,
            ),
            child: Text(
              '26 de octubre 2025',
              style: AppTextStyles.body.small,
            ),
          ),
          const SizedBox(height: AppSpacing.spacing1Dot5x),
          Padding(
            padding: const EdgeInsets.only(
              left: AppDimensions.carouselReservationHorizontalPadding,
            ),
            child: Text(
              'Disponible',
              style: AppTextStyles.body.small,
            ),
          ),
          const SizedBox(height: AppSpacing.spacing5x),
          Center(
            child: AppButton(
              onTap: onTap,
              height: AppDimensions.carouselReservationButtonHeight,
              width: AppDimensions.carouselReservationButtonWidth,
              text: l10n.h_reservations_button,
              textStyle: AppTextStyles.body.medium.copyWith(
                color: AppContextColors.buttonText,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.spacing1Dot5x),
        ],
      ),
    );
  }
}
