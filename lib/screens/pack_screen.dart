import 'package:flutter/material.dart';
import '../models/card.dart';
import '../widgets/card_widget.dart';

class PackScreen extends StatelessWidget {
  final List<CardModel> cards;

  const PackScreen({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pack Opened'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Responsive grid: 3 cards on small screens, 4+ on larger
          int crossAxisCount = 3;
          if (constraints.maxWidth > 600) {
            crossAxisCount = 4;
          }
          if (constraints.maxWidth > 900) {
            crossAxisCount = 5;
          }
          if (constraints.maxWidth > 1200) {
            crossAxisCount = 6;
          }

          return GridView.builder(
            padding: const EdgeInsets.all(10.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.65,
            ),
            itemCount: cards.length,
            itemBuilder: (context, index) {
              final card = cards[index];
              return CardWidget(card: card);
            },
          );
        },
      ),
    );
  }
}
