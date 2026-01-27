import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/customer_account.dart';

/// Widget Indicateur de Crédit
/// Affiche l'état du crédit du client avec une barre de progression
class CreditIndicatorWidget extends StatelessWidget {
  final CustomerCreditInfo creditInfo;
  final VoidCallback? onTap;

  const CreditIndicatorWidget({
    super.key,
    required this.creditInfo,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final usagePercentage = creditInfo.usagePercentage;
    final isWarning = usagePercentage >= 80;
    final isExceeded = creditInfo.currentBalance > creditInfo.creditLimit;

    return Card(
      elevation: isWarning ? 4 : 2,
      color: isExceeded ? Colors.red.shade50 : null,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.account_balance_wallet,
                        color: _getStatusColor(),
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Crédit',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  if (creditInfo.isCreditBlocked)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'BLOQUÉ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),

              // Current Balance
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dette actuelle',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        NumberFormat.currency(symbol: '€').format(creditInfo.currentBalance),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: _getStatusColor(),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Limite',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        NumberFormat.currency(symbol: '€').format(creditInfo.creditLimit),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Progress Bar
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: (usagePercentage / 100).clamp(0.0, 1.0),
                  minHeight: 12,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: AlwaysStoppedAnimation<Color>(_getStatusColor()),
                ),
              ),
              const SizedBox(height: 8),

              // Usage Percentage
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${usagePercentage.toStringAsFixed(1)}% utilisé',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Text(
                    'Disponible: ${NumberFormat.currency(symbol: '€').format(creditInfo.availableCredit)}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              // Warning Messages
              if (creditInfo.daysOverdue > 0) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.warning, color: Colors.red, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Paiement en retard de ${creditInfo.daysOverdue} jour${creditInfo.daysOverdue > 1 ? 's' : ''}',
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ] else if (isExceeded) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.error, color: Colors.red, size: 20),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          'Limite de crédit dépassée',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ] else if (isWarning) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.orange),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.info, color: Colors.orange, size: 20),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          'Attention: Proche de la limite de crédit',
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              // Last Payment Info
              if (creditInfo.lastPaymentDate != null) ...[
                const SizedBox(height: 12),
                Text(
                  'Dernier paiement: ${NumberFormat.currency(symbol: '€').format(creditInfo.lastPaymentAmount)} le ${DateFormat('dd/MM/yyyy').format(creditInfo.lastPaymentDate!)}',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor() {
    if (creditInfo.isCreditBlocked) return Colors.red;
    if (creditInfo.currentBalance > creditInfo.creditLimit) return Colors.red;
    if (creditInfo.usagePercentage >= 80) return Colors.orange;
    return Colors.green;
  }
}
