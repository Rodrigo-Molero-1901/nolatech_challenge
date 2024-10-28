part of '../home_page.dart';

class _BottomBar extends StatefulWidget {
  final HomeCubit cubit;

  const _BottomBar({
    required this.cubit,
  });

  @override
  State<_BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<_BottomBar> {
  static const _bottomBarHeight = 64.0;
  static const _homeTabIndex = 0;
  static const _reservationListTabIndex = 1;
  static const _favoriteListTabIndex = 2;

  int _activeIndex = 0;

  void _onItemPressed(int index) {
    if (index == _activeIndex) return;
    setState(() => _activeIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Container(
      height: _bottomBarHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppContextColors.bottomBarBackground,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppDimensions.borderRadius3x),
        ),
        boxShadow: [
          BoxShadow(
            color: AppContextColors.bottomBarBlur,
            offset: const Offset(0, -1),
            blurRadius: 6.0,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.bottomBarVerticalPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BottomBarItem(
            label: l10n.h_bottom_bar_label_1,
            activeIcon: Icons.home_filled,
            inactiveIcon: Icons.home_outlined,
            isActive: _activeIndex == _homeTabIndex,
            onTap: () {
              _onItemPressed(_homeTabIndex);
              widget.cubit.onHomeTabTapped();
            },
          ),
          _BottomBarItem(
            label: l10n.h_bottom_bar_label_2,
            activeIcon: Icons.calendar_month,
            inactiveIcon: Icons.calendar_month_outlined,
            isActive: _activeIndex == _reservationListTabIndex,
            onTap: () {
              _onItemPressed(_reservationListTabIndex);
              widget.cubit.onReservationListTabTapped();
            },
          ),
          _BottomBarItem(
            label: l10n.h_bottom_bar_label_3,
            activeIcon: Icons.favorite,
            inactiveIcon: Icons.favorite_outline,
            isActive: _activeIndex == _favoriteListTabIndex,
            onTap: () {
              _onItemPressed(_favoriteListTabIndex);
              widget.cubit.onFavoriteListTapTapped();
            },
          ),
        ],
      ),
    );
  }
}

class _BottomBarItem extends StatelessWidget {
  final IconData activeIcon;
  final IconData inactiveIcon;
  final String label;
  final bool isActive;
  final Function() onTap;

  const _BottomBarItem({
    required this.activeIcon,
    required this.inactiveIcon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  static const _itemHeight = 50.0;
  static const _itemWidth = 70.0;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.borderRadius3x),
        child: Ink(
          height: _itemHeight,
          width: _itemWidth,
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.bottomBarItemHorizontalPadding,
            vertical: AppDimensions.bottomBarItemVerticalPadding,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(AppDimensions.borderRadius3x),
            ),
            color: isActive
                ? AppContextColors.bottomBarActiveItem
                : AppContextColors.bottomBarInactiveItem,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                isActive ? activeIcon : inactiveIcon,
                color: isActive
                    ? AppContextColors.bottomBarActiveIcon
                    : AppContextColors.bottomBarInactiveIcon,
              ),
              Text(
                label,
                style: AppTextStyles.body.small.copyWith(
                  color: isActive
                      ? AppContextColors.bottomBarActiveText
                      : AppContextColors.defaultText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
