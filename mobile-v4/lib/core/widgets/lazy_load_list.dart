import 'package:flutter/material.dart';

/// Widget de liste avec lazy loading
class LazyLoadList<T> extends StatefulWidget {
  final Future<List<T>> Function(int page, int pageSize) onLoadMore;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final Widget? separator;
  final Widget? loadingWidget;
  final Widget? emptyWidget;
  final Widget? errorWidget;
  final int pageSize;
  final double loadMoreThreshold;
  final ScrollController? scrollController;
  final EdgeInsets? padding;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  const LazyLoadList({
    super.key,
    required this.onLoadMore,
    required this.itemBuilder,
    this.separator,
    this.loadingWidget,
    this.emptyWidget,
    this.errorWidget,
    this.pageSize = 20,
    this.loadMoreThreshold = 200,
    this.scrollController,
    this.padding,
    this.shrinkWrap = false,
    this.physics,
  });

  @override
  State<LazyLoadList<T>> createState() => _LazyLoadListState<T>();
}

class _LazyLoadListState<T> extends State<LazyLoadList<T>> {
  final List<T> _items = [];
  late ScrollController _scrollController;
  
  int _currentPage = 0;
  bool _isLoading = false;
  bool _hasMore = true;
  String? _error;
  bool _isInitialLoad = true;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
    _scrollController.addListener(_onScroll);
    _loadMore();
  }

  @override
  void dispose() {
    if (widget.scrollController == null) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  void _onScroll() {
    if (_isLoading || !_hasMore) return;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (maxScroll - currentScroll <= widget.loadMoreThreshold) {
      _loadMore();
    }
  }

  Future<void> _loadMore() async {
    if (_isLoading || !_hasMore) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final newItems = await widget.onLoadMore(_currentPage, widget.pageSize);

      if (mounted) {
        setState(() {
          _items.addAll(newItems);
          _currentPage++;
          _hasMore = newItems.length >= widget.pageSize;
          _isLoading = false;
          _isInitialLoad = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
          _isInitialLoad = false;
        });
      }
    }
  }

  Future<void> _refresh() async {
    setState(() {
      _items.clear();
      _currentPage = 0;
      _hasMore = true;
      _error = null;
      _isInitialLoad = true;
    });
    await _loadMore();
  }

  @override
  Widget build(BuildContext context) {
    // Initial loading
    if (_isInitialLoad && _isLoading) {
      return widget.loadingWidget ??
          const Center(
            child: CircularProgressIndicator(),
          );
    }

    // Error state
    if (_error != null && _items.isEmpty) {
      return widget.errorWidget ??
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  size: 48,
                  color: Colors.red,
                ),
                const SizedBox(height: 16),
                Text(
                  'Erreur de chargement',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  _error!,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _refresh,
                  child: const Text('Réessayer'),
                ),
              ],
            ),
          );
    }

    // Empty state
    if (_items.isEmpty && !_isLoading) {
      return widget.emptyWidget ??
          const Center(
            child: Text('Aucun élément'),
          );
    }

    // List with items
    return RefreshIndicator(
      onRefresh: _refresh,
      child: ListView.separated(
        controller: _scrollController,
        padding: widget.padding,
        shrinkWrap: widget.shrinkWrap,
        physics: widget.physics ?? const AlwaysScrollableScrollPhysics(),
        itemCount: _items.length + (_hasMore ? 1 : 0),
        separatorBuilder: (context, index) {
          if (index >= _items.length) {
            return const SizedBox.shrink();
          }
          return widget.separator ?? const SizedBox.shrink();
        },
        itemBuilder: (context, index) {
          // Loading indicator at the end
          if (index >= _items.length) {
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          return widget.itemBuilder(context, _items[index], index);
        },
      ),
    );
  }
}

/// Widget de grille avec lazy loading
class LazyLoadGrid<T> extends StatefulWidget {
  final Future<List<T>> Function(int page, int pageSize) onLoadMore;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double childAspectRatio;
  final Widget? loadingWidget;
  final Widget? emptyWidget;
  final Widget? errorWidget;
  final int pageSize;
  final double loadMoreThreshold;
  final ScrollController? scrollController;
  final EdgeInsets? padding;

  const LazyLoadGrid({
    super.key,
    required this.onLoadMore,
    required this.itemBuilder,
    this.crossAxisCount = 2,
    this.mainAxisSpacing = 8,
    this.crossAxisSpacing = 8,
    this.childAspectRatio = 1,
    this.loadingWidget,
    this.emptyWidget,
    this.errorWidget,
    this.pageSize = 20,
    this.loadMoreThreshold = 200,
    this.scrollController,
    this.padding,
  });

  @override
  State<LazyLoadGrid<T>> createState() => _LazyLoadGridState<T>();
}

class _LazyLoadGridState<T> extends State<LazyLoadGrid<T>> {
  final List<T> _items = [];
  late ScrollController _scrollController;
  
  int _currentPage = 0;
  bool _isLoading = false;
  bool _hasMore = true;
  String? _error;
  bool _isInitialLoad = true;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
    _scrollController.addListener(_onScroll);
    _loadMore();
  }

  @override
  void dispose() {
    if (widget.scrollController == null) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  void _onScroll() {
    if (_isLoading || !_hasMore) return;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (maxScroll - currentScroll <= widget.loadMoreThreshold) {
      _loadMore();
    }
  }

  Future<void> _loadMore() async {
    if (_isLoading || !_hasMore) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final newItems = await widget.onLoadMore(_currentPage, widget.pageSize);

      if (mounted) {
        setState(() {
          _items.addAll(newItems);
          _currentPage++;
          _hasMore = newItems.length >= widget.pageSize;
          _isLoading = false;
          _isInitialLoad = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
          _isInitialLoad = false;
        });
      }
    }
  }

  Future<void> _refresh() async {
    setState(() {
      _items.clear();
      _currentPage = 0;
      _hasMore = true;
      _error = null;
      _isInitialLoad = true;
    });
    await _loadMore();
  }

  @override
  Widget build(BuildContext context) {
    // Initial loading
    if (_isInitialLoad && _isLoading) {
      return widget.loadingWidget ??
          const Center(
            child: CircularProgressIndicator(),
          );
    }

    // Error state
    if (_error != null && _items.isEmpty) {
      return widget.errorWidget ??
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  size: 48,
                  color: Colors.red,
                ),
                const SizedBox(height: 16),
                Text(
                  'Erreur de chargement',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _refresh,
                  child: const Text('Réessayer'),
                ),
              ],
            ),
          );
    }

    // Empty state
    if (_items.isEmpty && !_isLoading) {
      return widget.emptyWidget ??
          const Center(
            child: Text('Aucun élément'),
          );
    }

    // Grid with items
    return RefreshIndicator(
      onRefresh: _refresh,
      child: GridView.builder(
        controller: _scrollController,
        padding: widget.padding,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.crossAxisCount,
          mainAxisSpacing: widget.mainAxisSpacing,
          crossAxisSpacing: widget.crossAxisSpacing,
          childAspectRatio: widget.childAspectRatio,
        ),
        itemCount: _items.length + (_hasMore && _isLoading ? 1 : 0),
        itemBuilder: (context, index) {
          // Loading indicator at the end
          if (index >= _items.length) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return widget.itemBuilder(context, _items[index], index);
        },
      ),
    );
  }
}
