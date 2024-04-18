part of 'show_pop_up_bloc.dart';

class ShowPopUpState extends Equatable {
  final String message;
  final bool showPopUp;
  final bool isSuccess;
  final bool isNotification;
  const ShowPopUpState({
    required this.message,
    required this.showPopUp,
    required this.isSuccess,
    required this.isNotification,
  });

  ShowPopUpState copyWith(
          {String? message,
          bool? showPopUp,
          bool? isSuccess,
          bool? isNotification}) =>
      ShowPopUpState(
        message: message ?? this.message,
        showPopUp: showPopUp ?? this.showPopUp,
        isSuccess: isSuccess ?? this.isSuccess,
        isNotification: isNotification ?? this.isNotification,
      );
  @override
  List<Object?> get props => [showPopUp, message, isSuccess, isNotification];
}
