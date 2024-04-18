part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final FormzSubmissionStatus? formStatus;
  const AuthenticationState({
    this.status = AuthenticationStatus.unauthenticated,
    this.formStatus = FormzSubmissionStatus.initial,
  });

  AuthenticationState copyWith(
          {AuthenticationStatus? status, FormzSubmissionStatus? formStatus}) =>
      AuthenticationState(
          status: status ?? this.status,
          formStatus: formStatus ?? this.formStatus);
  @override
  List<Object?> get props => [status, formStatus];
}

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
}
