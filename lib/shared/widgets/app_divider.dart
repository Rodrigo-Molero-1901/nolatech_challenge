part of 'app_widgets.dart';

class AppDivider extends StatelessWidget {
  final double width;
  final Color color;
  final EdgeInsets? padding;

  const AppDivider({
    super.key,
    this.width = _dividerDefaultWidth,
    this.color = _dividerColor,
    this.padding,
  });

  static const _dividerDefaultWidth = 80.0;
  static const _dividerColor = AppContextColors.divider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: padding ??
            const EdgeInsets.only(
              top: AppDimensions.dividerVerticalPadding,
            ),
        child: Divider(
          height: 0.0,
          indent: 0.0,
          thickness: 1.0,
          color: color,
        ),
      ),
    );
  }
}

class AppVerticalDivider extends StatelessWidget {
  final double height;
  final Color color;

  const AppVerticalDivider({
    super.key,
    this.height = _dividerDefaultHeight,
    this.color = _dividerColor,
  });

  static const _dividerDefaultHeight = 16.0;
  static const _dividerColor = AppContextColors.verticalDivider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: VerticalDivider(
        width: 0.0,
        indent: 0.0,
        thickness: 1.0,
        color: color,
      ),
    );
  }
}
