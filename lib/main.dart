import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'providers/game_providers.dart';

void main() {
  runApp(const GameStateContainer(child: Haikyuu()));
}

class Haikyuu extends StatelessWidget {
  const Haikyuu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Haikyuu Card Game',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.orange),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
