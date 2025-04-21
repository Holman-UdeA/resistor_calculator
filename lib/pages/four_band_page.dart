import 'package:flutter/material.dart';

class FourBandPage extends StatefulWidget {
  const FourBandPage({super.key});

  @override
  State<FourBandPage> createState() => _FourBandPageState();
}

class _FourBandPageState extends State<FourBandPage> {
  int valueBand1 = 0;
  int valueBand2 = 0;
  double valueMutiplier = 1.0;
  String valueTolerance = "±1%";
  String result = "";

  String calculateResistance() {
    double value = ((valueBand1 * 10) + valueBand2) * valueMutiplier;
    String suffix = "Ω";

    if (value >= 1e9) {
      value /= 1e9;
      suffix = "GΩ";
    } else if (value >= 1e6) {
      value /= 1e6;
      suffix = "MΩ";
    } else if (value >= 1e3) {
      value /= 1e3;
      suffix = "kΩ";
    }

    return "${value.toStringAsFixed(2)} $suffix $valueTolerance";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    value: valueBand1,
                    items: const [
                      DropdownMenuItem(child: Text("Negro"), value: 0),
                      DropdownMenuItem(child: Text("Marron"), value: 1),
                      DropdownMenuItem(child: Text("Rojo"), value: 2),
                      DropdownMenuItem(child: Text("Naranja"), value: 3),
                      DropdownMenuItem(child: Text("Amarillo"), value: 4),
                      DropdownMenuItem(child: Text("Verde"), value: 5),
                      DropdownMenuItem(child: Text("Azul"), value: 6),
                      DropdownMenuItem(child: Text("Violeta"), value: 7),
                      DropdownMenuItem(child: Text("Gris"), value: 8),
                      DropdownMenuItem(child: Text("Blanco"), value: 9),
                    ],
                    onChanged: (NewValue) {
                      setState(() {
                        valueBand1 = NewValue!;
                        print(valueBand1);
                      });
                    },
                    isExpanded: true,
                  ),
                  const SizedBox(height: 16),
                  DropdownButton(
                    value: valueBand2,
                    items: const [
                      DropdownMenuItem(child: Text("Negro"), value: 0),
                      DropdownMenuItem(child: Text("Marron"), value: 1),
                      DropdownMenuItem(child: Text("Rojo"), value: 2),
                      DropdownMenuItem(child: Text("Naranja"), value: 3),
                      DropdownMenuItem(child: Text("Amarillo"), value: 4),
                      DropdownMenuItem(child: Text("Verde"), value: 5),
                      DropdownMenuItem(child: Text("Azul"), value: 6),
                      DropdownMenuItem(child: Text("Violeta"), value: 7),
                      DropdownMenuItem(child: Text("Gris"), value: 8),
                      DropdownMenuItem(child: Text("Blanco"), value: 9),
                    ],
                    onChanged: (newValue) {
                      setState(() {
                        valueBand2 = newValue!;
                      });
                    },
                    isExpanded: true,
                  ),
                  const SizedBox(height: 16),
                  DropdownButton(
                    value: valueMutiplier,
                    items: const [
                      DropdownMenuItem(child: Text("Negro (×1)"), value: 1.0),
                      DropdownMenuItem(child: Text("Marrón (×10)"), value: 10.0,),
                      DropdownMenuItem(child: Text("Rojo (×100)"), value: 100.0),
                      DropdownMenuItem(child: Text("Naranja (×1k)"), value: 1000.0),
                      DropdownMenuItem(child: Text("Amarillo (×10k)"), value: 10000.0),
                      DropdownMenuItem(child: Text("Verde (×100k)"), value: 100000.0),
                      DropdownMenuItem(child: Text("Azul (×1M)"), value: 1000000.0),
                      DropdownMenuItem(child: Text("Violeta (×10M)"), value: 10000000.0),
                      DropdownMenuItem(child: Text("Gris (×100M)"), value: 100000000.0),
                      DropdownMenuItem(child: Text("Blanco (×1G)"), value: 1000000000.0),
                      DropdownMenuItem(child: Text("Dorado (×0.1)"), value: 0.1),
                      DropdownMenuItem(child: Text("Plateado (×0.01)"), value: 0.01),
                    ],
                    onChanged: (newValue) {
                      setState(() {
                        valueMutiplier = newValue!;
                      });
                    },
                    isExpanded: true,
                  ),
                  const SizedBox(height: 16),
                  DropdownButton(
                    value: valueTolerance,
                    items: const [
                      DropdownMenuItem(child: Text("Marrón (±1%)"), value: "±1%"),
                      DropdownMenuItem(child: Text("Rojo (±2%)"), value: "±2%"),
                      DropdownMenuItem(child: Text("Dorado (±5%)"), value: "±5%"),
                      DropdownMenuItem(child: Text("Plateado (±10%)"), value: "±10%"),
                    ],
                    onChanged: (newValue) {
                      setState(() {
                        valueTolerance = newValue!;
                      });
                    },
                    isExpanded: true,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        result = calculateResistance();
                      });
                    },
                    child: const Text("Calcular Resistencia"),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    result,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
