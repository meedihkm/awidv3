import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_task.freezed.dart';

/// Statut de tâche de production
enum TaskStatus {
  pending, // En attente
  assigned, // Assignée
  inProgress, // En cours
  paused, // En pause
  completed, // Terminée
  cancelled, // Annulée
}

/// Priorité de tâche
enum TaskPriority {
  low,
  normal,
  high,
  urgent,
}

/// Type de tâche
enum TaskType {
  preparation, // Préparation
  cooking, // Cuisson
  assembly, // Assemblage
  packaging, // Emballage
  quality, // Contrôle qualité
  cleaning, // Nettoyage
}

/// Entité représentant une tâche de production
@freezed
class ProductionTask with _$ProductionTask {
  const factory ProductionTask({
    required String id,
    required String orderId,
    required String orderNumber,
    required TaskType type,
    required TaskStatus status,
    required TaskPriority priority,
    required String description,
    required DateTime createdAt,
    DateTime? scheduledAt,
    DateTime? startedAt,
    DateTime? completedAt,
    String? assignedStationId,
    String? assignedStationName,
    String? assignedStaffId,
    String? assignedStaffName,
    int? estimatedDuration,
    List<TaskStep>? steps,
    List<String>? requiredEquipment,
    List<String>? requiredIngredients,
    String? notes,
    String? completionNotes,
    @Default(false) bool isBlocking,
    @Default(false) bool requiresQualityCheck,
  }) = _ProductionTask;

  const ProductionTask._();

  /// Durée réelle en minutes
  int? get actualDuration {
    if (startedAt == null) return null;
    final endTime = completedAt ?? DateTime.now();
    return endTime.difference(startedAt!).inMinutes;
  }

  /// Temps écoulé depuis création
  int get elapsedMinutes {
    return DateTime.now().difference(createdAt).inMinutes;
  }

  /// Est en retard
  bool get isLate {
    if (estimatedDuration == null || startedAt == null) return false;
    final elapsed = DateTime.now().difference(startedAt!).inMinutes;
    return elapsed > estimatedDuration!;
  }

  /// Temps restant estimé
  int? get remainingMinutes {
    if (estimatedDuration == null || startedAt == null) return null;
    final elapsed = DateTime.now().difference(startedAt!).inMinutes;
    final remaining = estimatedDuration! - elapsed;
    return remaining > 0 ? remaining : 0;
  }

  /// Progression en pourcentage
  double get progressPercentage {
    if (steps == null || steps!.isEmpty) {
      return status == TaskStatus.completed ? 100 : 0;
    }
    final completedSteps = steps!.where((s) => s.isCompleted).length;
    return (completedSteps / steps!.length) * 100;
  }

  /// Peut être démarrée
  bool get canStart {
    return status == TaskStatus.pending || status == TaskStatus.assigned;
  }

  /// Peut être mise en pause
  bool get canPause {
    return status == TaskStatus.inProgress;
  }

  /// Peut être reprise
  bool get canResume {
    return status == TaskStatus.paused;
  }

  /// Peut être complétée
  bool get canComplete {
    return status == TaskStatus.inProgress && 
           (steps == null || steps!.every((s) => s.isCompleted));
  }

  /// Prochaine étape à effectuer
  TaskStep? get nextStep {
    if (steps == null) return null;
    try {
      return steps!.firstWhere((s) => !s.isCompleted);
    } catch (_) {
      return null;
    }
  }
}

/// Étape d'une tâche
@freezed
class TaskStep with _$TaskStep {
  const factory TaskStep({
    required String id,
    required int order,
    required String description,
    int? estimatedMinutes,
    DateTime? startedAt,
    DateTime? completedAt,
    String? completedBy,
    String? notes,
    @Default(false) bool isCompleted,
    @Default(false) bool isOptional,
    @Default(false) bool requiresVerification,
  }) = _TaskStep;

  const TaskStep._();

  /// Durée réelle en minutes
  int? get actualDuration {
    if (startedAt == null || completedAt == null) return null;
    return completedAt!.difference(startedAt!).inMinutes;
  }

  /// Est en cours
  bool get isInProgress {
    return startedAt != null && !isCompleted;
  }
}

/// Checklist de qualité
@freezed
class QualityChecklist with _$QualityChecklist {
  const factory QualityChecklist({
    required String id,
    required String taskId,
    required List<QualityCheckItem> items,
    DateTime? completedAt,
    String? completedBy,
    String? notes,
    @Default(false) bool isPassed,
  }) = _QualityChecklist;

  const QualityChecklist._();

  /// Nombre d'items validés
  int get passedItemsCount {
    return items.where((i) => i.isPassed).length;
  }

  /// Pourcentage de réussite
  double get passRate {
    if (items.isEmpty) return 0;
    return (passedItemsCount / items.length) * 100;
  }

  /// Tous les items sont validés
  bool get allItemsPassed {
    return items.every((i) => i.isPassed);
  }
}

/// Item de contrôle qualité
@freezed
class QualityCheckItem with _$QualityCheckItem {
  const factory QualityCheckItem({
    required String id,
    required String description,
    required bool isPassed,
    String? notes,
    DateTime? checkedAt,
    String? checkedBy,
  }) = _QualityCheckItem;
}

/// Blocage de tâche
@freezed
class TaskBlocker with _$TaskBlocker {
  const factory TaskBlocker({
    required String id,
    required String taskId,
    required String reason,
    required DateTime createdAt,
    DateTime? resolvedAt,
    String? resolvedBy,
    String? resolution,
    @Default(false) bool isResolved,
  }) = _TaskBlocker;

  const TaskBlocker._();

  /// Durée du blocage en minutes
  int get durationMinutes {
    final endTime = resolvedAt ?? DateTime.now();
    return endTime.difference(createdAt).inMinutes;
  }

  /// Est actif
  bool get isActive {
    return !isResolved;
  }
}
