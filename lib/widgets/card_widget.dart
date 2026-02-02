import 'package:flutter/material.dart';
import '../models/card.dart';

/// Padding used inside card widgets to provide consistent spacing.
const double _kCardPadding = 5.0;

/// Abbreviates a stat name to its first three uppercase letters.
///
/// Example: 'Power' -> 'POW'
String _abbreviateStat(String stat) {
  return stat.substring(0, 3).toUpperCase();
}

/// Displays a player card with image, name, position and stat summary.
///
/// - Shows the card image (network or asset),
/// - Name and position, and
/// - A compact grid of top/bottom three stats.
class CardWidget extends StatelessWidget {
  final CardModel card;
  final bool isOwned;

  const CardWidget({super.key, required this.card, this.isOwned = false});

  @override
  Widget build(BuildContext context) {
    final statsList = card.stats.entries.toList();
    return Card(
      color: card.rarityColor,
      shape: isOwned
          ? RoundedRectangleBorder(
              side: const BorderSide(color: Colors.yellow, width: 2),
              borderRadius: BorderRadius.circular(8),
            )
          : RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(_kCardPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Card Image
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: card.imageUrl.startsWith('http')
                    ? Image.network(
                        card.imageUrl,
                        height: 82,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          height: 82,
                          width: double.infinity,
                          color: Colors.grey[700],
                          child: const Icon(
                            Icons.image_not_supported,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      )
                    : Image.asset(
                        card.imageUrl,
                        height: 82,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          height: 82,
                          width: double.infinity,
                          color: Colors.grey[700],
                          child: const Icon(
                            Icons.image_not_supported,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
              ),
              const SizedBox(height: 2),
              // Card Name
              SizedBox(
                height: 32,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4.0,
                    vertical: 2.0,
                  ),
                  child: Text(
                    card.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 2),
              // Position
              Text(
                card.position,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
              const SizedBox(height: 2),
              // Stats Grid
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    // Top 3 stats
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: _kCardPadding,
                      ),
                      child: Row(
                        children: statsList
                            .sublist(0, 3)
                            .map(
                              (e) => Expanded(
                                child: Text(
                                  '${_abbreviateStat(e.key)} ${e.value}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 7,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(height: 2),
                    // Bottom 3 stats
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: _kCardPadding,
                      ),
                      child: Row(
                        children: statsList
                            .sublist(3, 6)
                            .map(
                              (e) => Expanded(
                                child: Text(
                                  '${_abbreviateStat(e.key)} ${e.value}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 7,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
