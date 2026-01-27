import 'package:flutter/material.dart';
import 'package:awid_mobile/core/theme/app_colors.dart';
import 'package:awid_mobile/core/theme/app_text_styles.dart';
import 'package:awid_mobile/core/theme/app_dimensions.dart';

/// AppBar personnalisée de l'application
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final PreferredSizeWidget? bottom;
  final bool showBackButton;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.centerTitle = true,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.bottom,
    this.showBackButton = true,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTextStyles.h5.copyWith(
          color: foregroundColor ?? AppColors.textWhite,
        ),
      ),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor ?? AppColors.primary,
      foregroundColor: foregroundColor ?? AppColors.textWhite,
      elevation: elevation ?? AppDimensions.appBarElevation,
      leading: leading ??
          (showBackButton && Navigator.of(context).canPop()
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
                )
              : null),
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        AppDimensions.appBarHeight + (bottom?.preferredSize.height ?? 0),
      );
}

/// AppBar avec gradient
class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;
  final Gradient gradient;
  final Color? foregroundColor;
  final double? elevation;
  final PreferredSizeWidget? bottom;
  final bool showBackButton;
  final VoidCallback? onBackPressed;

  const GradientAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.centerTitle = true,
    this.gradient = AppColors.primaryGradient,
    this.foregroundColor,
    this.elevation,
    this.bottom,
    this.showBackButton = true,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
      ),
      child: AppBar(
        title: Text(
          title,
          style: AppTextStyles.h5.copyWith(
            color: foregroundColor ?? AppColors.textWhite,
          ),
        ),
        centerTitle: centerTitle,
        backgroundColor: Colors.transparent,
        foregroundColor: foregroundColor ?? AppColors.textWhite,
        elevation: elevation ?? 0,
        leading: leading ??
            (showBackButton && Navigator.of(context).canPop()
                ? IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed:
                        onBackPressed ?? () => Navigator.of(context).pop(),
                  )
                : null),
        actions: actions,
        bottom: bottom,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        AppDimensions.appBarHeight + (bottom?.preferredSize.height ?? 0),
      );
}

/// AppBar avec recherche
class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final String searchHint;
  final ValueChanged<String>? onSearchChanged;
  final VoidCallback? onSearchSubmitted;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const SearchAppBar({
    super.key,
    required this.title,
    this.searchHint = 'Rechercher...',
    this.onSearchChanged,
    this.onSearchSubmitted,
    this.actions,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(AppDimensions.appBarHeight);
}

class _SearchAppBarState extends State<SearchAppBar> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _startSearch() {
    setState(() => _isSearching = true);
  }

  void _stopSearch() {
    setState(() {
      _isSearching = false;
      _searchController.clear();
    });
    widget.onSearchChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _isSearching
          ? TextField(
              controller: _searchController,
              autofocus: true,
              style: TextStyle(
                color: widget.foregroundColor ?? AppColors.textWhite,
              ),
              decoration: InputDecoration(
                hintText: widget.searchHint,
                hintStyle: TextStyle(
                  color: (widget.foregroundColor ?? AppColors.textWhite)
                      .withOpacity(0.7),
                ),
                border: InputBorder.none,
              ),
              onChanged: widget.onSearchChanged,
              onSubmitted: (_) => widget.onSearchSubmitted?.call(),
            )
          : Text(
              widget.title,
              style: AppTextStyles.h5.copyWith(
                color: widget.foregroundColor ?? AppColors.textWhite,
              ),
            ),
      backgroundColor: widget.backgroundColor ?? AppColors.primary,
      foregroundColor: widget.foregroundColor ?? AppColors.textWhite,
      actions: [
        if (_isSearching)
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: _stopSearch,
          )
        else
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _startSearch,
          ),
        ...?widget.actions,
      ],
    );
  }
}

/// AppBar avec tabs
class TabAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> tabs;
  final TabController? controller;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? indicatorColor;

  const TabAppBar({
    super.key,
    required this.title,
    required this.tabs,
    this.controller,
    this.actions,
    this.backgroundColor,
    this.foregroundColor,
    this.indicatorColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTextStyles.h5.copyWith(
          color: foregroundColor ?? AppColors.textWhite,
        ),
      ),
      backgroundColor: backgroundColor ?? AppColors.primary,
      foregroundColor: foregroundColor ?? AppColors.textWhite,
      actions: actions,
      bottom: TabBar(
        controller: controller,
        tabs: tabs,
        indicatorColor: indicatorColor ?? AppColors.textWhite,
        labelColor: foregroundColor ?? AppColors.textWhite,
        unselectedLabelColor:
            (foregroundColor ?? AppColors.textWhite).withOpacity(0.7),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(
        AppDimensions.appBarHeight + kToolbarHeight,
      );
}

/// AppBar transparente (pour scroll)
class TransparentAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;
  final Color? foregroundColor;

  const TransparentAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.centerTitle = true,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTextStyles.h5.copyWith(
          color: foregroundColor ?? AppColors.textWhite,
        ),
      ),
      centerTitle: centerTitle,
      backgroundColor: Colors.transparent,
      foregroundColor: foregroundColor ?? AppColors.textWhite,
      elevation: 0,
      leading: leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppDimensions.appBarHeight);
}

/// AppBar avec badge de notification
class NotificationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final int notificationCount;
  final VoidCallback? onNotificationPressed;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const NotificationAppBar({
    super.key,
    required this.title,
    this.notificationCount = 0,
    this.onNotificationPressed,
    this.actions,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTextStyles.h5.copyWith(
          color: foregroundColor ?? AppColors.textWhite,
        ),
      ),
      backgroundColor: backgroundColor ?? AppColors.primary,
      foregroundColor: foregroundColor ?? AppColors.textWhite,
      actions: [
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: onNotificationPressed,
            ),
            if (notificationCount > 0)
              Positioned(
                right: 8,
                top: 8,
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
                    notificationCount > 99 ? '99+' : '$notificationCount',
                    style: AppTextStyles.badge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
        ...?actions,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppDimensions.appBarHeight);
}
