import 'dart:async';
import 'package:flutter/material.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_order.dart';

/// Widget timer pour une commande
class OrderTimer extends StatefulWidget {
  final KitchenOrder order;

  const OrderTimer({
    super.key,
    required this.order,
  });

  @override
  State<OrderTimer> createState() => _OrderTimerState();
}

class _OrderTimerState extends State<OrderTimer> {
  Timer? _timer;
  late int _elapsedSeconds;

  @override
  void initState() {
    super.initState();
    _elapsedSeconds = widget.order.elapsedMinutes * 60;
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _elapsedSeconds++;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final minutes = _elapsedSeconds ~/ 60;
    final seconds = _elapsedSeconds % 60;
    final timeString = '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

    final estimatedMinutes = widget.order.estimatedMinutes;
    final isLate = estimatedMinutes != null && minutes > estimatedMinutes;
    final isNearDeadline = estimatedMinutes != null && 
        minutes > (estimatedMinutes * 0.8) && 
        !isLate;

    Color timerColor;
    IconData timerIcon;

    if (isLate) {
      timerColor = Colors.red;
      timerIcon = Icons.warning;
    } else if (isNearDeadline) {
      timerColor = Colors.orange;
      timerIcon = Icons.schedule;
    } else {
      timerColor = Colors.blue;
      timerIcon = Icons.timer;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: timerColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: timerColor.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(timerIcon, size: 16, color: timerColor),
          const SizedBox(width: 4),
          Text(
            timeString,
            style: TextStyle(
              color: timerColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          if (estimatedMinutes != null) ...[
            Text(
              ' / ${estimatedMinutes}min',
              style: TextStyle(
                color: timerColor.withOpacity(0.7),
                fontSize: 12,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
