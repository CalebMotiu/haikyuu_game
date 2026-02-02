import 'package:flutter/material.dart';
import '../models/card.dart' as card_model;

/// A court view specialized for selecting a position for a single [playerCard].
///
/// Highlights eligible positions and allows selecting them to place the player.
class CourtWidgetForSelection extends StatelessWidget {
  /// Current position assignments (key -> player name)
  final Map<String, String?> positions;

  /// The card being placed on the court.
  final card_model.CardModel playerCard;

  /// Called when the user selects a position key to place [playerCard].
  final Function(String) onPositionSelected;

  /// List of player names currently assigned to the team (used to show occupancy).
  final List<String> availableCards;

  const CourtWidgetForSelection({
    super.key,
    required this.positions,
    required this.playerCard,
    required this.onPositionSelected,
    required this.availableCards,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.yellow.shade700,
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top row: Wing Spiker, Middle Blocker, Outside Hitter
            Row(
              children: [
                Expanded(
                  child: _buildSelectablePositionSlot(
                    context,
                    position: 'Wing Spiker',
                    currentPlayer: positions['Wing Spiker'],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildSelectablePositionSlot(
                    context,
                    position: 'Middle Blocker',
                    currentPlayer: positions['Middle Blocker'],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildSelectablePositionSlot(
                    context,
                    position: 'Outside Hitter',
                    currentPlayer: positions['Outside Hitter'],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Bottom row: Outside Hitter, Middle Blocker, Setter
            Row(
              children: [
                Expanded(
                  child: _buildSelectablePositionSlot(
                    context,
                    position: 'Outside Hitter',
                    positionKey: 'Outside Hitter 2',
                    currentPlayer: positions['Outside Hitter 2'],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildSelectablePositionSlot(
                    context,
                    position: 'Middle Blocker',
                    positionKey: 'Middle Blocker 2',
                    currentPlayer: positions['Middle Blocker 2'],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildSelectablePositionSlot(
                    context,
                    position: 'Setter',
                    currentPlayer: positions['Setter'],
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
                    _buildSelectablePositionSlot(
                      context,
                      position: 'Libero',
                      currentPlayer: positions['Libero'],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a tappable, selectable slot used when placing [playerCard].
  ///
  /// - [position] is the human-readable role label shown to the user.
  /// - [positionKey] is the internal map key for assignments (used for second-of-type roles).
  /// - [currentPlayer] indicates whether the slot is occupied.
  Widget _buildSelectablePositionSlot(
    BuildContext context, {
    required String position,
    required String? currentPlayer,
    String? positionKey,
  }) {
    final isEligible = playerCard.position == position;
    final isOccupied = currentPlayer != null;
    final key = positionKey ?? position;

    return GestureDetector(
      onTap: isEligible
          ? () {
              onPositionSelected(key);
            }
          : null,
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: isEligible ? Colors.green : Colors.red,
            width: isEligible ? 3 : 2,
          ),
          borderRadius: BorderRadius.circular(4),
          color: !isEligible
              ? Colors.red.shade300
              : isOccupied
              ? Colors.orange.shade300
              : Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              position,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: isEligible ? Colors.black : Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            if (isOccupied)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Center(
                      child: Text(
                        currentPlayer!,
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
            else if (isEligible)
              const Icon(Icons.check_circle, color: Colors.green, size: 24)
            else
              const Icon(Icons.block, color: Colors.red, size: 24),
          ],
        ),
      ),
    );
  }
}
