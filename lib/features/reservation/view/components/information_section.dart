part of '../reservation_page.dart';

class _InformationSection extends StatefulWidget {
  final ReservationCubit cubit;
  final ReservationViewModel viewModel;
  final TextEditingController instructorController;

  const _InformationSection({
    required this.cubit,
    required this.viewModel,
    required this.instructorController,
  });

  @override
  State<_InformationSection> createState() => _InformationSectionState();
}

class _InformationSectionState extends State<_InformationSection> {
  late bool _isFavorite;
  late String _selectedInstructor;

  static const _imageHeight = 270.0;
  static const _arrowBackPos = 30.0;
  static const _heartPos = 30.0;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.viewModel.isFavorite;
    _selectedInstructor = instructorMockList.first;
    widget.instructorController.text = _selectedInstructor;
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
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.reservationHorizontalPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.viewModel.name,
                      style: AppTextStyles.title.medium.copyWith(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.spacing0Dot5x),
                    Text(
                      l10n.r_reservation_type(widget.viewModel.type),
                      style: AppTextStyles.body.small,
                    ),
                    const SizedBox(height: AppSpacing.spacing1Dot5x),
                    Text(
                      'Disponible',
                      style: AppTextStyles.body.small,
                    ),
                    const SizedBox(height: AppSpacing.spacing1Dot5x),
                    Row(
                      children: [
                        Assets.icons.location.svg(),
                        const SizedBox(width: AppSpacing.spacing0Dot5x),
                        Text(
                          widget.viewModel.location,
                          style: AppTextStyles.body.small,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.viewModel.price,
                      style: AppTextStyles.title.medium.copyWith(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        color: AppContextColors.reservationPriceText,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.spacing0Dot5x),
                    Text(
                      l10n.r_reservation_hour_cost,
                      style: AppTextStyles.body.small.copyWith(
                        color: AppContextColors.reservationPriceHourCost,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.spacing3x),
          Container(
            margin: const EdgeInsets.only(
              left: AppDimensions.reservationHorizontalPadding,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: AppDimensions.reservationSelectorVerticalPadding,
              horizontal: AppDimensions.reservationSelectorHorizontalPadding,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(AppDimensions.borderRadius1x),
              ),
              border: Border.all(
                color: AppContextColors.reservationSelectorBorder,
              ),
            ),
            child: DropdownButton<String>(
              value: _selectedInstructor,
              padding: EdgeInsets.zero,
              isDense: true,
              underline: const SizedBox.shrink(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedInstructor = newValue ?? '';
                  widget.instructorController.text = _selectedInstructor;
                });
              },
              items: instructorMockList.map((String instructor) {
                return DropdownMenuItem<String>(
                  value: instructor,
                  child: Text(
                    instructor,
                    style: AppTextStyles.body.medium,
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: AppSpacing.spacing3Dot25x)
        ],
      ),
    );
  }
}
