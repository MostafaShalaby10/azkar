part of 'prayer_cubit.dart';

@immutable
sealed class PrayerState {}

final class PrayerInitial extends PrayerState {}

final class LoadingGetPrayerTime extends PrayerState {}

final class SuccessfullyGetPrayerTime extends PrayerState {}

final class ErrorGetPrayerTime extends PrayerState {
  final String error;

  ErrorGetPrayerTime({required this.error});
}
