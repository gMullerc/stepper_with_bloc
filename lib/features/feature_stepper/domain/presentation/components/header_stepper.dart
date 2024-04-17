import 'package:flutter/material.dart';

class HeaderStepper extends StatelessWidget {
  final int stepNumber;
  final int currentStep;

  const HeaderStepper({
    Key? key,
    required this.stepNumber,
    required this.currentStep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stepNumberAdded = stepNumber + 1;
    final currentStepAdded = currentStep + 1;

    Color verificarCorAtual() {
      if (currentStepAdded == stepNumberAdded) {
        return Colors.amber;
      }
      if (stepNumberAdded < currentStepAdded) {
        return Colors.green;
      }
      return Colors.black;
    }

    return SafeArea(
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                border: Border.all(),
                color: verificarCorAtual(),
                borderRadius: const BorderRadius.all(
                  Radius.circular(25),
                )),
            child: Text(
              stepNumberAdded.toString(),
            ),
          ),
        ],
      ),
    );
  }
}
