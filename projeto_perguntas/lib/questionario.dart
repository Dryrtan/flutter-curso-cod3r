import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resposta.dart';
import 'questao.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntasRespondidas;
  final void Function(int) quandoresponder;

  const Questionario(
      {super.key,
      required this.perguntas,
      required this.perguntasRespondidas,
      required this.quandoresponder});

  bool get temPerguntaSelecionada {
    return perguntasRespondidas < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntasRespondidas]['respostas']
            as List<Map<String, Object>>
        : [];
    return Column(children: <Widget>[
      Questao(perguntas[perguntasRespondidas]['pergunta'] as String),
      ...respostas.map((resp) => Resposta(resp['texto'] as String,
          () => quandoresponder(resp['pontuacao'] as int)))
    ]);
  }
}
