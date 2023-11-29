part of 'Login_bloc.dart';

@immutable
sealed class AuthEvent {}

final class PhoneNumEvent extends AuthEvent {
  final String phoneNumber;

  PhoneNumEvent({required this.phoneNumber});
}

final class CodeEvent extends AuthEvent {
  final String code;

  CodeEvent({required this.code});
}
