abstract class AppBarState {}

class LoadingAppBarState extends AppBarState {}

class SuccessAppBarState extends AppBarState {
  final double cartLength;

  SuccessAppBarState(this.cartLength);
}

class ErrorAppBarState extends AppBarState {
  final String message;

  ErrorAppBarState(this.message);
}
