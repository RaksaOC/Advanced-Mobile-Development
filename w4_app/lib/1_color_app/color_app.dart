import 'package:flutter/material.dart';
import 'models/color_service.dart';

final colorService = ColorService();

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex == 0
          ? ListenableBuilder(
              listenable: colorService,
              builder: (context, child) => ColorTapsScreen(),
            )
          : ListenableBuilder(
              listenable: colorService,
              builder: (context, child) => StatisticsScreen(),
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.tap_and_play),
            label: 'Taps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
        ],
      ),
    );
  }
}

class ColorTapsScreen extends StatelessWidget {
  const ColorTapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Color Taps')),
      body: Column(
        children: [
          ColorTap(type: ColorType.red),
          ColorTap(type: ColorType.blue),
          ColorTap(type: ColorType.green),
          ColorTap(type: ColorType.yellow),
        ],
      ),
    );
  }
}

class ColorTap extends StatelessWidget {
  final ColorType type;

  const ColorTap({super.key, required this.type});

  Color get _backgroundColor {
    switch (type) {
      case ColorType.red:
        return Colors.red;
      case ColorType.green:
        return Colors.green;
      case ColorType.yellow:
        return Colors.yellow;
      case ColorType.blue:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final count = colorService.getCount(type);
    return GestureDetector(
      onTap: () => colorService.increment(type),
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 100,
        child: Center(
          child: Text(
            'Taps: $count',
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counts = colorService.counts;
    return Scaffold(
      appBar: AppBar(title: const Text('Statistics')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: counts.entries
            .map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Number of ColorType.${e.key.name} = ${e.value}',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
