part of 'stepper_bloc_bloc.dart';

abstract class StepperBlocState {}

class StepperBlocInitialState extends StepperBlocState {}

class StepperLoadedState extends StepperBlocState {
  final Widget currentWidget;
  StepperLoadedState({required this.currentWidget});
}

class StepperErrorState extends StepperBlocState {
  final String errorMessage;
  StepperErrorState({required this.errorMessage});
}

class StepperFinalState extends StepperBlocState {}
