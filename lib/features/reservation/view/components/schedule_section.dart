part of '../reservation_page.dart';

class _ScheduleSection extends StatefulWidget {
  final ReservationCubit cubit;
  final ReservationViewModel viewModel;

  const _ScheduleSection({
    required this.cubit,
    required this.viewModel,
  });

  @override
  State<_ScheduleSection> createState() => _ScheduleSectionState();
}

class _ScheduleSectionState extends State<_ScheduleSection> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.reservationHorizontalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.spacing3Dot25x),
          Text(
            l10n.r_reservation_set_date_time_subtitle,
            style: AppTextStyles.title.medium.copyWith(fontSize: 18.0),
          ),
          const SizedBox(height: AppSpacing.spacing2Dot5x),
          // Form1
          const SizedBox(height: AppSpacing.spacing2Dot5x),
          // Form2
          const SizedBox(height: AppSpacing.spacing3x),
          Text(
            l10n.r_reservation_add_comment_subtitle,
            style: AppTextStyles.title.medium.copyWith(fontSize: 18.0),
          ),
          const SizedBox(height: AppSpacing.spacing2x),
          // Form3
          const SizedBox(height: AppSpacing.spacing5x),
        ],
      ),
    );
  }
}
