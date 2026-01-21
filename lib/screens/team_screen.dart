import 'package:flutter/material.dart';
import '../models/card.dart' as card_model;
import '../providers/game_providers.dart';
import '../widgets/card_widget.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final game = GameStateProvider.of(context);
    final allCards = card_model.allCards;
    final owned = game.owned;
    final team = game.team;

    final ownedCards = allCards.where((c) => owned.contains(c.name)).toList();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Team (${team.length}/7)'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          if (team.isNotEmpty)
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: team.length,
                itemBuilder: (context, index) {
                  final name = team[index];
                  final card = allCards.firstWhere((c) => c.name == name);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () => game.removeFromTeam(card.name),
                      child: CardWidget(card: card, isOwned: true),
                    ),
                  );
                },
              ),
            ),
          const Divider(color: Colors.white),
          Expanded(
            child: LayoutBuilder(
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
                  itemCount: ownedCards.length,
                  itemBuilder: (context, index) {
                    final card = ownedCards[index];
                    final inTeam = team.contains(card.name);
                    return GestureDetector(
                      onTap: () {
                        if (inTeam) {
                          game.removeFromTeam(card.name);
                        } else {
                          game.addToTeam(card.name);
                        }
                      },
                      child: Stack(
                        children: [
                          CardWidget(card: card, isOwned: true),
                          if (inTeam)
                            const Positioned(
                              top: 0,
                              right: 0,
                              child: Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
