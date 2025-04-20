import 'package:flutter/material.dart';
import 'package:resistor_calculator/pages/four_band_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _closeSplash();
    super.initState();
  }

  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage("assets/images/Logo.png"),
          width: 200,
          height: 200,
        ),
      ),
    );
  }
  Future<void> _closeSplash() async{
    Future.delayed(const Duration(seconds: 2), () async{
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => FourBandPage())
      );
    });
  }
}
