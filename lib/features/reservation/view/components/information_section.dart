part of '../reservation_page.dart';

class _InformationSection extends StatefulWidget {
  final ReservationCubit cubit;
  final ReservationViewModel viewModel;

  const _InformationSection({
    required this.cubit,
    required this.viewModel,
  });

  @override
  State<_InformationSection> createState() => _InformationSectionState();
}

class _InformationSectionState extends State<_InformationSection> {
  late bool _isFavorite;

  static const _imageHeight = 270.0;
  static const _arrowBackPos = 30.0;
  static const _heartPos = 30.0;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.viewModel.isFavorite;
  }

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
          SizedBox(
            height: _imageHeight,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    widget.viewModel.imagePath.first,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const FlutterLogo(),
                  ),
                ),
                Positioned(
                  top: _arrowBackPos,
                  left: AppDimensions.horizontalPadding,
                  child: InkWell(
                    onTap: context.pop,
                    child: Assets.icons.customArrowBack.svg(),
                  ),
                ),
                Positioned(
                  top: _heartPos,
                  right: AppDimensions.horizontalPadding,
                  child: IconButton(
                    icon: Icon(
                      _isFavorite ? Icons.favorite : Icons.favorite_outline,
                    ),
                    onPressed: () {
                      setState(() => _isFavorite = !_isFavorite);
                      widget.cubit.onFavoriteTapped();
                    },
                    color: _isFavorite
                        ? AppContextColors.reservationFavoriteActive
                        : AppContextColors.reservationFavoriteInactive,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.spacing3x),
          Padding(
            padding: const EdgeInsets.only(
              left: AppDimensions.reservationHorizontalPadding,
            ),
            child: Text(
              widget.viewModel.name,
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
              l10n.r_reservation_type(widget.viewModel.type),
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
              widget.viewModel.location,
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
