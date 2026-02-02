import 'package:flutter/material.dart';
import '../models/card.dart' as card_model;
import '../providers/game_providers.dart';
import '../widgets/team_view.dart';
import '../widgets/position_selection_view.dart';

/// Top-level Team screen which toggles between the team view and
/// the position-selection screen when managing players.
class TeamScreen extends StatefulWidget {
  const TeamScreen({super.key});

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  String? selectedPlayerForPosition;

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
      body: selectedPlayerForPosition == null
          ? TeamView(
              game: game,
              allCards: allCards,
              owned: owned,
              team: team,
              ownedCards: ownedCards,
              onPlayerSelected: (playerName) {
                setState(() {
                  selectedPlayerForPosition = playerName;
                });
              },
            )
          : PositionSelectionView(
              game: game,
              allCards: allCards,
              playerName: selectedPlayerForPosition!,
              onPositionSelected: () {
                setState(() {
                  selectedPlayerForPosition = null;
                });
              },
            ),
    );
  }
}
