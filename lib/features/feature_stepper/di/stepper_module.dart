import 'package:steper_with_bloc/features/feature_stepper/domain/bloc/stepper_bloc_bloc.dart';
import 'package:steper_with_bloc/features/feature_stepper/usecases/stepper_usecase.dart';
import 'package:steper_with_bloc/main.dart';

class StepperModule {
  static void init() => getIt.pushNewScope(
        scopeName: _stepperModule,
        init: (getIt) {
          getIt.registerFactory<StepperUsecase>(() => StepperUsecaseImpl());
          getIt.registerFactory(() => StepperBloc(usecase: getIt.get()));
        },
      );

  static void dispose() => getIt.dropScope(_stepperModule);

  static const String _stepperModule = "stepperModule";
}
