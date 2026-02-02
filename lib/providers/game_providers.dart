import 'dart:math';
import 'package:flutter/material.dart';
import '../models/card.dart' as card_model;

/// A simple ChangeNotifier-based game state used by an InheritedNotifier.
class GameState extends ChangeNotifier {
  final Set<String> owned = {};
  final List<String> team = [];

  // Position-based team layout: position -> player name
  final Map<String, String?> positions = {
    'Setter': null,
    'Wing Spiker': null,
    'Middle Blocker': null,
    'Middle Blocker 2': null,
    'Outside Hitter': null,
    'Outside Hitter 2': null,
    'Libero': null,
  };

  List<card_model.CardModel> get allCards => card_model.allCards;

  /// Adds a card to the player's owned collection.
  ///
  /// Notifies listeners only when the card was not already owned.
  void addCard(String name) {
    if (!owned.contains(name)) {
      owned.add(name);
      notifyListeners();
    }
  }

  bool hasCard(String name) => owned.contains(name);

  /// Adds a player to the team list if there is space (7 players max).
  ///
  /// Does nothing if the player is already on the team.
  void addToTeam(String name) {
    if (team.length < 7 && !team.contains(name)) {
      team.add(name);
      notifyListeners();
    }
  }

  /// Removes a player from the team list and notifies listeners.
  void removeFromTeam(String name) {
    team.remove(name);
    notifyListeners();
  }

  /// Assigns a player to a court [position].
  ///
  /// If [playerName] is empty the position is cleared and the player
  /// is removed from the team list. If a player is already assigned to
  /// another position, that assignment is cleared first.
  void setPositionPlayer(String position, String playerName) {
    if (playerName.isEmpty) {
      // Remove player from position
      final currentPlayer = positions[position];
      if (currentPlayer != null) {
        team.remove(currentPlayer);
        positions[position] = null;
        notifyListeners();
      }
    } else {
      // Check if player is already in another position
      final currentPosition = positions.entries
          .firstWhere(
            (e) => e.value == playerName,
            orElse: () => MapEntry('', null),
          )
          .key;

      if (currentPosition.isNotEmpty) {
        positions[currentPosition] = null;
      }

      // Add player to position
      if (!team.contains(playerName)) {
        team.add(playerName);
      }
      positions[position] = playerName;
      notifyListeners();
    }
  }

  /// Generates a random 5-card pack using rarity tiers.
  ///
  /// Uses [_getRandomRarity] to pick a rarity, then selects a random
  /// card of that rarity (falls back to the full card pool if needed).
  List<card_model.CardModel> generatePack() {
    final random = Random();
    List<card_model.CardModel> pack = [];
    for (int i = 0; i < 5; i++) {
      final rarity = _getRandomRarity(random);
      var cardsOfRarity = card_model.allCards
          .where((c) => c.rarity == rarity)
          .toList();
      if (cardsOfRarity.isEmpty) cardsOfRarity = card_model.allCards;
      pack.add(cardsOfRarity[random.nextInt(cardsOfRarity.length)]);
    }
    return pack;
  }

  card_model.Rarity _getRandomRarity(Random random) {
    double rand = random.nextDouble();
    if (rand < 0.005) return card_model.Rarity.legendary;
    if (rand < 0.005 + 0.045) return card_model.Rarity.epic;
    if (rand < 0.005 + 0.045 + 0.15) return card_model.Rarity.rare;
    return card_model.Rarity.common;
  }
}

/// Provides [GameState] down the widget tree using [InheritedNotifier].
class GameStateProvider extends InheritedNotifier<GameState> {
  const GameStateProvider({
    super.key,
    required super.notifier,
    required super.child,
  });

  /// Returns the current [GameState] from the [BuildContext].
  ///
  /// Asserts if the provider is not found.
  static GameState of(BuildContext context) {
    final provider = context
        .dependOnInheritedWidgetOfExactType<GameStateProvider>();
    assert(provider != null, 'GameStateProvider not found in context');
    return provider!.notifier!;
  }
}

/// Top-level container that creates the [GameState] and exposes it via
/// [GameStateProvider].
class GameStateContainer extends StatefulWidget {
  final Widget child;
  const GameStateContainer({super.key, required this.child});

  @override
  State<GameStateContainer> createState() => _GameStateContainerState();
}

class _GameStateContainerState extends State<GameStateContainer> {
  final GameState state = GameState();

  @override
  Widget build(BuildContext context) {
    return GameStateProvider(notifier: state, child: widget.child);
  }
}
