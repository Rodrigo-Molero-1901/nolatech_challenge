part of '../home_tab_page.dart';

class _Header extends StatelessWidget {
  const _Header();

  static const _headerHeight = 64.0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Container(
      height: _headerHeight,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.homeHorizontalPadding,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: AppContextColors.homeHeaderGradient,
        ),
      ),
      child: Row(
        children: [
          Text(
            l10n.h_header_title_1,
            style: AppTextStyles.title.large.copyWith(
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
              color: AppContextColors.homeHeaderText,
            ),
          ),
          const SizedBox(width: AppSpacing.spacing0Dot5x),
          DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: AppContextColors.homeHeaderGradient2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.homeHeaderTitleHorizontalPadding,
              ),
              child: Text(
                l10n.h_header_title_2,
                style: AppTextStyles.title.large.copyWith(
                  fontSize: 18.0,
                  color: AppContextColors.homeHeaderText,
                ),
              ),
            ),
          ),
          const Spacer(),
          Assets.icons.notification.svg(),
          const SizedBox(width: AppSpacing.spacing2x),
          Assets.icons.menu.svg(),
        ],
      ),
    );
  }
}
