import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/payment_collection.dart';
import '../../domain/usecases/collect_payment_usecase.dart';
import '../providers/delivery_actions_provider.dart';
import '../widgets/payment_allocation.dart';

/// Page d'encaissement de paiement
class PaymentCollectionPage extends ConsumerStatefulWidget {
  final String customerId;
  final String customerName;
  final String deliveryId;

  const PaymentCollectionPage({
    super.key,
    required this.customerId,
    required this.customerName,
    required this.deliveryId,
  });

  @override
  ConsumerState<PaymentCollectionPage> createState() => _PaymentCollectionPageState();
}

class _PaymentCollectionPageState extends ConsumerState<PaymentCollectionPage> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _referenceController = TextEditingController();
  final _notesController = TextEditingController();

  PaymentMode _selectedMode = PaymentMode.cash;
  bool _isAutoAllocation = true;
  List<ManualAllocation> _manualAllocations = [];

  @override
  void dispose() {
    _amountController.dispose();
    _referenceController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final unpaidOrdersAsync = ref.watch(unpaidOrdersProvider(widget.customerId));
    final actionsState = ref.watch(deliveryActionsProvider);

    ref.listen<DeliveryActionsState>(deliveryActionsProvider, (previous, next) {
      if (next is _PaymentCollected) {
        _showSuccessDialog(next);
      } else if (next is _Error) {
        _showErrorSnackBar(next.message);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Encaisser Paiement'),
        elevation: 0,
      ),
      body: unpaidOrdersAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('Erreur: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.refresh(unpaidOrdersProvider(widget.customerId)),
                child: const Text('Réessayer'),
              ),
            ],
          ),
        ),
        data: (unpaidOrders) => _buildForm(context, unpaidOrders, actionsState),
      ),
    );
  }

  Widget _buildForm(BuildContext context, List<UnpaidOrder> unpaidOrders, DeliveryActionsState state) {
    final totalDebt = unpaidOrders.fold<double>(0, (sum, order) => sum + order.remainingAmount);
    final isLoading = state is _Loading;

    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Client Info Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.customerName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.receipt_long, size: 20, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text('${unpaidOrders.length} commande(s) impayée(s)'),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.account_balance_wallet, size: 20, color: Colors.red),
                      const SizedBox(width: 8),
                      Text(
                        'Dette totale: ${NumberFormat.currency(symbol: '€').format(totalDebt)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Amount Input
          TextFormField(
            controller: _amountController,
            decoration: const InputDecoration(
              labelText: 'Montant encaissé',
              prefixIcon: Icon(Icons.euro),
              suffixText: '€',
              border: OutlineInputBorder(),
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez saisir un montant';
              }
              final amount = double.tryParse(value);
              if (amount == null || amount <= 0) {
                return 'Montant invalide';
              }
              if (amount > totalDebt) {
                return 'Montant supérieur à la dette';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Payment Mode
          DropdownButtonFormField<PaymentMode>(
            value: _selectedMode,
            decoration: const InputDecoration(
              labelText: 'Mode de paiement',
              prefixIcon: Icon(Icons.payment),
              border: OutlineInputBorder(),
            ),
            items: PaymentMode.values.map((mode) {
              return DropdownMenuItem(
                value: mode,
                child: Row(
                  children: [
                    Icon(_getPaymentModeIcon(mode), size: 20),
                    const SizedBox(width: 8),
                    Text(_getPaymentModeLabel(mode)),
                  ],
                ),
              );
            }).toList(),
            onChanged: isLoading ? null : (value) {
              if (value != null) {
                setState(() => _selectedMode = value);
              }
            },
          ),
          const SizedBox(height: 16),

          // Reference (for check/transfer)
          if (_selectedMode != PaymentMode.cash) ...[
            TextFormField(
              controller: _referenceController,
              decoration: InputDecoration(
                labelText: _selectedMode == PaymentMode.check ? 'Numéro de chèque' : 'Référence virement',
                prefixIcon: const Icon(Icons.tag),
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (_selectedMode != PaymentMode.cash && (value == null || value.isEmpty)) {
                  return 'Référence requise';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
          ],

          // Allocation Type
          Card(
            child: Column(
              children: [
                RadioListTile<bool>(
                  title: const Text('Allocation automatique (FIFO)'),
                  subtitle: const Text('Les commandes les plus anciennes sont payées en premier'),
                  value: true,
                  groupValue: _isAutoAllocation,
                  onChanged: isLoading ? null : (value) {
                    setState(() => _isAutoAllocation = value ?? true);
                  },
                ),
                RadioListTile<bool>(
                  title: const Text('Allocation manuelle'),
                  subtitle: const Text('Choisir les commandes à payer'),
                  value: false,
                  groupValue: _isAutoAllocation,
                  onChanged: isLoading ? null : (value) {
                    setState(() => _isAutoAllocation = value ?? true);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Manual Allocation Widget
          if (!_isAutoAllocation) ...[
            PaymentAllocationWidget(
              unpaidOrders: unpaidOrders,
              totalAmount: double.tryParse(_amountController.text) ?? 0,
              onAllocationsChanged: (allocations) {
                setState(() => _manualAllocations = allocations);
              },
            ),
            const SizedBox(height: 16),
          ],

          // Notes
          TextFormField(
            controller: _notesController,
            decoration: const InputDecoration(
              labelText: 'Notes (optionnel)',
              prefixIcon: Icon(Icons.note),
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 24),

          // Submit Button
          ElevatedButton(
            onPressed: isLoading ? null : _submitPayment,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
            child: isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                  )
                : const Text('Encaisser', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }

  void _submitPayment() {
    if (!_formKey.currentState!.validate()) return;

    final amount = double.parse(_amountController.text);
    final reference = _referenceController.text.trim();
    final notes = _notesController.text.trim();

    if (_isAutoAllocation) {
      // Auto allocation
      final params = CollectPaymentAutoParams(
        deliveryId: widget.deliveryId,
        customerId: widget.customerId,
        amount: amount,
        mode: _selectedMode,
        reference: reference.isEmpty ? null : reference,
        notes: notes.isEmpty ? null : notes,
      );
      ref.read(deliveryActionsProvider.notifier).collectPaymentAuto(params);
    } else {
      // Manual allocation
      if (_manualAllocations.isEmpty) {
        _showErrorSnackBar('Veuillez allouer le paiement aux commandes');
        return;
      }

      final totalAllocated = _manualAllocations.fold<double>(
        0,
        (sum, alloc) => sum + alloc.amount,
      );

      if ((totalAllocated - amount).abs() > 0.01) {
        _showErrorSnackBar('Le total alloué doit correspondre au montant encaissé');
        return;
      }

      final params = CollectPaymentManualParams(
        deliveryId: widget.deliveryId,
        customerId: widget.customerId,
        amount: amount,
        mode: _selectedMode,
        allocations: _manualAllocations,
        reference: reference.isEmpty ? null : reference,
        notes: notes.isEmpty ? null : notes,
      );
      ref.read(deliveryActionsProvider.notifier).collectPaymentManual(params);
    }
  }

  void _showSuccessDialog(_PaymentCollected state) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 32),
            SizedBox(width: 12),
            Text('Paiement Encaissé'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Montant: ${NumberFormat.currency(symbol: '€').format(state.amount)}'),
            const SizedBox(height: 8),
            Text('Client: ${widget.customerName}'),
            const SizedBox(height: 8),
            Text('${state.allocations.length} commande(s) payée(s)'),
            const SizedBox(height: 8),
            Text('Date: ${DateFormat('dd/MM/yyyy HH:mm').format(state.collectedAt)}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              Navigator.of(context).pop(); // Close page
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  IconData _getPaymentModeIcon(PaymentMode mode) {
    switch (mode) {
      case PaymentMode.cash:
        return Icons.money;
      case PaymentMode.check:
        return Icons.receipt;
      case PaymentMode.transfer:
        return Icons.account_balance;
    }
  }

  String _getPaymentModeLabel(PaymentMode mode) {
    switch (mode) {
      case PaymentMode.cash:
        return 'Espèces';
      case PaymentMode.check:
        return 'Chèque';
      case PaymentMode.transfer:
        return 'Virement';
    }
  }
}
