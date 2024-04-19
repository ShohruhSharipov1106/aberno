part of 'call_bloc.dart';

class CallState extends Equatable {
  final FormzSubmissionStatus? formStatus;
  const CallState({this.formStatus = FormzSubmissionStatus.initial});

  CallState copyWith({FormzSubmissionStatus? formStatus}) =>
      CallState(formStatus: formStatus ?? this.formStatus);
  @override
  List<Object?> get props => [formStatus];
}
