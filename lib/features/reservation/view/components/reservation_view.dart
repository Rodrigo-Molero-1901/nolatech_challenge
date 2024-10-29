part of '../reservation_page.dart';

class _ReservationView extends StatefulWidget {
  final ReservationCubit cubit;
  final ReservationViewModel viewModel;

  const _ReservationView({
    required this.cubit,
    required this.viewModel,
  });

  @override
  State<_ReservationView> createState() => _ReservationViewState();
}

class _ReservationViewState extends State<_ReservationView> {
  final _instructorController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _InformationSection(
                  cubit: widget.cubit,
                  viewModel: widget.viewModel,
                  instructorController: _instructorController,
                ),
                _ScheduleSection(
                  cubit: widget.cubit,
                  viewModel: widget.viewModel,
                  dateController: _dateController,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: AppDimensions.reservationHorizontalPadding,
                    right: AppDimensions.reservationHorizontalPadding,
                    bottom: AppDimensions.reserveButtonBottomPadding,
                  ),
                  child: AppButton(
                    onTap: () => widget.cubit.onReserveTapped(
                      instructor: _instructorController.text,
                      date: _dateController.text,
                      time: _timeController.text,
                      comment: _commentController.text,
                    ),
                    text: l10n.r_reserve_button,
                    textStyle: AppTextStyles.title.medium.copyWith(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      color: AppContextColors.buttonText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
