import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steper_with_bloc/entities/stepper.dart';
import 'package:steper_with_bloc/features/feature_stepper/di/stepper_module.dart';
import 'package:steper_with_bloc/features/feature_stepper/domain/bloc/stepper_bloc_bloc.dart';
import 'package:steper_with_bloc/features/feature_stepper/domain/presentation/components/header_stepper.dart';
import 'package:steper_with_bloc/main.dart';

class StepperPage extends StatefulWidget {
  final List<StepperEntity> steppers;
  final Function finalizarStep;

  const StepperPage({
    Key? key,
    required this.steppers,
    required this.finalizarStep,
  }) : super(key: key);

  @override
  State<StepperPage> createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  late StepperBloc stepperBloc;

  @override
  void initState() {
    super.initState();
    StepperModule.init();

    stepperBloc = getIt.get<StepperBloc>();
    stepperBloc.add(EmitFirstEvent(
      orderedList: widget.steppers,
    ));
  }

  @override
  void dispose() {
    StepperModule.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 25),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: false,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.steppers.length,
          itemBuilder: (context, index) => BlocBuilder(
              bloc: stepperBloc,
              builder: (context, state) {
                return HeaderStepper(
                  stepNumber: index,
                  currentStep: stepperBloc.currentStep,
                );
              }),
        ),
      ),
      body: BlocConsumer<StepperBloc, StepperBlocState>(
        listener: (context, state) {
          if (state is StepperFinalState) {
            widget.finalizarStep();
          }
        },
        bloc: stepperBloc,
        builder: (context, state) {
          if (state is StepperLoadedState) {
            return state.currentWidget;
          } else if (state is StepperErrorState) {
            return const Text('error');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
              onPressed: () {
                stepperBloc.add(PreviousStepEvent(
                  orderedList: widget.steppers,
                ));
              },
              child: const Text('voltar')),
          ElevatedButton(
              onPressed: () {
                stepperBloc.add(NextStepEvent(
                  orderedList: widget.steppers,
                ));
              },
              child: const Text('avancar'))
        ],
      ),
    );
  }
}
