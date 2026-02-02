import 'package:flutter/material.dart';
import '../models/card.dart' as card_model;
import '../providers/game_providers.dart';
import 'court_widget_for_selection.dart';

/// Screen that allows choosing a court position for a particular player.
class PositionSelectionView extends StatelessWidget {
  final GameState game;
  final List<card_model.CardModel> allCards;
  final String playerName;

  /// Called after a position is successfully selected to notify the caller.
  final Function() onPositionSelected;

  const PositionSelectionView({
    super.key,
    required this.game,
    required this.allCards,
    required this.playerName,
    required this.onPositionSelected,
  });

  @override
  Widget build(BuildContext context) {
    final playerCard = allCards.firstWhere((c) => c.name == playerName);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Select Position for ${playerCard.name}'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: CourtWidgetForSelection(
          positions: game.positions,
          playerCard: playerCard,
          onPositionSelected: (position) {
            game.setPositionPlayer(position, playerName);
            onPositionSelected();
          },
          availableCards: game.team,
        ),
      ),
    );
  }
}
