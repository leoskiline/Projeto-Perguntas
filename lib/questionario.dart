import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final int selectedQuestion;
  final List<Map<String, Object>> questions;
  final void Function(int) answer;

  const Questionario({
    required this.selectedQuestion,
    required this.questions,
    required this.answer,
    super.key,
  });

  bool get hasSelectedQuestion {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = hasSelectedQuestion
        ? questions[selectedQuestion]['respostas'] as List<Map<String, Object>>
        : [];
    List<Widget> widgets = answers
        .map((resp) => Resposta(
              resp['texto'] as String,
              () => answer(int.parse(resp['pontuacao'].toString())),
            ))
        .toList();

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Questao(questions[selectedQuestion]['texto'].toString()),
          ...widgets,
        ],
      ),
    );
  }
}
