import 'package:flutter/material.dart';
import 'dart:math' as math;

/// Animations de chargement personnalisées

/// Spinner rotatif avec points
class DotSpinner extends StatefulWidget {
  final double size;
  final Color color;
  final Duration duration;

  const DotSpinner({
    super.key,
    this.size = 50,
    this.color = Colors.blue,
    this.duration = const Duration(milliseconds: 1200),
  });

  @override
  State<DotSpinner> createState() => _DotSpinnerState();
}

class _DotSpinnerState extends State<DotSpinner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _DotSpinnerPainter(
              progress: _controller.value,
              color: widget.color,
            ),
          );
        },
      ),
    );
  }
}

class _DotSpinnerPainter extends CustomPainter {
  final double progress;
  final Color color;

  _DotSpinnerPainter({
    required this.progress,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final dotRadius = size.width / 12;
    const dotCount = 8;

    for (var i = 0; i < dotCount; i++) {
      final angle = (2 * math.pi / dotCount) * i;
      final x = center.dx + radius * 0.7 * math.cos(angle);
      final y = center.dy + radius * 0.7 * math.sin(angle);

      final opacity = ((progress * dotCount + i) % dotCount) / dotCount;

      final paint = Paint()
        ..color = color.withOpacity(opacity)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset(x, y), dotRadius, paint);
    }
  }

  @override
  bool shouldRepaint(_DotSpinnerPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

/// Pulse loader
class PulseLoader extends StatefulWidget {
  final double size;
  final Color color;
  final Duration duration;

  const PulseLoader({
    super.key,
    this.size = 50,
    this.color = Colors.blue,
    this.duration = const Duration(milliseconds: 1000),
  });

  @override
  State<PulseLoader> createState() => _PulseLoaderState();
}

class _PulseLoaderState extends State<PulseLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.size * _animation.value,
          height: widget.size * _animation.value,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.color.withOpacity(_animation.value),
          ),
        );
      },
    );
  }
}

/// Wave loader (3 points qui montent et descendent)
class WaveLoader extends StatefulWidget {
  final double size;
  final Color color;
  final Duration duration;

  const WaveLoader({
    super.key,
    this.size = 50,
    this.color = Colors.blue,
    this.duration = const Duration(milliseconds: 1200),
  });

  @override
  State<WaveLoader> createState() => _WaveLoaderState();
}

class _WaveLoaderState extends State<WaveLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(3, (index) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final delay = index * 0.15;
              final value = math.sin((_controller.value + delay) * 2 * math.pi);
              final offset = value * widget.size * 0.3;

              return Transform.translate(
                offset: Offset(0, offset),
                child: Container(
                  width: widget.size / 6,
                  height: widget.size / 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.color,
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

/// Bouncing dots loader
class BouncingDotsLoader extends StatefulWidget {
  final double size;
  final Color color;
  final Duration duration;

  const BouncingDotsLoader({
    super.key,
    this.size = 50,
    this.color = Colors.blue,
    this.duration = const Duration(milliseconds: 1400),
  });

  @override
  State<BouncingDotsLoader> createState() => _BouncingDotsLoaderState();
}

class _BouncingDotsLoaderState extends State<BouncingDotsLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(3, (index) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final delay = index * 0.2;
              final progress = (_controller.value + delay) % 1.0;
              final scale = 1.0 - (math.sin(progress * math.pi) * 0.5);

              return Transform.scale(
                scale: scale,
                child: Container(
                  width: widget.size / 6,
                  height: widget.size / 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.color,
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

/// Circular progress avec texte
class CircularProgressWithText extends StatelessWidget {
  final double progress;
  final double size;
  final Color color;
  final Color backgroundColor;
  final double strokeWidth;
  final String? text;
  final TextStyle? textStyle;

  const CircularProgressWithText({
    super.key,
    required this.progress,
    this.size = 100,
    this.color = Colors.blue,
    this.backgroundColor = Colors.grey,
    this.strokeWidth = 8,
    this.text,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: 1.0,
              strokeWidth: strokeWidth,
              valueColor: AlwaysStoppedAnimation<Color>(
                backgroundColor.withOpacity(0.3),
              ),
            ),
          ),
          // Progress circle
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: strokeWidth,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
          // Text
          Text(
            text ?? '${(progress * 100).toInt()}%',
            style: textStyle ??
                TextStyle(
                  fontSize: size / 5,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
          ),
        ],
      ),
    );
  }
}

/// Skeleton loader pour texte
class SkeletonText extends StatefulWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  const SkeletonText({
    super.key,
    required this.width,
    this.height = 16,
    this.borderRadius,
  });

  @override
  State<SkeletonText> createState() => _SkeletonTextState();
}

class _SkeletonTextState extends State<SkeletonText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(4),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.grey[300]!,
                Colors.grey[100]!,
                Colors.grey[300]!,
              ],
              stops: [
                math.max(0.0, _animation.value - 0.3),
                _animation.value,
                math.min(1.0, _animation.value + 0.3),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Helper pour afficher un loader avec message
class LoadingWithMessage extends StatelessWidget {
  final String message;
  final Widget? loader;

  const LoadingWithMessage({
    super.key,
    required this.message,
    this.loader,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        loader ?? const CircularProgressIndicator(),
        const SizedBox(height: 16),
        Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
