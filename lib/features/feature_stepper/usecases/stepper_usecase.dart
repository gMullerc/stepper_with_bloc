import 'package:steper_with_bloc/entities/stepper.dart';

abstract class StepperUsecase {
  bool verificarListaVazia(List<StepperEntity> listStepperEntity);

  bool passoAtualUltrapassouTamanhoLista(
      int currentStep, List<StepperEntity> orderedList);
}

class StepperUsecaseImpl extends StepperUsecase {
  @override
  bool verificarListaVazia(List<StepperEntity> listStepperEntity) {
    return listStepperEntity.isEmpty;
  }

  @override
  bool passoAtualUltrapassouTamanhoLista(
      int currentStep, List<StepperEntity> orderedList) {
    return currentStep > orderedList.length;
  }
}
