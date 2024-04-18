part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class AuthenticationStatusChanged extends AuthenticationEvent {
  final bool status;
  AuthenticationStatusChanged({required this.status});
}

class LoginEvent extends AuthenticationEvent {
  LoginEvent();
}
