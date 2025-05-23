part of 'sebha_cubit.dart';

@immutable
sealed class SebhaState {}

final class SebhaInitial extends SebhaState {}

final class LoadingAddCounterState extends SebhaState {}

final class SuccessfullyAddCounterState extends SebhaState {}

final class ErrorAddCounterState extends SebhaState {
  final String error;
  ErrorAddCounterState({required this.error});
}

final class LoadingGetCounterState extends SebhaState {}

final class SuccessfullyGetCounterState extends SebhaState {
  SuccessfullyGetCounterState();
}

final class ErrorGetCounterState extends SebhaState {
  final String error;
  ErrorGetCounterState({required this.error});
}

final class LoadingResetCounterState extends SebhaState {}

final class SuccessfullyResetCounterState extends SebhaState {
  SuccessfullyResetCounterState();
}

final class ErrorResetCounterState extends SebhaState {
  final String error;
  ErrorResetCounterState({required this.error});
}
