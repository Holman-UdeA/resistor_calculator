import 'package:flutter/material.dart';

class FiveBandPage extends StatefulWidget {
  const FiveBandPage({super.key});

  @override
  State<FiveBandPage> createState() => _FiveBandPageState();
}

class _FiveBandPageState extends State<FiveBandPage> {
  int valueBand1 = 0;
  int valueBand2 = 0;
  int valueBand3 = 0;
  double valueMultiplier = 1.0;
  String valueTolerance = "±1%";
  String result = "";

  //Funcion para calcular el valor de la resistencia
  String calculateResistance() {
    double value =
        (((valueBand1 * 100) + (valueBand2 * 10)) + valueBand3) *
        valueMultiplier;
    String suffix = "Ω";

    //Se simplifa el resultado usando notacion cientifica
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

    if (value == value.toInt()) {
      return "${value.toInt()} $suffix $valueTolerance"; // Sin decimales
    } else {
      return "${value.toStringAsPrecision(3)} $suffix $valueTolerance";
    }
  }

  //Funciones usada para cambiar el color del underliner e icono
  Color getColorFromValue(int value) {
    switch (value) {
      case 0:
        return Colors.black;
      case 1:
        return Color(0xFF8B4513);
      case 2:
        return Colors.red;
      case 3:
        return Colors.orange;
      case 4:
        return Colors.yellow;
      case 5:
        return Colors.green;
      case 6:
        return Colors.blue;
      case 7:
        return Colors.purple;
      case 8:
        return Colors.grey;
      case 9:
        return Color(0xFFB0B0B0);
      default:
        return Colors.black;
    }
  }

  Color getMultiplierColor(double value) {
    switch (value) {
      case 1.0:
        return Colors.black;
      case 10.0:
        return const Color(0xFF8B4513);
      case 100.0:
        return Colors.red;
      case 1000.0:
        return Colors.orange;
      case 10000.0:
        return Colors.yellow.shade700;
      case 100000.0:
        return Colors.green;
      case 1000000.0:
        return Colors.blue;
      case 10000000.0:
        return Colors.purple;
      case 100000000.0:
        return Colors.grey;
      case 1000000000.0:
        return Color(0xFFB0B0B0);
      case 0.1:
        return Color(0xFFB8860B); // Dorado
      case 0.01:
        return Color(0xFFB0B0B0); // Plateado
      default:
        return Colors.black;
    }
  }

  Color getToleranceColor(String value) {
    switch (value) {
      case "±1%":
        return Color(0xFF8B4513);
      case "±2%":
        return Colors.red;
      case "±5%":
        return Color(0xFFB8860B);
      case "±10%":
        return Color(0xFFC0C0C0);
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage("assets/images/resistor_page.png"),
                    width: 190,
                    height: 140,
                  ),
                  const SizedBox(height: 5),
                  //Banda 1
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Color de banda 1:",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  DropdownButton(
                    value: valueBand1,
                    items: const [
                      DropdownMenuItem(
                        value: 0,
                        child: Text(
                          "Negro",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 1,
                        child: Text(
                          "Marrón",
                          style: TextStyle(color: Color(0xFF8B4513)),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 2,
                        child: Text(
                          "Rojo",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 3,
                        child: Text(
                          "Naranja",
                          style: TextStyle(color: Colors.orange),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 4,
                        child: Text(
                          "Amarillo",
                          style: TextStyle(color: Colors.yellow),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 5,
                        child: Text(
                          "Verde",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 6,
                        child: Text(
                          "Azul",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 7,
                        child: Text(
                          "Violeta",
                          style: TextStyle(color: Colors.purple),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 8,
                        child: Text(
                          "Gris",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 9,
                        child: Text(
                          "Blanco",
                          style: TextStyle(color: Color(0xFFB0B0B0)),
                        ),
                      ),
                    ],
                    onChanged: (newValue) {
                      setState(() {
                        valueBand1 = newValue!;
                      });
                    },
                    isExpanded: true,
                    iconSize: 30,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: getColorFromValue(valueBand1),
                    ),
                    underline: Container(
                      height: 2,
                      color: getColorFromValue(
                        valueBand1,
                      ), // Línea inferior de color
                    ),
                  ),
                  const SizedBox(height: 16),
                  //Banda 2
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Color de banda 2:",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  DropdownButton(
                    value: valueBand2,
                    items: const [
                      DropdownMenuItem(
                        value: 0,
                        child: Text(
                          "Negro",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 1,
                        child: Text(
                          "Marron",
                          style: TextStyle(color: Color(0xFF8B4513)),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 2,
                        child: Text(
                          "Rojo",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 3,
                        child: Text(
                          "Naranja",
                          style: TextStyle(color: Colors.orange),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 4,
                        child: Text(
                          "Amarillo",
                          style: TextStyle(color: Colors.yellow),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 5,
                        child: Text(
                          "Verde",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 6,
                        child: Text(
                          "Azul",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 7,
                        child: Text(
                          "Violeta",
                          style: TextStyle(color: Colors.purple),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 8,
                        child: Text(
                          "Gris",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 9,
                        child: Text(
                          "Blanco",
                          style: TextStyle(color: Color(0xFFB0B0B0)),
                        ),
                      ),
                    ],
                    onChanged: (newValue) {
                      setState(() {
                        valueBand2 = newValue!;
                      });
                    },
                    isExpanded: true,
                    iconSize: 30,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: getColorFromValue(valueBand2),
                    ),
                    underline: Container(
                      height: 2,
                      color: getColorFromValue(valueBand2),
                    ),
                  ),
                  const SizedBox(height: 16),
                  //Banda 3
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Color de banda 3:",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  DropdownButton(
                    value: valueBand3,
                    items: const [
                      DropdownMenuItem(
                        value: 0,
                        child: Text(
                          "Negro",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 1,
                        child: Text(
                          "Marron",
                          style: TextStyle(color: Color(0xFF8B4513)),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 2,
                        child: Text(
                          "Rojo",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 3,
                        child: Text(
                          "Naranja",
                          style: TextStyle(color: Colors.orange),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 4,
                        child: Text(
                          "Amarillo",
                          style: TextStyle(color: Colors.yellow),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 5,
                        child: Text(
                          "Verde",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 6,
                        child: Text(
                          "Azul",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 7,
                        child: Text(
                          "Violeta",
                          style: TextStyle(color: Colors.purple),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 8,
                        child: Text(
                          "Gris",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 9,
                        child: Text(
                          "Blanco",
                          style: TextStyle(color: Color(0xFFB0B0B0)),
                        ),
                      ),
                    ],
                    onChanged: (newValue) {
                      setState(() {
                        valueBand3 = newValue!;
                      });
                    },
                    isExpanded: true,
                    iconSize: 30,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: getColorFromValue(valueBand3),
                    ),
                    underline: Container(
                      height: 2,
                      color: getColorFromValue(valueBand3),
                    ),
                  ),
                  const SizedBox(height: 16),
                  //Banda de multiplicador
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Color de multiplicador:",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  DropdownButton(
                    value: valueMultiplier,
                    items: const [
                      DropdownMenuItem(
                        value: 1.0,
                        child: Text(
                          "Negro (×1)",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 10.0,
                        child: Text(
                          "Marrón (×10)",
                          style: TextStyle(color: Color(0xFF8B4513)),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 100.0,
                        child: Text(
                          "Rojo (×100)",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 1000.0,
                        child: Text(
                          "Naranja (×1k)",
                          style: TextStyle(color: Colors.orange),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 10000.0,
                        child: Text(
                          "Amarillo (×10k)",
                          style: TextStyle(color: Colors.yellow),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 100000.0,
                        child: Text(
                          "Verde (×100k)",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 1000000.0,
                        child: Text(
                          "Azul (×1M)",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      //Se agregan colores adicionales a los mostrados en la guia para mejor funcionamiento
                      DropdownMenuItem(
                        value: 10000000.0,
                        child: Text(
                          "Violeta (×10M)",
                          style: TextStyle(color: Colors.purple),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 100000000.0,
                        child: Text(
                          "Gris (×100M)",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 1000000000.0,
                        child: Text(
                          "Blanco (×1G)",
                          style: TextStyle(color: Color(0xFFB0B0B0)),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 0.1,
                        child: Text(
                          "Dorado (×0.1)",
                          style: TextStyle(color: Color(0xFFB8860B)),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 0.01,
                        child: Text(
                          "Plateado (×0.01)",
                          style: TextStyle(color: Color(0xFFC0C0C0)),
                        ),
                      ),
                    ],
                    onChanged: (newValue) {
                      setState(() {
                        valueMultiplier = newValue!;
                      });
                    },
                    isExpanded: true,
                    iconSize: 30,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: getMultiplierColor(valueMultiplier),
                    ),
                    underline: Container(
                      height: 2,
                      color: getMultiplierColor(valueMultiplier),
                    ),
                  ),
                  const SizedBox(height: 16),
                  //Banda de tolerancia
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Color de tolerancia:",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  DropdownButton(
                    value: valueTolerance,
                    items: const [
                      DropdownMenuItem(
                        value: "±1%",
                        child: Text(
                          "Marrón (±1%)",
                          style: TextStyle(color: Color(0xFF8B4513)),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "±2%",
                        child: Text(
                          "Rojo (±2%)",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "±5%",
                        child: Text(
                          "Dorado (±5%)",
                          style: TextStyle(color: Color(0xFFB8860B)),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "±10%",
                        child: Text(
                          "Plateado (±10%)",
                          style: TextStyle(color: Color(0xFFC0C0C0)),
                        ),
                      ),
                    ],
                    onChanged: (newValue) {
                      setState(() {
                        valueTolerance = newValue!;
                      });
                    },
                    isExpanded: true,
                    iconSize: 30,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: getToleranceColor(valueTolerance),
                    ),
                    underline: Container(
                      height: 2,
                      color: getToleranceColor(valueTolerance),
                    ),
                  ),
                  const SizedBox(height: 20),
                  //Boton para realizar el calculo de la resistencia
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        result = calculateResistance();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("Calcular Resistencia"),
                  ),
                  const SizedBox(height: 24),
                  //Se muestra el valor de la resistencia calculado
                  Text(
                    result,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
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
