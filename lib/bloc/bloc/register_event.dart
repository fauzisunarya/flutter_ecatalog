part of 'register_bloc.dart';

abstract class RegisterEvent {}

class DoRegisterEvent extends RegisterEvent {
  final RegisterRequestModel model;

  DoRegisterEvent(this.model);
}
