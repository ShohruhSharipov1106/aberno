part of 'show_pop_up_bloc.dart';

@immutable
abstract class ShowPopUpEvent {}

class ShowPopUp extends ShowPopUpEvent {
  final String message;
  final bool isSuccess;
  final bool isNotification;
  ShowPopUp(
      {required this.message,
      this.isSuccess = false,
      this.isNotification = false});
}

class HidePopUp extends ShowPopUpEvent {}
