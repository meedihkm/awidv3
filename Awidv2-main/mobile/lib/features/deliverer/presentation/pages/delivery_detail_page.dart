import 'package:flutter/material.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/models/delivery_model.dart';

class DeliveryDetailPage extends StatefulWidget {
  final Delivery delivery;

  DeliveryDetailPage({required this.delivery});

  @override
  _DeliveryDetailPageState createState() => _DeliveryDetailPageState();
}

class _DeliveryDetailPageState extends State<DeliveryDetailPage> {
  final ApiService _apiService = ApiService();
  final _commentController = TextEditingController();
  final _amountController = TextEditingController();
  String _paymentStatus = 'unpaid';
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _amountController.text = widget.delivery.order.total.toStringAsFixed(2);
  }

  @override
  void dispose() {
    _commentController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  Future<void> _confirmDelivery() async {
    if (_isSubmitting) return;

    setState(() => _isSubmitting = true);

    try {
      final amountCollected = double.tryParse(_amountController.text) ?? 0;
      
      await _apiService.updateDeliveryStatus(widget.delivery.id, {
        'status': 'delivered',
        'paymentStatus': _paymentStatus,
        'amountCollected': amountCollected,
        'comment': _commentController.text.trim().isEmpty ? null : _commentController.text.trim(),
      });

      Navigator.pop(context, true);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Livraison confirmée'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur: ${e.toString()}')),
      );
    } finally {
      setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final delivery = widget.delivery;
    final order = delivery.order;

    return Scaffold(
      appBar: AppBar(
        title: Text('Livraison #${delivery.id}'),
        backgroundColor: Colors.orange.shade600,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order info
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Informations commande',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text('Commande #${order.id}'),
                    Text('Cafétéria: ${order.cafeteria?.name ?? 'N/A'}'),
                    if (order.cafeteria?.phone != null)
                      Text('Téléphone: ${order.cafeteria!.phone}'),
                    Text('Total: ${order.total.toStringAsFixed(2)} €'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            // Items list
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Articles à livrer',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    ...order.items.map((item) => Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text('${item.productName} x${item.quantity}'),
                          ),
                          Text(
                            '${item.totalPrice.toStringAsFixed(2)} €',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${order.total.toStringAsFixed(2)} €',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            // Delivery confirmation form
            if (delivery.isInProgress) ...[
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Confirmer la livraison',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      
                      // Payment status
                      Text(
                        'Statut du paiement',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile<String>(
                              title: Text('Payé'),
                              value: 'paid',
                              groupValue: _paymentStatus,
                              onChanged: (value) {
                                setState(() => _paymentStatus = value!);
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<String>(
                              title: Text('Non payé'),
                              value: 'unpaid',
                              groupValue: _paymentStatus,
                              onChanged: (value) {
                                setState(() => _paymentStatus = value!);
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      
                      // Amount collected
                      TextField(
                        controller: _amountController,
                        decoration: InputDecoration(
                          labelText: 'Montant collecté (€)',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        enabled: _paymentStatus == 'paid',
                      ),
                      SizedBox(height: 16),
                      
                      // Comment
                      TextField(
                        controller: _commentController,
                        decoration: InputDecoration(
                          labelText: 'Commentaire (optionnel)',
                          border: OutlineInputBorder(),
                          hintText: 'Remarques sur la livraison...',
                        ),
                        maxLines: 3,
                      ),
                      SizedBox(height: 20),
                      
                      // Confirm button
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: _isSubmitting ? null : _confirmDelivery,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade600,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: _isSubmitting
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text(
                                  'Confirmer la livraison',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],

            // Delivery info (if already delivered)
            if (delivery.isDelivered) ...[
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Livraison terminée',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade600,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text('Statut paiement: ${delivery.isPaid ? 'Payé' : 'Non payé'}'),
                      Text('Montant collecté: ${delivery.amountCollected.toStringAsFixed(2)} €'),
                      if (delivery.comment != null && delivery.comment!.isNotEmpty)
                        Text('Commentaire: ${delivery.comment}'),
                      if (delivery.deliveredAt != null)
                        Text('Livré le: ${delivery.deliveredAt}'),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}