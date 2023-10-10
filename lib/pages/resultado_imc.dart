import 'package:flutter/material.dart';

class ResultadoIMC extends StatelessWidget {
  final String resultado;
  final String classificacao;
  const ResultadoIMC(
      {Key? key, required this.resultado, required this.classificacao})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Resultado'),
          ),
          body: Center(
            child: Column(
              children: [
                Text("IMC = $resultado", style: const TextStyle(fontSize: 44)),
                Text("Classificação: $classificacao ",
                    style: const TextStyle(fontSize: 30)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Voltar'),
                ),
              ],
            ),
          )),
    );
  }
}
