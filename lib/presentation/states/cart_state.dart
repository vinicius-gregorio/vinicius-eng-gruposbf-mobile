abstract class CartState {}

class InitialCartState extends CartState {}

class SuccessCartState extends CartState {}

class EmptyCartState extends CartState {}

class LoadingCartState extends CartState {}

class ErrorCartState extends CartState {
  final String message;
  ErrorCartState(this.message);
}
