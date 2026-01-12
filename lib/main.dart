import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: Haikyuu()));
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
