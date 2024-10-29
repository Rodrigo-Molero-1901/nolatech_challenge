part of '../reservation_page.dart';

class _FieldCard extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;

  const _FieldCard({
    this.height = _defaultHeight,
    this.width = _defaultWidth,
    required this.child,
  });

  static const _defaultHeight = 53.0;
  static const _defaultWidth = double.infinity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.reservationFieldPadding,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDimensions.borderRadius2x),
        ),
        border: Border.all(
          color: AppContextColors.reservationScheduleBorder,
        ),
        color: AppContextColors.reservationScheduleColor,
      ),
      child: child,
    );
  }
}
