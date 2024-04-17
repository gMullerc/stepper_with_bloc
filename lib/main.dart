import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:steper_with_bloc/entities/stepper.dart';
import 'package:steper_with_bloc/features/feature_stepper/domain/presentation/stepper.dart';

final getIt = GetIt.asNewInstance();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StepperPage(
        finalizarStep: () => print('resetei'),
        steppers: const <StepperEntity>[
          StepperEntity(
            stepper: Text('teste'),
          ),
          StepperEntity(
            stepper: Text('teste2'),
          ),
          StepperEntity(
            stepper: Text('teste3'),
          ),
        ],
      ),
    );
  }
}
