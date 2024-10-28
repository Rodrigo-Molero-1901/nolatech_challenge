part of '../reservation_page.dart';

class _InformationSection extends StatelessWidget {
  final ReservationCubit cubit;
  final ReservationViewModel viewModel;

  const _InformationSection({
    required this.cubit,
    required this.viewModel,
  });

  static const _imageHeight = 270.0;
  static const _imageWidth = double.infinity;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppContextColors.background,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            viewModel.imagePath.first,
            height: _imageHeight,
            width: _imageWidth,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const FlutterLogo(),
          ),
          const SizedBox(height: AppSpacing.spacing3x),
          Padding(
            padding: const EdgeInsets.only(
              left: AppDimensions.reservationHorizontalPadding,
            ),
            child: Text(
              viewModel.name,
              style: AppTextStyles.title.medium.copyWith(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.spacing0Dot5x),
          Padding(
            padding: const EdgeInsets.only(
              left: AppDimensions.reservationHorizontalPadding,
            ),
            child: Text(
              l10n.r_reservation_type(viewModel.type),
              style: AppTextStyles.body.small,
            ),
          ),
          const SizedBox(height: AppSpacing.spacing1Dot5x),
          Padding(
            padding: const EdgeInsets.only(
              left: AppDimensions.reservationHorizontalPadding,
            ),
            child: Text(
              'Disponible',
              style: AppTextStyles.body.small,
            ),
          ),
          const SizedBox(height: AppSpacing.spacing1Dot5x),
          Padding(
            padding: const EdgeInsets.only(
              left: AppDimensions.reservationHorizontalPadding,
            ),
            child: Text(
              viewModel.location,
              style: AppTextStyles.body.small,
            ),
          ),
          const SizedBox(height: AppSpacing.spacing3x),
          const SizedBox(height: AppSpacing.spacing3Dot25x)
        ],
      ),
    );
  }
}
