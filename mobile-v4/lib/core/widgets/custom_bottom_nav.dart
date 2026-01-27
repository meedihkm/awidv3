import 'package:flutter/material.dart';
import 'package:awid_mobile/core/theme/app_colors.dart';
import 'package:awid_mobile/core/theme/app_text_styles.dart';
import 'package:awid_mobile/core/theme/app_dimensions.dart';

/// Bottom navigation personnalisée
class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomNavItem> items;
  final Color? backgroundColor;
  final Color? selectedColor;
  final Color? unselectedColor;
  final double? elevation;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    this.backgroundColor,
    this.selectedColor,
    this.unselectedColor,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowMedium,
            blurRadius: elevation ?? AppDimensions.bottomNavElevation,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: AppDimensions.bottomNavHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              items.length,
              (index) => _BottomNavItemWidget(
                item: items[index],
                isSelected: currentIndex == index,
                onTap: () => onTap(index),
                selectedColor: selectedColor ?? AppColors.primary,
                unselectedColor: unselectedColor ?? AppColors.textSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomNavItemWidget extends StatelessWidget {
  final BottomNavItem item;
  final bool isSelected;
  final VoidCallback onTap;
  final Color selectedColor;
  final Color unselectedColor;

  const _BottomNavItemWidget({
    required this.item,
    required this.isSelected,
    required this.onTap,
    required this.selectedColor,
    required this.unselectedColor,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? selectedColor : unselectedColor;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  isSelected ? item.activeIcon : item.icon,
                  color: color,
                  size: AppDimensions.iconMd,
                ),
                if (item.badge != null && item.badge! > 0)
                  Positioned(
                    right: -8,
                    top: -4,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: AppColors.error,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        item.badge! > 99 ? '99+' : '${item.badge}',
                        style: AppTextStyles.badge.copyWith(fontSize: 8),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              item.label,
              style: AppTextStyles.labelSmall.copyWith(
                color: color,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

/// Item de navigation
class BottomNavItem {
  final IconData icon;
  final IconData? activeIcon;
  final String label;
  final int? badge;

  BottomNavItem({
    required this.icon,
    IconData? activeIcon,
    required this.label,
    this.badge,
  }) : activeIcon = activeIcon ?? icon;
}

/// Bottom navigation avec animation
class AnimatedBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomNavItem> items;
  final Color? backgroundColor;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Duration animationDuration;

  const AnimatedBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    this.backgroundColor,
    this.selectedColor,
    this.unselectedColor,
    this.animationDuration = const Duration(milliseconds: 300),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.surface,
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowMedium,
            blurRadius: AppDimensions.bottomNavElevation,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: AppDimensions.bottomNavHeight,
          child: Stack(
            children: [
              // Indicateur animé
              AnimatedPositioned(
                duration: animationDuration,
                curve: Curves.easeInOut,
                left: (MediaQuery.of(context).size.width / items.length) *
                    currentIndex,
                top: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width / items.length,
                  height: 3,
                  color: selectedColor ?? AppColors.primary,
                ),
              ),
              // Items
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  items.length,
                  (index) => _AnimatedBottomNavItemWidget(
                    item: items[index],
                    isSelected: currentIndex == index,
                    onTap: () => onTap(index),
                    selectedColor: selectedColor ?? AppColors.primary,
                    unselectedColor: unselectedColor ?? AppColors.textSecondary,
                    animationDuration: animationDuration,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnimatedBottomNavItemWidget extends StatelessWidget {
  final BottomNavItem item;
  final bool isSelected;
  final VoidCallback onTap;
  final Color selectedColor;
  final Color unselectedColor;
  final Duration animationDuration;

  const _AnimatedBottomNavItemWidget({
    required this.item,
    required this.isSelected,
    required this.onTap,
    required this.selectedColor,
    required this.unselectedColor,
    required this.animationDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: AnimatedContainer(
          duration: animationDuration,
          curve: Curves.easeInOut,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  AnimatedScale(
                    scale: isSelected ? 1.1 : 1.0,
                    duration: animationDuration,
                    child: Icon(
                      isSelected ? item.activeIcon : item.icon,
                      color: isSelected ? selectedColor : unselectedColor,
                      size: AppDimensions.iconMd,
                    ),
                  ),
                  if (item.badge != null && item.badge! > 0)
                    Positioned(
                      right: -8,
                      top: -4,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: AppColors.error,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          item.badge! > 99 ? '99+' : '${item.badge}',
                          style: AppTextStyles.badge.copyWith(fontSize: 8),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 4),
              AnimatedDefaultTextStyle(
                duration: animationDuration,
                style: AppTextStyles.labelSmall.copyWith(
                  color: isSelected ? selectedColor : unselectedColor,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
                child: Text(
                  item.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Bottom navigation avec FAB
class BottomNavWithFAB extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomNavItem> items;
  final VoidCallback onFabPressed;
  final IconData fabIcon;
  final Color? backgroundColor;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? fabColor;

  const BottomNavWithFAB({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    required this.onFabPressed,
    this.fabIcon = Icons.add,
    this.backgroundColor,
    this.selectedColor,
    this.unselectedColor,
    this.fabColor,
  });

  @override
  Widget build(BuildContext context) {
    // Diviser les items en deux groupes
    final leftItems = items.sublist(0, items.length ~/ 2);
    final rightItems = items.sublist(items.length ~/ 2);

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.surface,
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowMedium,
            blurRadius: AppDimensions.bottomNavElevation,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: AppDimensions.bottomNavHeight,
          child: Row(
            children: [
              // Items de gauche
              ...leftItems.asMap().entries.map((entry) {
                return _BottomNavItemWidget(
                  item: entry.value,
                  isSelected: currentIndex == entry.key,
                  onTap: () => onTap(entry.key),
                  selectedColor: selectedColor ?? AppColors.primary,
                  unselectedColor: unselectedColor ?? AppColors.textSecondary,
                );
              }),
              // FAB
              Expanded(
                child: Center(
                  child: FloatingActionButton(
                    onPressed: onFabPressed,
                    backgroundColor: fabColor ?? AppColors.primary,
                    child: Icon(fabIcon, color: AppColors.textWhite),
                  ),
                ),
              ),
              // Items de droite
              ...rightItems.asMap().entries.map((entry) {
                final index = leftItems.length + entry.key;
                return _BottomNavItemWidget(
                  item: entry.value,
                  isSelected: currentIndex == index,
                  onTap: () => onTap(index),
                  selectedColor: selectedColor ?? AppColors.primary,
                  unselectedColor: unselectedColor ?? AppColors.textSecondary,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
