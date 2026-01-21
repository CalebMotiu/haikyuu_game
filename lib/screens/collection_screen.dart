import 'package:flutter/material.dart';
import '../models/card.dart' as card_model;
import '../providers/game_providers.dart';
import '../widgets/card_widget.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final game = GameStateProvider.of(context);
    final allCards = card_model.allCards;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Collection'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = 3;
          if (constraints.maxWidth > 600) crossAxisCount = 4;
          if (constraints.maxWidth > 900) crossAxisCount = 5;
          if (constraints.maxWidth > 1200) crossAxisCount = 6;

          return GridView.builder(
            padding: const EdgeInsets.all(10.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.65,
            ),
            itemCount: allCards.length,
            itemBuilder: (context, index) {
              final card = allCards[index];
              final isOwned = game.hasCard(card.name);
              return CardWidget(card: card, isOwned: isOwned);
            },
          );
        },
      ),
    );
  }
}
