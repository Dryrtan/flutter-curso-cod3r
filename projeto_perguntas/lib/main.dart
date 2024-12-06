import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() {
  runApp(PerguntasApp());
}

class _PerguntasAppState extends State<PerguntasApp> {
  int _perguntasRespondidas = 0;
  Map<String, int> _pontuacaoTotal = {
    'pontuacao': 0,
    'questao-1': 0,
    'questao-2': 0,
    'questao-3': 0
  };
  final _perguntas = [
    {
      'pergunta': 'Qual sua cor favorita?',
      'respostas': [
        {'texto': 'Azul', 'pontuacao': 10},
        {'texto': 'Verde', 'pontuacao': 7},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Preto', 'pontuacao': 3}
      ]
    },
    {
      'pergunta': 'Qual seu animal favorito?',
      'respostas': [
        {'texto': 'Cachorro', 'pontuacao': 10},
        {'texto': 'Gato', 'pontuacao': 7},
        {'texto': 'Elefante', 'pontuacao': 5},
        {'texto': 'Leão', 'pontuacao': 3},
      ],
    },
    {
      'pergunta': 'Qual seu instrutor favorito?',
      'respostas': [
        {'texto': 'Leonardo', 'pontuacao': 10},
        {'texto': 'Maria', 'pontuacao': 7},
        {'texto': 'João', 'pontuacao': 5},
        {'texto': 'Pedro', 'pontuacao': 3},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntasRespondidas++;
        _pontuacaoTotal['pontuacao'] =
            (_pontuacaoTotal['pontuacao'] ?? 0) + pontuacao;
        _pontuacaoTotal['questao-$_perguntasRespondidas'] = pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntasRespondidas = 0;
      _pontuacaoTotal = {
        'pontuacao': 0,
        'questao-1': 0,
        'questao-2': 0,
        'questao-3': 0
      };
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntasRespondidas < _perguntas.length;
  }

  String get contalizarPerguntas {
    if ((_perguntasRespondidas + 1) <= _perguntas.length) {
      return '${(_perguntasRespondidas + 1)}/${_perguntas.length}';
    } else {
      return 'Resultado Final';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text('Perguntas - $contalizarPerguntas'),
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            centerTitle: true),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntasRespondidas: _perguntasRespondidas,
                quandoresponder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntasApp extends StatefulWidget {
  const PerguntasApp({super.key});

  @override
  _PerguntasAppState createState() {
    return _PerguntasAppState();
  }
}
