part of '../reservation_page.dart';

class _ReservationView extends StatelessWidget {
  final ReservationCubit cubit;
  final ReservationViewModel viewModel;

  const _ReservationView({
    required this.cubit,
    required this.viewModel,
  });

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
                  cubit: cubit,
                  viewModel: viewModel,
                ),
                _ScheduleSection(
                  cubit: cubit,
                  viewModel: viewModel,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: AppDimensions.reservationHorizontalPadding,
                    right: AppDimensions.reservationHorizontalPadding,
                    bottom: AppDimensions.reserveButtonBottomPadding,
                  ),
                  child: AppButton(
                    onTap: cubit.onReserveTapped,
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
