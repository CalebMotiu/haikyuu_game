import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/card.dart';
import '../providers/game_providers.dart';
import '../widgets/card_widget.dart';

class TeamScreen extends ConsumerWidget {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allCards = ref.watch(allCardsProvider);
    final owned = ref.watch(ownedCardsProvider);
    final team = ref.watch(teamProvider);
    final teamNotifier = ref.read(teamProvider.notifier);

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
          // Current Team
          if (team.isNotEmpty)
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: team.length,
                itemBuilder: (context, index) {
                  final name = team[index];
                  final card = allCards.firstWhere((c) => c.name == name);
                  return SizedBox(width: 100, child: CardWidget(card: card));
                },
              ),
            ),
          const Divider(color: Colors.white),
          // Owned Cards
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.7,
              ),
              itemCount: ownedCards.length,
              itemBuilder: (context, index) {
                final card = ownedCards[index];
                final inTeam = team.contains(card.name);
                return GestureDetector(
                  onTap: () {
                    if (inTeam) {
                      teamNotifier.removeFromTeam(card.name);
                    } else {
                      teamNotifier.addToTeam(card.name);
                    }
                  },
                  child: Stack(
                    children: [
                      CardWidget(card: card, isOwned: true),
                      if (inTeam)
                        const Positioned(
                          top: 0,
                          right: 0,
                          child: Icon(Icons.check_circle, color: Colors.green),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
