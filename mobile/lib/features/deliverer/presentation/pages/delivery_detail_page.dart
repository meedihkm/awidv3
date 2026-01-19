import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/payment_service.dart';
import '../../../../core/models/delivery_model.dart';

class DeliveryDetailPage extends StatefulWidget {
  final Delivery delivery;

  DeliveryDetailPage({required this.delivery});

  @override
  _DeliveryDetailPageState createState() => _DeliveryDetailPageState();
}

class _DeliveryDetailPageState extends State<DeliveryDetailPage> {
  final ApiService _apiService = ApiService();
  final PaymentService _paymentService = PaymentService();
  final _commentController = TextEditingController();
  final _amountController = TextEditingController();
  String _paymentStatus = 'unpaid';
  bool _isSubmitting = false;
  bool _isLoadingDebt = true;
  double _clientDebt = 0;
  double _totalToCollect = 0;

  @override
  void initState() {
    super.initState();
    _amountController.text = widget.delivery.order.total.toStringAsFixed(2);
    _loadClientDebt();
  }

  Future<void> _loadClientDebt() async {
    try {
      final clientId = widget.delivery.order.cafeteria?.id;
      if (clientId != null) {
        final result = await _paymentService.getClientDebtDetails(clientId);
        final debtData = result['data'];
        setState(() {
          _clientDebt = (debtData['total_debt'] ?? 0).toDouble();
          _totalToCollect = widget.delivery.order.total + _clientDebt;
          _amountController.text = _totalToCollect.toStringAsFixed(0);
          _isLoadingDebt = false;
        });
      } else {
        setState(() => _isLoadingDebt = false);
      }
    } catch (e) {
      setState(() => _isLoadingDebt = false);
    }
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
      
      // 1. Mettre à jour le statut de la livraison
      await _apiService.updateDeliveryStatus(widget.delivery.id, {
        'status': 'delivered',
        'paymentStatus': _paymentStatus,
        'amountCollected': amountCollected,
        'comment': _commentController.text.trim().isEmpty ? null : _commentController.text.trim(),
      });

      // 2. Si un montant a été collecté, enregistrer le paiement
      if (amountCollected > 0 && widget.delivery.order.cafeteria?.id != null) {
        try {
          final paymentResult = await _paymentService.recordPayment(
            clientId: widget.delivery.order.cafeteria!.id,
            amount: amountCollected,
            mode: 'auto',
            deliveryId: widget.delivery.id,
            notes: 'Collecté lors de la livraison',
          );

          // Afficher le résultat du paiement
          if (paymentResult['success'] == true) {
            _showPaymentResult(paymentResult['data']);
          }
        } catch (paymentError) {
          // Si l'enregistrement du paiement échoue, on continue quand même
          print('Erreur enregistrement paiement: $paymentError');
        }
      }

      Navigator.pop(context, true);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Livraison confirmée'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur: ${e.toString()}'), backgroundColor: Colors.red),
      );
    } finally {
      setState(() => _isSubmitting = false);
    }
  }

  void _showPaymentResult(Map<String, dynamic> data) {
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

            // Debt information
            if (!_isLoadingDebt && _clientDebt > 0) ...[
              Card(
                color: Colors.orange.shade50,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.warning_amber, color: Colors.orange),
                          SizedBox(width: 12),
                          Text(
                            'Dette du client',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange.shade700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Dette actuelle:', style: TextStyle(fontSize: 14)),
                          Text('${_clientDebt.toStringAsFixed(0)} DA',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Commande actuelle:', style: TextStyle(fontSize: 14)),
                          Text('${order.total.toStringAsFixed(0)} DA',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Divider(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total à collecter:', 
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Text('${_totalToCollect.toStringAsFixed(0)} DA',
                            style: TextStyle(
                              fontSize: 18, 
                              fontWeight: FontWeight.bold, 
                              color: Color(0xFF2E7D32),
                            )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],

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
                          labelText: 'Montant collecté (DA)',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          filled: true,
                          fillColor: Colors.grey[50],
                          prefixIcon: Icon(Icons.attach_money),
                          helperText: _clientDebt > 0 
                            ? 'Inclut la dette de ${_clientDebt.toStringAsFixed(0)} DA'
                            : null,
                          helperStyle: TextStyle(color: Colors.orange),
                        ),
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
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