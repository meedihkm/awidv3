import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/services/payment_service.dart';

class RecordPaymentDialog extends StatefulWidget {
  final Map<String, dynamic> client;
  final double totalDebt;
  final List<dynamic>? unpaidOrders;
  final VoidCallback onSuccess;

  const RecordPaymentDialog({
    Key? key,
    required this.client,
    required this.totalDebt,
    this.unpaidOrders,
    required this.onSuccess,
  }) : super(key: key);

  @override
  _RecordPaymentDialogState createState() => _RecordPaymentDialogState();
}

class _RecordPaymentDialogState extends State<RecordPaymentDialog> {
  final PaymentService _paymentService = PaymentService();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  
  String _mode = 'auto';
  List<String> _selectedOrders = [];
  bool _isLoading = false;
  double _selectedTotal = 0;

  @override
  void dispose() {
    _amountController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _toggleOrderSelection(String orderId, double remaining) {
    setState(() {
      if (_selectedOrders.contains(orderId)) {
        _selectedOrders.remove(orderId);
        _selectedTotal -= remaining;
      } else {
        _selectedOrders.add(orderId);
        _selectedTotal += remaining;
      }
    });
  }

  Future<void> _recordPayment() async {
    final amount = double.tryParse(_amountController.text);
    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Montant invalide'), backgroundColor: Colors.red),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final result = await _paymentService.recordPayment(
        clientId: widget.client['id'],
        amount: amount,
        mode: _mode,
        targetOrders: _mode == 'manual' ? _selectedOrders : null,
        notes: _notesController.text.isNotEmpty ? _notesController.text : null,
      );

      if (result['success'] == true) {
        Navigator.pop(context);
        widget.onSuccess();
        
        // Afficher le résultat
        _showResultDialog(result['data']);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur: ${e.toString()}'), backgroundColor: Colors.red),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showResultDialog(Map<String, dynamic> data) {
    final ordersAffected = data['orders_affected'] as List? ?? [];
    final debtCleared = data['debt_cleared'] == true;
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 28),
            SizedBox(width: 12),
            Text('Paiement enregistré'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Montant: ${data['amount_applied']} DA', 
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 12),
            Text('Répartition:', style: TextStyle(fontWeight: FontWeight.w600)),
            SizedBox(height: 8),
            ...ordersAffected.map((order) => Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: Row(
                children: [
                  Icon(Icons.check, color: Colors.green, size: 16),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Commande #${order['order_number']}: ${order['amount_applied']} DA',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            )).toList(),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: debtCleared ? Colors.green.shade50 : Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    debtCleared ? Icons.celebration : Icons.info_outline,
                    color: debtCleared ? Colors.green : Colors.blue,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      debtCleared 
                        ? 'Dette soldée !' 
                        : 'Nouvelle dette: ${data['debt_after']} DA',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: debtCleared ? Colors.green.shade700 : Colors.blue.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Fermer'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final remainingAfterSelection = _mode == 'manual' && _amountController.text.isNotEmpty
      ? (double.tryParse(_amountController.text) ?? 0) - _selectedTotal
      : 0.0;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Icon(Icons.payment, color: Color(0xFF2E7D32)),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Enregistrer paiement', 
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(widget.client['name'] ?? '', 
                          style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Dette actuelle
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.warning_amber, color: Colors.red),
                    SizedBox(width: 12),
                    Text('Dette actuelle: ${widget.totalDebt.toStringAsFixed(0)} DA',
                      style: TextStyle(fontWeight: FontWeight.w600, color: Colors.red.shade700)),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Montant
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
                decoration: InputDecoration(
                  labelText: 'Montant reçu (DA)',
                  prefixIcon: Icon(Icons.attach_money),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.grey[50],
                ),
                onChanged: (value) => setState(() {}),
              ),
              SizedBox(height: 16),

              // Mode de paiement
              Text('Mode de répartition:', style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: Text('Automatique', style: TextStyle(fontSize: 14)),
                      subtitle: Text('Recommandé', style: TextStyle(fontSize: 12)),
                      value: 'auto',
                      groupValue: _mode,
                      onChanged: (value) => setState(() {
                        _mode = value!;
                        _selectedOrders.clear();
                        _selectedTotal = 0;
                      }),
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: Text('Manuel', style: TextStyle(fontSize: 14)),
                      subtitle: Text('Choisir', style: TextStyle(fontSize: 12)),
                      value: 'manual',
                      groupValue: _mode,
                      onChanged: (value) => setState(() => _mode = value!),
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),

              // Sélection manuelle des commandes
              if (_mode == 'manual' && widget.unpaidOrders != null) ...[
                SizedBox(height: 16),
                Text('Sélectionner les commandes à payer:', 
                  style: TextStyle(fontWeight: FontWeight.w600)),
                SizedBox(height: 8),
                Container(
                  constraints: BoxConstraints(maxHeight: 200),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.unpaidOrders!.length,
                    itemBuilder: (context, index) {
                      final order = widget.unpaidOrders![index];
                      final orderId = order['id'];
                      final remaining = (order['remaining'] ?? 0).toDouble();
                      final isSelected = _selectedOrders.contains(orderId);

                      return CheckboxListTile(
                        title: Text('#${order['order_number']} - ${order['date']?.toString().split('T')[0] ?? ''}',
                          style: TextStyle(fontSize: 14)),
                        subtitle: Text('Reste: ${remaining.toStringAsFixed(0)} DA',
                          style: TextStyle(fontSize: 12)),
                        value: isSelected,
                        onChanged: (value) => _toggleOrderSelection(orderId, remaining),
                        dense: true,
                      );
                    },
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total sélectionné:', style: TextStyle(fontSize: 12)),
                          Text('${_selectedTotal.toStringAsFixed(0)} DA',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      if (remainingAfterSelection > 0) ...[
                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Reste (appliqué auto):', style: TextStyle(fontSize: 12)),
                            Text('${remainingAfterSelection.toStringAsFixed(0)} DA',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ],

              SizedBox(height: 16),

              // Notes
              TextField(
                controller: _notesController,
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: 'Note (optionnel)',
                  hintText: 'Ex: Paiement en espèces',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.grey[50],
                ),
              ),
              SizedBox(height: 20),

              // Boutons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _isLoading ? null : () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text('Annuler'),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _recordPayment,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF2E7D32),
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: _isLoading
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                          )
                        : Text('Enregistrer', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
