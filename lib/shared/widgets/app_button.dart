part of 'app_widgets.dart';

class AppButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final double height;
  final double width;
  final Color color;
  final TextStyle? textStyle;

  const AppButton({
    super.key,
    required this.onTap,
    required this.text,
    this.height = _defaultHeight,
    this.width = _defaultWidth,
    this.color = AppContextColors.primaryButton,
    this.textStyle,
  });

  static const _defaultHeight = 53.0;
  static const _defaultWidth = double.infinity;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.borderRadius2x),
        child: Ink(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.borderRadius2x),
            color: color,
          ),
          child: Center(
            child: Text(
              text,
              style: textStyle ??
                  AppTextStyles.title.large.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppContextColors.buttonText,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
