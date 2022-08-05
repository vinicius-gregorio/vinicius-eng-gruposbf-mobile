abstract class CartError implements Exception {
  final String message;
  final StackTrace? stackTrace;

  CartError(this.message, [this.stackTrace]);
}

class DataSourceError extends CartError {
  DataSourceError(super.message, [super.stackTrace]);
}
