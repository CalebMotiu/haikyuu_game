import 'dart:math';
import 'package:flutter/material.dart';
import '../models/card.dart' as card_model;

/// A simple ChangeNotifier-based game state used by an InheritedNotifier.
class GameState extends ChangeNotifier {
  final Set<String> owned = {};
  final List<String> team = [];

  List<card_model.CardModel> get allCards => card_model.allCards;

  void addCard(String name) {
    if (!owned.contains(name)) {
      owned.add(name);
      notifyListeners();
    }
  }

  bool hasCard(String name) => owned.contains(name);

  void addToTeam(String name) {
    if (team.length < 7 && !team.contains(name)) {
      team.add(name);
      notifyListeners();
    }
  }

  void removeFromTeam(String name) {
    team.remove(name);
    notifyListeners();
  }

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

/// InheritedNotifier to provide GameState to the widget tree.
class GameStateProvider extends InheritedNotifier<GameState> {
  const GameStateProvider({
    super.key,
    required super.notifier,
    required super.child,
  });

  static GameState of(BuildContext context) {
    final provider = context
        .dependOnInheritedWidgetOfExactType<GameStateProvider>();
    assert(provider != null, 'GameStateProvider not found in context');
    return provider!.notifier!;
  }
}

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
