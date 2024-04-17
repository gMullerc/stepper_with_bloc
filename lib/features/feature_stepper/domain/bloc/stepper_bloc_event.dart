part of 'stepper_bloc_bloc.dart';

abstract class StepperBlocEvent {}

class NextStepEvent extends StepperBlocEvent {
  final List<StepperEntity> orderedList;
  NextStepEvent({required this.orderedList});
}

class PreviousStepEvent extends StepperBlocEvent {
  final List<StepperEntity> orderedList;
  PreviousStepEvent({required this.orderedList});
}

class EmitFirstEvent extends StepperBlocEvent {
  final List<StepperEntity> orderedList;

  EmitFirstEvent({required this.orderedList});
}
