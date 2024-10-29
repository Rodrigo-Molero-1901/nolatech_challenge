part of '../reservation_list_tab_page.dart';

class _ReservationListTabView extends StatelessWidget {
  final ReservationListTabCubit cubit;
  final ReservationListTabViewModel viewModel;

  const _ReservationListTabView({
    required this.cubit,
    required this.viewModel,
  });

  static const _iconSize = 24.0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.reservationTabHorizontalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.spacing5x),
          AppButton(
            onTap: () {},
            icon: Assets.icons.calendar.svg(
              height: _iconSize,
              width: _iconSize,
              colorFilter: const ColorFilter.mode(
                AppContextColors.reservationTabIcon,
                BlendMode.srcIn,
              ),
            ),
            text: l10n.h_schedule_reservation_button,
          ),
          const SizedBox(height: AppSpacing.spacing4x),
          Text(
            l10n.h_my_reservations,
            style: AppTextStyles.title.medium.copyWith(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: AppSpacing.spacing2x),
          _UserReservationList(
            cubit: cubit,
            viewModel: viewModel,
          ),
          const SizedBox(height: AppSpacing.spacing3x),
        ],
      ),
    );
  }
}
