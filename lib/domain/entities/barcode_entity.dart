/// Entidade representando um vínculo barcode ↔ FoodItem.
class BarcodeEntity {
  final String barcode;
  final String foodItemId;
  final DateTime scannedAt;

  const BarcodeEntity({
    required this.barcode,
    required this.foodItemId,
    required this.scannedAt,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BarcodeEntity && other.barcode == barcode;
  }

  @override
  int get hashCode => barcode.hashCode;
}
