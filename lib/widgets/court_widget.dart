import 'package:flutter/material.dart';
import '../models/card.dart' as card_model;
import '../providers/game_providers.dart';

/// Displays a simplified volleyball court and position slots.
///
/// Each slot shows a player (photo) if assigned or an indicator when empty.
class CourtWidget extends StatelessWidget {
  /// Map from position key to assigned player name (or null).
  final Map<String, String?> positions; // e.g., {'setter': 'Player Name', ...}

  /// Callback when a position is changed: (positionKey, playerName).
  final Function(String, String) onPositionChanged;

  /// List of available player names to consider for assignment.
  final List<String> availableCards;

  const CourtWidget({
    super.key,
    required this.positions,
    required this.onPositionChanged,
    required this.availableCards,
  });

  /// Builds the court layout with position slots.
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.yellow.shade700,
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Column(
        children: [
          // Top row: Wing Spiker, Middle Blocker, Outside Hitter
          Row(
            children: [
              Expanded(
                child: _buildPositionSlot(
                  context,
                  position: 'Wing Spiker',
                  playerName: positions['Wing Spiker'],
                  availableCards: availableCards,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildPositionSlot(
                  context,
                  position: 'Middle Blocker',
                  playerName: positions['Middle Blocker'],
                  availableCards: availableCards,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildPositionSlot(
                  context,
                  position: 'Outside Hitter',
                  playerName: positions['Outside Hitter'],
                  availableCards: availableCards,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Bottom row: Outside Hitter, Middle Blocker, Setter
          Row(
            children: [
              Expanded(
                child: _buildPositionSlot(
                  context,
                  position: 'Outside Hitter',
                  playerName: positions['Outside Hitter 2'],
                  positionKey: 'Outside Hitter 2',
                  availableCards: availableCards,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildPositionSlot(
                  context,
                  position: 'Middle Blocker',
                  playerName: positions['Middle Blocker 2'],
                  positionKey: 'Middle Blocker 2',
                  availableCards: availableCards,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildPositionSlot(
                  context,
                  position: 'Setter',
                  playerName: positions['Setter'],
                  availableCards: availableCards,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Libero centered
          Center(
            child: FractionallySizedBox(
              widthFactor: 0.28,
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  _buildPositionSlot(
                    context,
                    position: 'Libero',
                    playerName: positions['Libero'],
                    availableCards: availableCards,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds a tappable slot for [position].
  ///
  /// [position] is the human-readable position (used to filter eligible cards).
  /// [positionKey] is the map key used for assignments (useful for duplicate roles).
  Widget _buildPositionSlot(
    BuildContext context, {
    required String position,
    required String? playerName,
    required List<String> availableCards,
    String? positionKey,
  }) {
    final allCards = card_model.allCards;
    final key = positionKey ?? position;

    // Get eligible players for this position
    final eligiblePlayers = availableCards.where((cardName) {
      final card = allCards.firstWhere(
        (c) => c.name == cardName,
        orElse: () =>
            card_model.CardModel('', card_model.Rarity.common, '', {}, ''),
      );
      return card.position == position;
    }).toList();

    final currentCard = playerName != null
        ? allCards.firstWhere(
            (c) => c.name == playerName,
            orElse: () =>
                card_model.CardModel('', card_model.Rarity.common, '', {}, ''),
          )
        : null;

    return GestureDetector(
      onTap: eligiblePlayers.isEmpty && playerName == null
          ? null
          : () {
              if (eligiblePlayers.isNotEmpty) {
                // Show selection dialog (whether position is occupied or not)
                _showSelectionDialog(context, key, eligiblePlayers);
              }
            },
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: playerName != null ? Colors.green : Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(4),
          color: eligiblePlayers.isEmpty && playerName == null
              ? Colors.grey.shade300
              : Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              position,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            if (playerName != null)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: currentCard!.imageUrl.isNotEmpty
                      ? Image.asset(currentCard.imageUrl, fit: BoxFit.cover)
                      : Container(
                          decoration: BoxDecoration(
                            color: currentCard.rarityColor,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Center(
                            child: Text(
                              playerName,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 8,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                ),
              )
            else if (eligiblePlayers.isNotEmpty)
              const Icon(Icons.add_circle, color: Colors.green, size: 24)
            else
              const Icon(Icons.block, color: Colors.red, size: 24),
          ],
        ),
      ),
    );
  }

  /// Shows a simple picker dialog listing [eligiblePlayers] for [position].
  ///
  /// When the user selects a player the [onPositionChanged] callback is
  /// invoked and the dialog is dismissed.
  void _showSelectionDialog(
    BuildContext context,
    String position,
    List<String> eligiblePlayers,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Select $position'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            itemCount: eligiblePlayers.length,
            itemBuilder: (context, index) {
              final playerName = eligiblePlayers[index];
              return ListTile(
                title: Text(playerName),
                onTap: () {
                  onPositionChanged(position, playerName);
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
