import 'package:flutter/material.dart';
import 'package:resistor_calculator/pages/five_band_page.dart';
import 'package:resistor_calculator/pages/six_band_page.dart';
import 'four_band_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    FourBandPage(),
    FiveBandPage(),
    SixBandPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculadora de Resistencias',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_4),
            label: '4 bandas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_5),
            label: '5 bandas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_6),
            label: '6 bandas',
          ),
        ],
      ),
    );
  }
}