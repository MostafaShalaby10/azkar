part of 'azkar_cubit.dart';

@immutable
sealed class AzkarState {}

final class AzkarInitial extends AzkarState {}

final class LoadingGetAzkar extends AzkarState {}

final class SuccessfullyGetAzkar extends AzkarState {}

final class ErrorGetAzkar extends AzkarState {
  final String error;
  ErrorGetAzkar(this.error);
}
