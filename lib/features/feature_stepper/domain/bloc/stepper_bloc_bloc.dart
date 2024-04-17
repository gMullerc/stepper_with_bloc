import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:steper_with_bloc/entities/stepper.dart';
import 'package:steper_with_bloc/features/feature_stepper/usecases/stepper_usecase.dart';

part 'stepper_bloc_event.dart';
part 'stepper_bloc_state.dart';

class StepperBloc extends Bloc<StepperBlocEvent, StepperBlocState> {
  late int currentStep;
  final StepperUsecase usecase;

  StepperBloc({
    required this.usecase,
  }) : super(StepperBlocInitialState()) {
    currentStep = 0;
    on<EmitFirstEvent>(_emitirEstadoParaPrimeiroStepper);
    on<NextStepEvent>(_avancarPasso);
    on<PreviousStepEvent>(_voltarPasso);
  }

  _emitirEstadoParaPrimeiroStepper(EmitFirstEvent event, Emitter emit) {
    if (usecase.verificarListaVazia(event.orderedList)) {
      emit(StepperErrorState(
        errorMessage: 'Deve retornar ao menos um step.',
      ));
    } else {
      emit(StepperLoadedState(
        currentWidget: event.orderedList.first.stepper,
      ));
    }
  }

  _avancarPasso(NextStepEvent event, Emitter emit) {
    emit(StepperBlocInitialState());
    currentStep++;

    if (usecase.passoAtualUltrapassouTamanhoLista(
        currentStep, event.orderedList)) {
      emit(StepperFinalState());
    } else {
      emit(StepperLoadedState(
        currentWidget: event.orderedList[currentStep].stepper,
      ));
    }
  }

  _voltarPasso(PreviousStepEvent event, Emitter emit) {
    emit(StepperBlocInitialState());
    currentStep--;
    emit(StepperLoadedState(
      currentWidget: event.orderedList[currentStep].stepper,
    ));
  }
}
