import 'package:flutter/material.dart';

@immutable
sealed class AuthEvent {}

final class SendNumberEvent extends AuthEvent {
  final String phoneNumber;

  SendNumberEvent({required this.phoneNumber});
}

final class SendCodeEvent extends AuthEvent {
  final String code;

  SendCodeEvent({required this.code});
}
