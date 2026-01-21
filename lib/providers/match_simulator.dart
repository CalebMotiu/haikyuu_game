import 'dart:math';
import '../models/card.dart';

class MatchResult {
  final bool won;
  final int teamScore;
  final int opponentScore;

  MatchResult({
    required this.won,
    required this.teamScore,
    required this.opponentScore,
  });
}

/// Simulates a match between the user's team and a random opponent.
class MatchSimulator {
  static double _calculateTeamStrength(List<CardModel> teamCards) {
    if (teamCards.isEmpty) return 0.0;
    double totalStrength = 0;
    for (final card in teamCards) {
      final stats = card.stats.values;
      totalStrength += stats.reduce((a, b) => a + b) / stats.length;
    }
    return totalStrength / teamCards.length;
  }

  /// Simulates a match and returns the result.
  static MatchResult simulateMatch(List<CardModel> userTeam) {
    final random = Random();
    final userStrength = _calculateTeamStrength(userTeam);
    final opponentStrength = random.nextDouble() * 10; // Opponent strength 0-10

    // Win probability based on team strength
    final winProbability = userStrength / (userStrength + opponentStrength);

    // Simulate match points until someone reaches 25
    int userScore = 0;
    int opponentScore = 0;

    while (userScore < 25 && opponentScore < 25) {
      if (random.nextDouble() < winProbability) {
        userScore++;
      } else {
        opponentScore++;
      }
    }

    final won = userScore == 25;

    return MatchResult(
      won: won,
      teamScore: userScore,
      opponentScore: opponentScore,
    );
  }
}
