import 'dart:async';

import 'package:aberno_test/core/data/singletons/storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  late StreamSubscription<bool> statusSubscription;
  AuthenticationBloc() : super(const AuthenticationState()) {
    statusSubscription = Stream.fromFuture(Future.delayed(
      const Duration(seconds: 2),
      () {
        return StorageRepository.getBool(StoreKeys.isAuthenticated);
      },
    )).listen((event) {
      add(AuthenticationStatusChanged(status: event));
    });
    on<AuthenticationStatusChanged>((event, emit) async {
      if (event.status) {
        await StorageRepository.putBool(
            key: StoreKeys.isAuthenticated, value: true);
        emit(state.copyWith(status: AuthenticationStatus.authenticated));
      } else {
        await StorageRepository.putBool(
            key: StoreKeys.isAuthenticated, value: false);
        emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
      }
    });
    on<LoginEvent>((event, emit) async {
      emit(state.copyWith(formStatus: FormzSubmissionStatus.inProgress));
      await Future.delayed(const Duration(seconds: 3));

      await StorageRepository.putBool(
          key: StoreKeys.isAuthenticated, value: true);
      emit(state.copyWith(
          status: AuthenticationStatus.authenticated,
          formStatus: FormzSubmissionStatus.success));
    });
  }
  @override
  Future<void> close() {
    statusSubscription.cancel();
    return super.close();
  }
}
