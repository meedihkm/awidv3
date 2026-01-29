import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:awid_mobile/core/utils/image_optimizer.dart';
import 'package:awid_mobile/core/widgets/shimmer_loading.dart';

/// Widget d'image optimisée avec cache et placeholder
class OptimizedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;

  const OptimizedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    Widget imageWidget = CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) =>
          placeholder ??
          ShimmerLoading(
            width: width ?? double.infinity,
            height: height ?? 200,
          ),
      errorWidget: (context, url, error) =>
          errorWidget ??
          Container(
            width: width,
            height: height,
            color: Colors.grey[300],
            child: const Icon(
              Icons.broken_image,
              color: Colors.grey,
              size: 48,
            ),
          ),
      memCacheWidth: width?.toInt(),
      memCacheHeight: height?.toInt(),
      maxWidthDiskCache: 1920,
      maxHeightDiskCache: 1080,
    );

    if (borderRadius != null) {
      imageWidget = ClipRRect(
        borderRadius: borderRadius!,
        child: imageWidget,
      );
    }

    return imageWidget;
  }
}

/// Widget d'image locale optimisée
class OptimizedLocalImage extends StatefulWidget {
  final File imageFile;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final bool autoOptimize;

  const OptimizedLocalImage({
    super.key,
    required this.imageFile,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.autoOptimize = true,
  });

  @override
  State<OptimizedLocalImage> createState() => _OptimizedLocalImageState();
}

class _OptimizedLocalImageState extends State<OptimizedLocalImage> {
  File? _optimizedFile;
  bool _isOptimizing = false;

  @override
  void initState() {
    super.initState();
    if (widget.autoOptimize) {
      _optimizeImage();
    }
  }

  Future<void> _optimizeImage() async {
    setState(() => _isOptimizing = true);

    try {
      final optimized = await ImageOptimizer().optimizeImage(
        widget.imageFile,
        maxWidth: widget.width?.toInt() ?? 1920,
        maxHeight: widget.height?.toInt() ?? 1080,
      );

      if (mounted) {
        setState(() {
          _optimizedFile = optimized;
          _isOptimizing = false;
        });
      }
    } catch (e) {
      print('Error optimizing image: $e');
      if (mounted) {
        setState(() => _isOptimizing = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isOptimizing) {
      return ShimmerLoading(
        width: widget.width ?? double.infinity,
        height: widget.height ?? 200,
      );
    }

    final file = _optimizedFile ?? widget.imageFile;

    Widget imageWidget = Image.file(
      file,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: widget.width,
          height: widget.height,
          color: Colors.grey[300],
          child: const Icon(
            Icons.broken_image,
            color: Colors.grey,
            size: 48,
          ),
        );
      },
    );

    if (widget.borderRadius != null) {
      imageWidget = ClipRRect(
        borderRadius: widget.borderRadius!,
        child: imageWidget,
      );
    }

    return imageWidget;
  }
}

/// Widget d'avatar optimisé
class OptimizedAvatar extends StatelessWidget {
  final String? imageUrl;
  final double radius;
  final String? fallbackText;
  final Color? backgroundColor;

  const OptimizedAvatar({
    super.key,
    this.imageUrl,
    this.radius = 20,
    this.fallbackText,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor ?? Colors.grey[300],
        child: Text(
          fallbackText?.substring(0, 1).toUpperCase() ?? '?',
          style: TextStyle(
            fontSize: radius * 0.8,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
    }

    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor ?? Colors.grey[300],
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: imageUrl!,
          width: radius * 2,
          height: radius * 2,
          fit: BoxFit.cover,
          placeholder: (context, url) => ShimmerLoading(
            width: radius * 2,
            height: radius * 2,
            borderRadius: BorderRadius.circular(radius),
          ),
          errorWidget: (context, url, error) => Text(
            fallbackText?.substring(0, 1).toUpperCase() ?? '?',
            style: TextStyle(
              fontSize: radius * 0.8,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          memCacheWidth: (radius * 2).toInt(),
          memCacheHeight: (radius * 2).toInt(),
        ),
      ),
    );
  }
}

/// Widget d'image avec zoom
class ZoomableImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;

  const ZoomableImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showFullScreen(context),
      child: OptimizedImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }

  void _showFullScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: InteractiveViewer(
            minScale: 0.5,
            maxScale: 4.0,
            child: Center(
              child: OptimizedImage(
                imageUrl: imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Widget de galerie d'images optimisées
class OptimizedImageGallery extends StatelessWidget {
  final List<String> imageUrls;
  final double itemHeight;
  final double spacing;

  const OptimizedImageGallery({
    super.key,
    required this.imageUrls,
    this.itemHeight = 120,
    this.spacing = 8,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: itemHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length,
        separatorBuilder: (context, index) => SizedBox(width: spacing),
        itemBuilder: (context, index) {
          return ZoomableImage(
            imageUrl: imageUrls[index],
            width: itemHeight,
            height: itemHeight,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
