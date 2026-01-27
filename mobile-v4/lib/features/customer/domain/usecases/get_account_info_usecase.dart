import '../entities/customer_account.dart';
import '../repositories/customer_repository.dart';

/// Use Case: Récupérer les Informations du Compte Client
/// Gère la récupération et la mise à jour des informations du compte
class GetAccountInfoUseCase {
  final CustomerRepository _repository;

  const GetAccountInfoUseCase(this._repository);

  /// Récupère les informations complètes du compte
  Future<GetAccountInfoResult> execute(String customerId) async {
    try {
      // 1. Valider l'ID
      if (customerId.isEmpty) {
        throw ArgumentError('L\'ID du client est requis');
      }

      // 2. Récupérer les informations du compte
      final account = await _repository.getAccountInfo(customerId);

      if (account == null) {
        return GetAccountInfoResult.failure(
          error: 'Compte non trouvé',
          customerId: customerId,
        );
      }

      // 3. Vérifier l'état du compte
      if (!account.isActive) {
        return GetAccountInfoResult.inactive(
          account: account,
          reason: 'Le compte est désactivé',
        );
      }

      return GetAccountInfoResult.success(account: account);
    } catch (error) {
      return GetAccountInfoResult.failure(
        error: error.toString(),
        customerId: customerId,
      );
    }
  }

  /// Récupère uniquement les informations de crédit
  Future<GetCreditInfoResult> getCreditInfo(String customerId) async {
    try {
      if (customerId.isEmpty) {
        throw ArgumentError('L\'ID du client est requis');
      }

      final creditInfo = await _repository.getCreditInfo(customerId);

      if (creditInfo == null) {
        return GetCreditInfoResult.failure(
          error: 'Informations de crédit non trouvées',
          customerId: customerId,
        );
      }

      return GetCreditInfoResult.success(creditInfo: creditInfo);
    } catch (error) {
      return GetCreditInfoResult.failure(
        error: error.toString(),
        customerId: customerId,
      );
    }
  }

  /// Récupère uniquement les informations de consignes
  Future<GetPackagingInfoResult> getPackagingInfo(String customerId) async {
    try {
      if (customerId.isEmpty) {
        throw ArgumentError('L\'ID du client est requis');
      }

      final packagingInfo = await _repository.getPackagingInfo(customerId);

      if (packagingInfo == null) {
        return GetPackagingInfoResult.failure(
          error: 'Informations de consignes non trouvées',
          customerId: customerId,
        );
      }

      return GetPackagingInfoResult.success(packagingInfo: packagingInfo);
    } catch (error) {
      return GetPackagingInfoResult.failure(
        error: error.toString(),
        customerId: customerId,
      );
    }
  }

  /// Met à jour les paramètres du compte
  Future<UpdateSettingsResult> updateSettings(
    String customerId,
    CustomerSettings settings,
  ) async {
    try {
      if (customerId.isEmpty) {
        throw ArgumentError('L\'ID du client est requis');
      }

      await _repository.updateSettings(customerId, settings);

      return UpdateSettingsResult.success(settings: settings);
    } catch (error) {
      return UpdateSettingsResult.failure(
        error: error.toString(),
        customerId: customerId,
      );
    }
  }

  /// Met à jour les informations de contact
  Future<UpdateContactResult> updateContact(
    String customerId,
    String contactId,
    CustomerContact contact,
  ) async {
    try {
      if (customerId.isEmpty) {
        throw ArgumentError('L\'ID du client est requis');
      }

      if (contactId.isEmpty) {
        throw ArgumentError('L\'ID du contact est requis');
      }

      await _repository.updateContact(customerId, contactId, contact);

      return UpdateContactResult.success(contact: contact);
    } catch (error) {
      return UpdateContactResult.failure(
        error: error.toString(),
        customerId: customerId,
      );
    }
  }

  /// Ajoute un nouveau contact
  Future<AddContactResult> addContact(
    String customerId,
    CustomerContact contact,
  ) async {
    try {
      if (customerId.isEmpty) {
        throw ArgumentError('L\'ID du client est requis');
      }

      final contactId = await _repository.addContact(customerId, contact);

      return AddContactResult.success(
        contactId: contactId,
        contact: contact,
      );
    } catch (error) {
      return AddContactResult.failure(
        error: error.toString(),
        customerId: customerId,
      );
    }
  }

  /// Supprime un contact
  Future<DeleteContactResult> deleteContact(
    String customerId,
    String contactId,
  ) async {
    try {
      if (customerId.isEmpty) {
        throw ArgumentError('L\'ID du client est requis');
      }

      if (contactId.isEmpty) {
        throw ArgumentError('L\'ID du contact est requis');
      }

      await _repository.deleteContact(customerId, contactId);

      return DeleteContactResult.success(contactId: contactId);
    } catch (error) {
      return DeleteContactResult.failure(
        error: error.toString(),
        customerId: customerId,
      );
    }
  }
}

/// Résultat de récupération des informations du compte
abstract class GetAccountInfoResult {
  const GetAccountInfoResult();

  factory GetAccountInfoResult.success({
    required CustomerAccount account,
  }) = GetAccountInfoSuccess;

  factory GetAccountInfoResult.inactive({
    required CustomerAccount account,
    required String reason,
  }) = GetAccountInfoInactive;

  factory GetAccountInfoResult.failure({
    required String error,
    required String customerId,
  }) = GetAccountInfoFailure;

  bool get isSuccess => this is GetAccountInfoSuccess;
  bool get isInactive => this is GetAccountInfoInactive;
  bool get isFailure => this is GetAccountInfoFailure;
}

class GetAccountInfoSuccess extends GetAccountInfoResult {
  final CustomerAccount account;

  const GetAccountInfoSuccess({required this.account});
}

class GetAccountInfoInactive extends GetAccountInfoResult {
  final CustomerAccount account;
  final String reason;

  const GetAccountInfoInactive({
    required this.account,
    required this.reason,
  });
}

class GetAccountInfoFailure extends GetAccountInfoResult {
  final String error;
  final String customerId;

  const GetAccountInfoFailure({
    required this.error,
    required this.customerId,
  });
}

/// Résultat de récupération des informations de crédit
abstract class GetCreditInfoResult {
  const GetCreditInfoResult();

  factory GetCreditInfoResult.success({
    required CustomerCreditInfo creditInfo,
  }) = GetCreditInfoSuccess;

  factory GetCreditInfoResult.failure({
    required String error,
    required String customerId,
  }) = GetCreditInfoFailure;

  bool get isSuccess => this is GetCreditInfoSuccess;
  bool get isFailure => this is GetCreditInfoFailure;
}

class GetCreditInfoSuccess extends GetCreditInfoResult {
  final CustomerCreditInfo creditInfo;

  const GetCreditInfoSuccess({required this.creditInfo});
}

class GetCreditInfoFailure extends GetCreditInfoResult {
  final String error;
  final String customerId;

  const GetCreditInfoFailure({
    required this.error,
    required this.customerId,
  });
}

/// Résultat de récupération des informations de consignes
abstract class GetPackagingInfoResult {
  const GetPackagingInfoResult();

  factory GetPackagingInfoResult.success({
    required CustomerPackagingInfo packagingInfo,
  }) = GetPackagingInfoSuccess;

  factory GetPackagingInfoResult.failure({
    required String error,
    required String customerId,
  }) = GetPackagingInfoFailure;

  bool get isSuccess => this is GetPackagingInfoSuccess;
  bool get isFailure => this is GetPackagingInfoFailure;
}

class GetPackagingInfoSuccess extends GetPackagingInfoResult {
  final CustomerPackagingInfo packagingInfo;

  const GetPackagingInfoSuccess({required this.packagingInfo});
}

class GetPackagingInfoFailure extends GetPackagingInfoResult {
  final String error;
  final String customerId;

  const GetPackagingInfoFailure({
    required this.error,
    required this.customerId,
  });
}

/// Résultat de mise à jour des paramètres
abstract class UpdateSettingsResult {
  const UpdateSettingsResult();

  factory UpdateSettingsResult.success({
    required CustomerSettings settings,
  }) = UpdateSettingsSuccess;

  factory UpdateSettingsResult.failure({
    required String error,
    required String customerId,
  }) = UpdateSettingsFailure;

  bool get isSuccess => this is UpdateSettingsSuccess;
  bool get isFailure => this is UpdateSettingsFailure;
}

class UpdateSettingsSuccess extends UpdateSettingsResult {
  final CustomerSettings settings;

  const UpdateSettingsSuccess({required this.settings});
}

class UpdateSettingsFailure extends UpdateSettingsResult {
  final String error;
  final String customerId;

  const UpdateSettingsFailure({
    required this.error,
    required this.customerId,
  });
}

/// Résultat de mise à jour de contact
abstract class UpdateContactResult {
  const UpdateContactResult();

  factory UpdateContactResult.success({
    required CustomerContact contact,
  }) = UpdateContactSuccess;

  factory UpdateContactResult.failure({
    required String error,
    required String customerId,
  }) = UpdateContactFailure;

  bool get isSuccess => this is UpdateContactSuccess;
  bool get isFailure => this is UpdateContactFailure;
}

class UpdateContactSuccess extends UpdateContactResult {
  final CustomerContact contact;

  const UpdateContactSuccess({required this.contact});
}

class UpdateContactFailure extends UpdateContactResult {
  final String error;
  final String customerId;

  const UpdateContactFailure({
    required this.error,
    required this.customerId,
  });
}

/// Résultat d'ajout de contact
abstract class AddContactResult {
  const AddContactResult();

  factory AddContactResult.success({
    required String contactId,
    required CustomerContact contact,
  }) = AddContactSuccess;

  factory AddContactResult.failure({
    required String error,
    required String customerId,
  }) = AddContactFailure;

  bool get isSuccess => this is AddContactSuccess;
  bool get isFailure => this is AddContactFailure;
}

class AddContactSuccess extends AddContactResult {
  final String contactId;
  final CustomerContact contact;

  const AddContactSuccess({
    required this.contactId,
    required this.contact,
  });
}

class AddContactFailure extends AddContactResult {
  final String error;
  final String customerId;

  const AddContactFailure({
    required this.error,
    required this.customerId,
  });
}

/// Résultat de suppression de contact
abstract class DeleteContactResult {
  const DeleteContactResult();

  factory DeleteContactResult.success({
    required String contactId,
  }) = DeleteContactSuccess;

  factory DeleteContactResult.failure({
    required String error,
    required String customerId,
  }) = DeleteContactFailure;

  bool get isSuccess => this is DeleteContactSuccess;
  bool get isFailure => this is DeleteContactFailure;
}

class DeleteContactSuccess extends DeleteContactResult {
  final String contactId;

  const DeleteContactSuccess({required this.contactId});
}

class DeleteContactFailure extends DeleteContactResult {
  final String error;
  final String customerId;

  const DeleteContactFailure({
    required this.error,
    required this.customerId,
  });
}
