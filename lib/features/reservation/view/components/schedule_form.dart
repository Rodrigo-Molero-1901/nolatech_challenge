part of '../reservation_page.dart';

class _ScheduleForm extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Color? hintTextColor;

  const _ScheduleForm({
    required this.controller,
    this.hintText,
    this.hintTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: AppTextStyles.body.medium,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.body.medium.copyWith(
          color: hintTextColor,
        ),
        border: InputBorder.none,
      ),
      maxLines: null,
    );
  }
}
