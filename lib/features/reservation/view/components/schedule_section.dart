part of '../reservation_page.dart';

class _ScheduleSection extends StatefulWidget {
  final ReservationCubit cubit;
  final ReservationViewModel viewModel;
  final TextEditingController dateController;
  final TextEditingController timeController;
  final TextEditingController commentController;

  const _ScheduleSection({
    required this.cubit,
    required this.viewModel,
    required this.dateController,
    required this.timeController,
    required this.commentController,
  });

  @override
  State<_ScheduleSection> createState() => _ScheduleSectionState();
}

class _ScheduleSectionState extends State<_ScheduleSection> {
  static const _commentFormHeight = 112.0;

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (date != null) {
      setState(() {
        widget.dateController.text = '${date.day}/${date.month}/${date.year}';
      });
    }
  }

  Future<void> _pickTimeRange() async {
    final startTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (startTime != null && mounted) {
      final minimumEndTime = TimeOfDay(
        hour: (startTime.hour + 1) % 24,
        minute: startTime.minute,
      );

      final endTime = await showTimePicker(
        context: context,
        initialTime: minimumEndTime,
      );

      if (endTime != null) {
        setState(() {
          widget.timeController.text =
              '${startTime.format(context)} - ${endTime.format(context)}';
        });
      }
    }
  }

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
          _FieldCard(
            child: InkWell(
              onTap: _pickDate,
              child: IgnorePointer(
                child: _ScheduleForm(
                  controller: widget.dateController,
                  hintText: l10n.r_reservation_date_label,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.spacing2Dot5x),
          _FieldCard(
            child: InkWell(
              onTap: _pickTimeRange,
              child: IgnorePointer(
                child: _ScheduleForm(
                  controller: widget.timeController,
                  hintText: l10n.r_reservation_time_label,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.spacing3x),
          Text(
            l10n.r_reservation_add_comment_subtitle,
            style: AppTextStyles.title.medium.copyWith(fontSize: 18.0),
          ),
          const SizedBox(height: AppSpacing.spacing2x),
          _FieldCard(
            height: _commentFormHeight,
            child: _ScheduleForm(
              controller: widget.commentController,
              hintText: l10n.r_reservation_add_comment_hint,
              hintTextColor: AppContextColors.reservationCommentText,
            ),
          ),
          const SizedBox(height: AppSpacing.spacing5x),
        ],
      ),
    );
  }
}
