import 'package:flutter/material.dart';
import 'team_screen.dart';
import 'collection_screen.dart';
import 'pack_screen.dart';
import '../providers/game_providers.dart';
import '../providers/match_simulator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1; // Start with Home

  static const List<Widget> _widgetOptions = <Widget>[
    TeamScreen(),
    HomeContent(),
    CollectionScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Team'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections),
            label: 'Collection',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  MatchResult? matchResult;

  void _simulateMatch() {
    final game = GameStateProvider.of(context);
    final team = game.team;
    final allCards = game.allCards;

    if (team.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add players to your team first!')),
      );
      return;
    }

    final userTeam = allCards.where((c) => team.contains(c.name)).toList();
    final result = MatchSimulator.simulateMatch(userTeam);

    setState(() {
      matchResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  // Logo Area
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.sports_volleyball,
                            size: 80,
                            color: Colors.orange,
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Haikyuu Card Game',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Centered buttons take remaining space and center content
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              final game = GameStateProvider.of(context);
                              final pack = game.generatePack();
                              for (var card in pack) {
                                game.addCard(card.name);
                              }
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PackScreen(cards: pack),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 12,
                              ),
                            ),
                            child: const Text('Open Pack'),
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: _simulateMatch,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 12,
                              ),
                            ),
                            child: const Text('Simulate Match'),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Match Result Display
                  if (matchResult != null)
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        border: Border.all(
                          color: matchResult!.won ? Colors.green : Colors.red,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Text(
                            matchResult!.won ? '🎉 YOU WON! 🎉' : '❌ YOU LOST',
                            style: TextStyle(
                              color: matchResult!.won
                                  ? Colors.green
                                  : Colors.red,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    'Your Team',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '${matchResult!.teamScore}',
                                    style: const TextStyle(
                                      color: Colors.orange,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                'vs',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'Opponent',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '${matchResult!.opponentScore}',
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
