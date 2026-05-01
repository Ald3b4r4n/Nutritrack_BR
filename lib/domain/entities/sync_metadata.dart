/// Metadados de sincronização futura com backend.
class SyncMetadata {
  final String entityId;
  final String entityName;
  final DateTime lastModifiedLocal;
  final DateTime? syncedAt;
  final bool isDirty;

  const SyncMetadata({
    required this.entityId,
    required this.entityName,
    required this.lastModifiedLocal,
    this.syncedAt,
    required this.isDirty,
  });
}
