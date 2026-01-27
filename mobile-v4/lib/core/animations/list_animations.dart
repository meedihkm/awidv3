import 'package:flutter/material.dart';

/// Animations pour listes avec effet stagger

/// Liste animée avec effet stagger (apparition progressive)
class StaggeredListView extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Duration delay;
  final Duration duration;
  final Curve curve;
  final ScrollController? controller;
  final EdgeInsets? padding;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  const StaggeredListView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.delay = const Duration(milliseconds: 50),
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeOut,
    this.controller,
    this.padding,
    this.shrinkWrap = false,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      padding: padding,
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return AnimatedListItem(
          index: index,
          delay: delay,
          duration: duration,
          curve: curve,
          child: itemBuilder(context, index),
        );
      },
    );
  }
}

/// Item de liste animé
class AnimatedListItem extends StatefulWidget {
  final int index;
  final Duration delay;
  final Duration duration;
  final Curve curve;
  final Widget child;

  const AnimatedListItem({
    super.key,
    required this.index,
    required this.delay,
    required this.duration,
    required this.curve,
    required this.child,
  });

  @override
  State<AnimatedListItem> createState() => _AnimatedListItemState();
}

class _AnimatedListItemState extends State<AnimatedListItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: widget.curve),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: widget.curve),
    );

    // Démarrer l'animation avec délai
    Future.delayed(widget.delay * widget.index, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: widget.child,
      ),
    );
  }
}

/// Liste avec animation de suppression
class AnimatedDismissibleList<T> extends StatefulWidget {
  final List<T> items;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final Future<bool> Function(T item)? onDismissed;
  final Color dismissBackground;
  final IconData dismissIcon;
  final String dismissLabel;
  final EdgeInsets? padding;

  const AnimatedDismissibleList({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.onDismissed,
    this.dismissBackground = Colors.red,
    this.dismissIcon = Icons.delete,
    this.dismissLabel = 'Supprimer',
    this.padding,
  });

  @override
  State<AnimatedDismissibleList<T>> createState() =>
      _AnimatedDismissibleListState<T>();
}

class _AnimatedDismissibleListState<T>
    extends State<AnimatedDismissibleList<T>> {
  late List<T> _items;

  @override
  void initState() {
    super.initState();
    _items = List.from(widget.items);
  }

  @override
  void didUpdateWidget(AnimatedDismissibleList<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.items != oldWidget.items) {
      _items = List.from(widget.items);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: widget.padding,
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final item = _items[index];
        return Dismissible(
          key: ValueKey(item),
          background: Container(
            color: widget.dismissBackground,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.dismissIcon,
                  color: Colors.white,
                ),
                const SizedBox(height: 4),
                Text(
                  widget.dismissLabel,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          direction: DismissDirection.endToStart,
          confirmDismiss: (direction) async {
            if (widget.onDismissed != null) {
              return await widget.onDismissed!(item);
            }
            return true;
          },
          onDismissed: (direction) {
            setState(() {
              _items.removeAt(index);
            });
          },
          child: widget.itemBuilder(context, item, index),
        );
      },
    );
  }
}

/// Liste avec animation de réorganisation
class ReorderableAnimatedList<T> extends StatefulWidget {
  final List<T> items;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final void Function(int oldIndex, int newIndex)? onReorder;
  final EdgeInsets? padding;

  const ReorderableAnimatedList({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.onReorder,
    this.padding,
  });

  @override
  State<ReorderableAnimatedList<T>> createState() =>
      _ReorderableAnimatedListState<T>();
}

class _ReorderableAnimatedListState<T>
    extends State<ReorderableAnimatedList<T>> {
  late List<T> _items;

  @override
  void initState() {
    super.initState();
    _items = List.from(widget.items);
  }

  @override
  void didUpdateWidget(ReorderableAnimatedList<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.items != oldWidget.items) {
      _items = List.from(widget.items);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      padding: widget.padding,
      itemCount: _items.length,
      onReorder: (oldIndex, newIndex) {
        setState(() {
          if (newIndex > oldIndex) {
            newIndex -= 1;
          }
          final item = _items.removeAt(oldIndex);
          _items.insert(newIndex, item);
        });
        widget.onReorder?.call(oldIndex, newIndex);
      },
      itemBuilder: (context, index) {
        final item = _items[index];
        return Container(
          key: ValueKey(item),
          child: widget.itemBuilder(context, item, index),
        );
      },
    );
  }
}

/// Animation de slide pour insertion/suppression
class SlideInListItem extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final SlideDirection direction;

  const SlideInListItem({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeOut,
    this.direction = SlideDirection.left,
  });

  @override
  State<SlideInListItem> createState() => _SlideInListItemState();
}

class _SlideInListItemState extends State<SlideInListItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    final begin = _getBeginOffset(widget.direction);
    _slideAnimation = Tween<Offset>(
      begin: begin,
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: widget.curve),
    );

    _controller.forward();
  }

  Offset _getBeginOffset(SlideDirection direction) {
    switch (direction) {
      case SlideDirection.left:
        return const Offset(-1, 0);
      case SlideDirection.right:
        return const Offset(1, 0);
      case SlideDirection.up:
        return const Offset(0, -1);
      case SlideDirection.down:
        return const Offset(0, 1);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: widget.child,
    );
  }
}

enum SlideDirection { left, right, up, down }

/// Animation de scale pour insertion
class ScaleInListItem extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;

  const ScaleInListItem({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeOut,
  });

  @override
  State<ScaleInListItem> createState() => _ScaleInListItemState();
}

class _ScaleInListItemState extends State<ScaleInListItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: widget.curve),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: widget.child,
    );
  }
}

/// Liste avec effet de parallaxe
class ParallaxListView extends StatefulWidget {
  final int itemCount;
  final Widget Function(BuildContext context, int index, double parallaxOffset)
      itemBuilder;
  final double parallaxFactor;
  final ScrollController? controller;
  final EdgeInsets? padding;

  const ParallaxListView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.parallaxFactor = 0.3,
    this.controller,
    this.padding,
  });

  @override
  State<ParallaxListView> createState() => _ParallaxListViewState();
}

class _ParallaxListViewState extends State<ParallaxListView> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? ScrollController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _controller,
      padding: widget.padding,
      itemCount: widget.itemCount,
      itemBuilder: (context, index) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final offset = _controller.hasClients
                ? _controller.offset * widget.parallaxFactor
                : 0.0;
            return widget.itemBuilder(context, index, offset);
          },
        );
      },
    );
  }
}
