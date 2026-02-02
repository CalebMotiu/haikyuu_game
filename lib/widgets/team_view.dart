import 'package:flutter/material.dart';
import '../models/card.dart' as card_model;
import '../providers/game_providers.dart';
import 'card_widget.dart';
import 'court_widget.dart';

/// The main view that shows the court and the player's card collection.
///
/// Handles the grid of owned cards and delegates selection/removal actions
/// to the parent via [onPlayerSelected].
class TeamView extends StatelessWidget {
  final GameState game;
  final List<card_model.CardModel> allCards;
  final Set<String> owned;
  final List<String> team;
  final List<card_model.CardModel> ownedCards;

  /// Callback invoked when a player from the grid is selected
  /// (either to place or to edit their position).
  final Function(String) onPlayerSelected;

  const TeamView({
    super.key,
    required this.game,
    required this.allCards,
    required this.owned,
    required this.team,
    required this.ownedCards,
    required this.onPlayerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Court positioning section
          CourtWidget(
            positions: game.positions,
            onPositionChanged: (position, playerName) {
              game.setPositionPlayer(position, playerName);
            },
            availableCards: game.team,
          ),
          const Divider(color: Colors.white, thickness: 2),
          // Team list view
          // (kept commented out - enable if needed)
          const Divider(color: Colors.white),
          // All owned cards grid
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
                          onPlayerSelected(card.name);
                        } else {
                          game.addToTeam(card.name);
                        }
                      },
                      onLongPress: () {
                        if (inTeam) {
                          game.removeFromTeam(card.name);
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
                          if (inTeam)
                            Positioned(
                              top: 0,
                              left: 0,
                              child: GestureDetector(
                                onTap: () {
                                  game.removeFromTeam(card.name);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  padding: const EdgeInsets.all(4.0),
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
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
