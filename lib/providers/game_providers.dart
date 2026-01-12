import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/card.dart';

// Provider for all cards
final allCardsProvider = Provider<List<CardModel>>((ref) => allCards);

// Owned cards
final ownedCardsProvider = NotifierProvider<OwnedCardsNotifier, Set<String>>(
  () => OwnedCardsNotifier(),
);

class OwnedCardsNotifier extends Notifier<Set<String>> {
  @override
  Set<String> build() => {};

  void addCard(String name) {
    state = {...state, name};
  }

  bool hasCard(String name) {
    return state.contains(name);
  }
}

// Team
final teamProvider = NotifierProvider<TeamNotifier, List<String>>(
  () => TeamNotifier(),
);

class TeamNotifier extends Notifier<List<String>> {
  @override
  List<String> build() => [];

  void addToTeam(String name) {
    if (state.length < 7 && !state.contains(name)) {
      state = [...state, name];
    }
  }

  void removeFromTeam(String name) {
    state = state.where((n) => n != name).toList();
  }
}

// Pack generator
final packGeneratorProvider = Provider((ref) => PackGenerator());

class PackGenerator {
  List<CardModel> generatePack() {
    final random = Random();
    List<CardModel> pack = [];
    for (int i = 0; i < 5; i++) {
      Rarity rarity = _getRandomRarity(random);
      List<CardModel> cardsOfRarity = allCards
          .where((c) => c.rarity == rarity)
          .toList();
      CardModel card = cardsOfRarity[random.nextInt(cardsOfRarity.length)];
      pack.add(card);
    }
    return pack;
  }

  Rarity _getRandomRarity(Random random) {
    double rand = random.nextDouble();
    if (rand < 0.005) return Rarity.legendary; // 0.5%
    if (rand < 0.005 + 0.045) return Rarity.epic; // 4.5%
    if (rand < 0.005 + 0.045 + 0.15) return Rarity.rare; // 15%
    return Rarity.common; // 80%
  }
}
