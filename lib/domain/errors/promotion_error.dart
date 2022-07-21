abstract class PromotionError implements Exception {
  final String message;
  final StackTrace? stackTrace;

  PromotionError(this.message, [this.stackTrace]);
}

class DataSourceError extends PromotionError {
  DataSourceError(super.message, [super.stackTrace]);
}
