part of 'notification_cubit.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}
final class CheckNotificationState extends NotificationState {}
final class GetNotificationTimeState extends NotificationState {}
final class ChangeMorningNotificationTimeState extends NotificationState {}
final class ChangeEveningNotificationTimeState extends NotificationState {}
