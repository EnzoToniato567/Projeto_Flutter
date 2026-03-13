import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'IMC', home: App()));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  String? nome;
  double peso = 0.0;
  double altura = 0.0;
  double imc = 0.0;
  String? resultado;

  void calcular() {
    imc = peso / (altura * altura);

    String classificacao;
    if (imc < 18.5) {
      classificacao = "Magreza";
    } else if (imc < 24.9) {
      classificacao = "Normal";
    } else if (imc < 29.9) {
      classificacao = "Sobrepeso";
    } else if (imc < 34.9) {
      classificacao = "Obesidade grau I";
    } else if (imc < 39.9) {
      classificacao = "Obesidade grau II";
    } else {
      classificacao = "Obesidade grau III";
    }

    resultado =
        "$nome seu IMC é ${imc.toStringAsFixed(1)}. Classificação: $classificacao";
  }

  void alert(BuildContext context, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Mensagens"),
          content: Text(msg),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Ok"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20.0,
            children: [
              Text(
                "Índice de Massa Corpórea",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 100, 0, 0),
                ),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Nome"),
                onChanged: (value) {
                  nome = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: "Peso"),
                onChanged: (value) {
                  peso = double.parse(value);
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: "Altura"),
                onChanged: (value) {
                  altura = double.parse(value);
                },
              ),
              ElevatedButton(
                onPressed: () {
                  calcular();
                  alert(context, "$resultado");
                },
                child: Text("Calcular"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
