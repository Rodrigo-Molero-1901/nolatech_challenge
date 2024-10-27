part of '../home_page.dart';

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return const AppDivider(
      width: double.infinity,
      color: AppContextColors.homeDivider,
      padding: EdgeInsets.only(
        bottom: AppDimensions.homeDividerBottomPadding,
      ),
    );
  }
}
