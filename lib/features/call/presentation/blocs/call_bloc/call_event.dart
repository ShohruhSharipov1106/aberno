part of 'call_bloc.dart';

abstract class CallEvent {}

class CheckDayOff extends CallEvent {
  final ValueChanged<bool> whenCompleted;
  CheckDayOff({required this.whenCompleted});
}
