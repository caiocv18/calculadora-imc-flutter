import 'package:calculadoraimc/pages/resultado_imc.dart';
import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  var _backgroundBotaoPeso = Colors.transparent;
  var _backgroundBotaoAltura = Colors.transparent;
  var prefixo = "";
  var peso = "";
  var altura = "";
  var sufixo = "";

  late final TextEditingController _pesoController =
      TextEditingController(text: "");
  late final TextEditingController _alturaController =
      TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    _backgroundBotaoPeso = Colors.blue;
    _backgroundBotaoAltura = Colors.transparent;
    prefixo = "Peso: ";
    peso = "";
    sufixo = " kg";
  }

  void _incrementaValor({required String valor}) {
    setState(() {
      if (prefixo == "Peso: ") {
        _pesoController.text += peso + valor;
      } else {
        _alturaController.text += peso + valor;
      }
    });
  }

  void _limpaValor() {
    setState(() {
      peso = "";
      altura = "";
      _pesoController.text = peso;
      _alturaController.text = altura;
    });
  }

  void _alteraPrefixo() {
    setState(() {
      prefixo = prefixo == "Peso: " ? "Altura: " : "Peso: ";
    });
  }

  void _alteraSufixo() {
    setState(() {
      sufixo = sufixo == " kg" ? " m" : " kg";
    });
  }

  void _alteraCorBotaoSelecionado() {
    setState(() {
      if (prefixo == "Peso: ") {
        _backgroundBotaoPeso = Colors.blue;
        _backgroundBotaoAltura = Colors.transparent;
      } else {
        _backgroundBotaoPeso = Colors.transparent;
        _backgroundBotaoAltura = Colors.blue;
      }
    });
  }

  String classificaIMC({required double imc}) {
    if (imc < 18.5) {
      return 'Abaixo do peso';
    } else if (imc >= 18.5 && imc < 24.9) {
      return 'Peso normal';
    } else if (imc >= 24.9 && imc < 29.9) {
      return 'Sobrepeso';
    } else if (imc >= 30.0 && imc < 34.9) {
      return 'Obesidade grau I';
    } else if (imc >= 35.0 && imc < 39.9) {
      return 'Obesidade grau II';
    } else {
      return 'Obesidade grau III';
    }
  }

  void _calculaIMC() {
    double valorPeso = double.parse(_pesoController.text);
    double valorAltura = double.parse(_alturaController.text);

    double resultado = valorPeso / (valorAltura * valorAltura);

    String resultadoFormatado = resultado.toStringAsFixed(1);
    double valorResulado = double.parse(resultadoFormatado);
    String classificacao = classificaIMC(imc: valorResulado);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResultadoIMC(
                resultado: resultadoFormatado, classificacao: classificacao)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(children: [
        Row(
          children: [
            Expanded(
              flex: 0,
              child: Text(
                prefixo,
                style: const TextStyle(fontSize: 44),
              ),
            ),
            Expanded(
              flex: 2,
              child: TextField(
                showCursor: true,
                readOnly: true,
                controller:
                    prefixo == "Peso: " ? _pesoController : _alturaController,
                decoration:
                    const InputDecoration(border: UnderlineInputBorder()),
                style: const TextStyle(fontSize: 44),
                textAlign: TextAlign.right,
              ),
            ),
            Expanded(
              flex: 0,
              child: Text(
                sufixo,
                style: const TextStyle(fontSize: 44),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: FittedBox(
                child: TextButton(
                  onPressed: () {
                    if (prefixo != "Peso: ") {
                      _alteraPrefixo();
                      _alteraSufixo();
                      _alteraCorBotaoSelecionado();
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(_backgroundBotaoPeso)),
                  child: const Text("Peso"),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: FittedBox(
                child: TextButton(
                  onPressed: () {
                    if (prefixo != "Altura: ") {
                      _alteraPrefixo();
                      _alteraSufixo();
                      _alteraCorBotaoSelecionado();
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(_backgroundBotaoAltura)),
                  child: const Text("Altura"),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: FittedBox(
                child: TextButton(
                  child: const Text("Limpar"),
                  onPressed: () {
                    _limpaValor();
                  },
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: FittedBox(
                child: FloatingActionButton(
                  child: const Text("7", style: TextStyle(fontSize: 30)),
                  onPressed: () {
                    _incrementaValor(valor: "7");
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: FittedBox(
                child: FloatingActionButton(
                  child: const Text("8", style: TextStyle(fontSize: 30)),
                  onPressed: () {
                    _incrementaValor(valor: "8");
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: FittedBox(
                child: FloatingActionButton(
                  child: const Text("9", style: TextStyle(fontSize: 30)),
                  onPressed: () {
                    _incrementaValor(valor: "9");
                  },
                ),
              ),
            )
          ],
        ),
        const Divider(thickness: 0),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: FittedBox(
                child: FloatingActionButton(
                  child: const Text("4", style: TextStyle(fontSize: 30)),
                  onPressed: () {
                    _incrementaValor(valor: "4");
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: FittedBox(
                child: FloatingActionButton(
                  child: const Text("5", style: TextStyle(fontSize: 30)),
                  onPressed: () {
                    _incrementaValor(valor: "5");
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: FittedBox(
                child: FloatingActionButton(
                  child: const Text("6", style: TextStyle(fontSize: 30)),
                  onPressed: () {
                    _incrementaValor(valor: "6");
                  },
                ),
              ),
            )
          ],
        ),
        const Divider(thickness: 0),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: FittedBox(
                child: FloatingActionButton(
                  child: const Text("1", style: TextStyle(fontSize: 30)),
                  onPressed: () {
                    _incrementaValor(valor: "1");
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: FittedBox(
                child: FloatingActionButton(
                    child: const Text("2", style: TextStyle(fontSize: 30)),
                    onPressed: () {
                      _incrementaValor(valor: "2");
                    }),
              ),
            ),
            Expanded(
              flex: 1,
              child: FittedBox(
                child: FloatingActionButton(
                  child: const Text("3", style: TextStyle(fontSize: 30)),
                  onPressed: () {
                    _incrementaValor(valor: "3");
                  },
                ),
              ),
            )
          ],
        ),
        const Divider(thickness: 0),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: FittedBox(
                child: FloatingActionButton(
                  child: const Text(".", style: TextStyle(fontSize: 30)),
                  onPressed: () {
                    _incrementaValor(valor: ".");
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: FittedBox(
                child: FloatingActionButton(
                  child: const Text("0", style: TextStyle(fontSize: 30)),
                  onPressed: () {
                    _incrementaValor(valor: "0");
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: FittedBox(
                child: FloatingActionButton(
                  backgroundColor: Colors.green,
                  child: const Text("IMC",
                      style: TextStyle(
                        fontSize: 15,
                      )),
                  onPressed: () {
                    _calculaIMC();
                  },
                ),
              ),
            )
          ],
        ),
      ]),
    ));
  }
}
