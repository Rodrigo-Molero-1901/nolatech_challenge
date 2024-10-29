part of '../favorite_list_tab_page.dart';

class _FavoriteListTabView extends StatelessWidget {
  final FavoriteListTabCubit cubit;
  final FavoriteListTabViewModel viewModel;

  const _FavoriteListTabView({
    required this.cubit,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.favoriteTabHorizontalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.spacing5x),
          Text(
            l10n.h_my_favorite_reservations,
            style: AppTextStyles.title.medium.copyWith(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: AppSpacing.spacing2x),
          _UserFavoriteList(
            viewModel: viewModel,
          ),
          const SizedBox(height: AppSpacing.spacing3x),
        ],
      ),
    );
  }
}
