import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final Map<String, int> pontuacaoTotal;
  final void Function() quandoReiniciarQuestionario;

  const Resultado(this.pontuacaoTotal, this.quandoReiniciarQuestionario,
      {super.key});

  get pesonalizacaoResultado {
    if ((pontuacaoTotal['pontuacao'] ?? 0) < 10) {
      return {'texto': 'Parabens!', 'imagem': 'assets/parabens.gif'};
    } else if ((pontuacaoTotal['pontuacao'] ?? 0) < 16) {
      return {'texto': 'Voce e muito bom!', 'imagem': 'assets/voce_e_bom.gif'};
    } else if ((pontuacaoTotal['pontuacao'] ?? 0) < 22) {
      return {'texto': 'Nivel Jedi!', 'imagem': 'assets/jedi.gif'};
    } else {
      return {'texto': 'Nivel Super Saiyan!', 'imagem': 'assets/saiyajin.gif'};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
            image: AssetImage(pesonalizacaoResultado['imagem'] as String),
            height: 300,
            width: 300),
        Center(
            child: Text(
          pesonalizacaoResultado['texto'] as String,
          style: const TextStyle(fontSize: 25),
        )),
        Center(child: criaTabela()),
        Center(
          child: Text(
            'Total: ${pontuacaoTotal['pontuacao']}',
            style: const TextStyle(fontSize: 20),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.blue),
            foregroundColor: WidgetStateProperty.all(Colors.white),
            shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
            padding: WidgetStateProperty.all(const EdgeInsets.all(15)),
          ),
          onPressed: quandoReiniciarQuestionario,
          child: const Text('Reiniciar'),
        ),
      ],
    );
  }

  criaTabela() {
    return Table(
      defaultColumnWidth: const FixedColumnWidth(150.0),
      border: const TableBorder(
        horizontalInside: BorderSide(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        verticalInside: BorderSide(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        left: BorderSide(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        right: BorderSide(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        top: BorderSide(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        bottom: BorderSide(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 1.0,
        ),
      ),
      children: [
        _criarLinhaTable("Questão, Pontos"),
        _criarLinhaTable("1, ${pontuacaoTotal['questao-1'] ?? 0}"),
        _criarLinhaTable("2, ${pontuacaoTotal['questao-2'] ?? 0}"),
        _criarLinhaTable("3, ${pontuacaoTotal['questao-3'] ?? 0}"),
      ],
    );
  }

  _criarLinhaTable(String listaNomes) {
    return TableRow(
      children: listaNomes.split(',').map((name) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name,
            style: const TextStyle(fontSize: 20.0),
          ),
        );
      }).toList(),
    );
  }
}
