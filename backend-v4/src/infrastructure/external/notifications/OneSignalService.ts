/**
 * External Service: OneSignal
 * Service de notifications push (gratuit jusqu'à 10k users)
 */
export interface PushNotification {
  title: string;
  message: string;
  data?: Record<string, any>;
  url?: string;
  icon?: string;
  image?: string;
}

export interface NotificationResult {
  id: string;
  recipients: number;
}

export class OneSignalService {
  private static instance: OneSignalService;
  private appId: string;
  private apiKey: string;
  private baseUrl = 'https://onesignal.com/api/v1';

  private constructor() {
    this.appId = process.env.ONESIGNAL_APP_ID || '';
    this.apiKey = process.env.ONESIGNAL_API_KEY || '';
  }

  static getInstance(): OneSignalService {
    if (!OneSignalService.instance) {
      OneSignalService.instance = new OneSignalService();
    }
    return OneSignalService.instance;
  }

  /**
   * Envoyer une notification à un utilisateur spécifique
   */
  async sendToUser(
    userId: string,
    notification: PushNotification
  ): Promise<NotificationResult | null> {
    try {
      console.log(`[OneSignal] Sending notification to user ${userId}`);
      console.log(`[OneSignal] Title: ${notification.title}`);

      await new Promise((resolve) => setTimeout(resolve, 100));

      // Simuler l'envoi pour le MVP
      const result: NotificationResult = {
        id: `notif_${Date.now()}`,
        recipients: 1,
      };

      console.log(`[OneSignal] Notification sent: ${result.id}`);
      return result;

      // TODO: Implémenter l'appel réel
      // const response = await fetch(`${this.baseUrl}/notifications`, {
      //   method: 'POST',
      //   headers: {
      //     'Content-Type': 'application/json',
      //     'Authorization': `Basic ${this.apiKey}`,
      //   },
      //   body: JSON.stringify({
      //     app_id: this.appId,
      //     include_external_user_ids: [userId],
      //     headings: { en: notification.title },
      //     contents: { en: notification.message },
      //     data: notification.data,
      //     url: notification.url,
      //     small_icon: notification.icon,
      //     large_icon: notification.image,
      //   }),
      // });
      // const data = await response.json();
      // return {
      //   id: data.id,
      //   recipients: data.recipients,
      // };
    } catch (error) {
      console.error('[OneSignal] Send error:', error);
      return null;
    }
  }

  /**
   * Envoyer une notification à plusieurs utilisateurs
   */
  async sendToUsers(
    userIds: string[],
    notification: PushNotification
  ): Promise<NotificationResult | null> {
    try {
      console.log(`[OneSignal] Sending notification to ${userIds.length} users`);

      await new Promise((resolve) => setTimeout(resolve, 150));

      const result: NotificationResult = {
        id: `notif_${Date.now()}`,
        recipients: userIds.length,
      };

      console.log(`[OneSignal] Notification sent: ${result.id}`);
      return result;
    } catch (error) {
      console.error('[OneSignal] Send error:', error);
      return null;
    }
  }

  /**
   * Envoyer une notification à un segment (ex: tous les livreurs)
   */
  async sendToSegment(
    segment: string,
    notification: PushNotification
  ): Promise<NotificationResult | null> {
    try {
      console.log(`[OneSignal] Sending notification to segment: ${segment}`);

      await new Promise((resolve) => setTimeout(resolve, 150));

      const result: NotificationResult = {
        id: `notif_${Date.now()}`,
        recipients: 10, // Simulé
      };

      console.log(`[OneSignal] Notification sent: ${result.id}`);
      return result;
    } catch (error) {
      console.error('[OneSignal] Send error:', error);
      return null;
    }
  }

  /**
   * Notifications prédéfinies
   */
  async sendOrderConfirmation(userId: string, orderId: string): Promise<NotificationResult | null> {
    return this.sendToUser(userId, {
      title: 'Commande confirmée',
      message: `Votre commande #${orderId} a été confirmée`,
      data: { type: 'order', orderId },
      url: `/orders/${orderId}`,
    });
  }

  async sendDeliveryStarted(
    userId: string,
    orderId: string,
    delivererName: string
  ): Promise<NotificationResult | null> {
    return this.sendToUser(userId, {
      title: 'Livraison en cours',
      message: `${delivererName} a pris en charge votre commande #${orderId}`,
      data: { type: 'delivery', orderId },
      url: `/deliveries/track/${orderId}`,
    });
  }

  async sendDeliveryArrived(userId: string, orderId: string): Promise<NotificationResult | null> {
    return this.sendToUser(userId, {
      title: 'Livreur arrivé',
      message: `Votre commande #${orderId} est arrivée`,
      data: { type: 'delivery', orderId },
    });
  }

  async sendPaymentReceived(userId: string, amount: number): Promise<NotificationResult | null> {
    return this.sendToUser(userId, {
      title: 'Paiement reçu',
      message: `Nous avons bien reçu votre paiement de ${amount} DZD`,
      data: { type: 'payment', amount },
    });
  }

  async sendCreditLimitAlert(
    userId: string,
    percentage: number
  ): Promise<NotificationResult | null> {
    return this.sendToUser(userId, {
      title: 'Alerte crédit',
      message: `Vous avez atteint ${percentage}% de votre limite de crédit`,
      data: { type: 'alert', alertType: 'credit' },
    });
  }

  async sendNewOrderToKitchen(orderId: string): Promise<NotificationResult | null> {
    return this.sendToSegment('kitchen', {
      title: 'Nouvelle commande',
      message: `Nouvelle commande #${orderId} à préparer`,
      data: { type: 'order', orderId },
      url: `/kitchen/orders/${orderId}`,
    });
  }

  async sendOrderReadyToDeliverer(
    delivererId: string,
    orderId: string
  ): Promise<NotificationResult | null> {
    return this.sendToUser(delivererId, {
      title: 'Commande prête',
      message: `La commande #${orderId} est prête pour livraison`,
      data: { type: 'order', orderId },
      url: `/deliveries/${orderId}`,
    });
  }
}
