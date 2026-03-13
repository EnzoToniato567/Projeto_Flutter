import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String nome = '';
  String resultado = 'Resultado';
  double peso = 0.0;
  double imc = 0.0;
  double altura = 0.0;

  void processar() {
    setState(() {
      imc = peso / (altura * altura);

      if (imc < 18.5) {
        resultado =
            "$nome, seu IMC é ${imc.toStringAsFixed(1)}. Você está abaixo do peso.";
      } else if (imc <= 24.9) {
        resultado =
            "$nome, seu IMC é ${imc.toStringAsFixed(2)}. Você está no peso normal.";
      } else if (imc <= 29.9) {
        resultado =
            "$nome, seu IMC é ${imc.toStringAsFixed(2)}. Você está na pré-obesidade.";
      } else if (imc <= 34.9) {
        resultado =
            "$nome, seu IMC é ${imc.toStringAsFixed(2)}. Você está na obesidade nível 1.";
      } else if (imc <= 39.9) {
        resultado =
            "$nome, seu IMC é ${imc.toStringAsFixed(2)}. Você está na obesidade nível 2.";
      } else {
        resultado =
            "$nome, seu IMC é ${imc.toStringAsFixed(2)}. Você está na obesidade nível 3.";
      }
    });

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Diagnóstico"),
          content: Text(resultado),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Índice de massa corporal',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 205, 208),
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Nome'),
                onChanged: (value) {
                  nome = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Peso'),
                keyboardType: const TextInputType.numberWithOptions(),
                onChanged: (value) {
                  peso = double.tryParse(value) ?? 0.0;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Altura'),
                keyboardType: const TextInputType.numberWithOptions(),
                onChanged: (value) {
                  altura = double.tryParse(value) ?? 0.0;
                },
              ),
              ElevatedButton(
                onPressed: processar,
                child: const Text("Calcular"),
              ),
              Text(resultado),
            ],
          ),
        ),
      ),
    );
  }
}
