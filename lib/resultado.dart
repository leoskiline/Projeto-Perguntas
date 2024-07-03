import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int totalScore;
  final void Function() restartQuestions;

  const Resultado(this.restartQuestions, this.totalScore, {super.key});

  String get phraseResult {
    if (totalScore < 8) {
      return 'Parabens!';
    } else if (totalScore < 12) {
      return 'Voce e bom!';
    } else if (totalScore < 16) {
      return 'Impressionante!';
    } else {
      return 'Nivel Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            phraseResult,
            style: const TextStyle(fontSize: 28),
          ),
          ElevatedButton(
            onPressed: restartQuestions,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            child: const Text('Reiniciar'),
          ),
          TextButton(
            onPressed: restartQuestions,
            child: const Text('Voltar'),
          ),
        ],
      ),
    );
  }
}
