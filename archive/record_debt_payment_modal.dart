import 'package:flutter/material.dart';

import '../../../../core/models/debt_model.dart';
import '../../../../core/services/api_service.dart';

class RecordDebtPaymentModal extends StatefulWidget {
  const RecordDebtPaymentModal({
    required this.debt,
    required this.onSuccess,
    super.key,
    this.apiService,
  });
  final CustomerDebt debt;
  final Function() onSuccess;
  final ApiService? apiService;

  @override
  _RecordDebtPaymentModalState createState() => _RecordDebtPaymentModalState();
}

class _RecordDebtPaymentModalState extends State<RecordDebtPaymentModal> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();
  String _paymentType = 'cash';
  bool _isLoading = false;
  late final ApiService _apiService;

  @override
  void initState() {
    super.initState();
    _apiService = widget.apiService ?? ApiService();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final amount = double.parse(_amountController.text);
      await _apiService.recordPayment(
        customerId: widget.debt.customerId,
        amount: amount,
        mode: _paymentType,
        notes: _noteController.text.trim().isEmpty ? null : _noteController.text.trim(),
      );

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Paiement enregistré avec succès'), backgroundColor: Colors.green),
        );
        widget.onSuccess();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur: ${e.toString()}'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Recouvrer une dette', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.close)),
                  ],
                ),
                SizedBox(height: 8),
                Text('Client: ${widget.debt.customerName}', style: TextStyle(fontWeight: FontWeight.w500)),
                Text('Dette actuelle: ${widget.debt.totalDebt.toStringAsFixed(0)} DA',
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                TextFormField(
                  controller: _amountController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'Montant (DA)',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    prefixIcon: Icon(Icons.monetization_on),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Requis';
                    final v = double.tryParse(value);
                    if (v == null || v <= 0) return 'Montant invalide';
                    if (v > widget.debt.totalDebt) return 'Supérieur à la dette';
                    return null;
                  },
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  initialValue: _paymentType,
                  decoration: InputDecoration(
                    labelText: 'Type de paiement',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    prefixIcon: Icon(Icons.payment),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'cash', child: Text('Espèces')),
                    DropdownMenuItem(value: 'check', child: Text('Chèque')),
                    DropdownMenuItem(value: 'transfer', child: Text('Virement')),
                    DropdownMenuItem(value: 'other', child: Text('Autre')),
                  ],
                  onChanged: (v) => setState(() => _paymentType = v!),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _noteController,
                  decoration: InputDecoration(
                    labelText: 'Note (optionnel)',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    prefixIcon: Icon(Icons.note),
                  ),
                  maxLines: 2,
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2E7D32),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: _isLoading
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                        : Text('Enregistrer le paiement', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
