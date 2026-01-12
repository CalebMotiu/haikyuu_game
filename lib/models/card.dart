import 'package:flutter/material.dart';

enum Rarity { common, rare, epic, legendary }

class CardModel {
  final String name;
  final Rarity rarity;
  final String position;
  final Map<String, int>
  stats; // e.g., {'Power': 10, 'Speed': 8, 'Technique': 9, 'Stamina': 7, 'Defense': 6, 'Agility': 5}
  final String imageUrl;

  CardModel(this.name, this.rarity, this.position, this.stats, this.imageUrl);

  // Helper to get rarity color
  Color get rarityColor {
    switch (rarity) {
      case Rarity.common:
        return Colors.grey;
      case Rarity.rare:
        return Colors.blue;
      case Rarity.epic:
        return Colors.purple;
      case Rarity.legendary:
        return Colors.orange;
    }
  }
}

// List of all possible cards
final List<CardModel> allCards = [
  // Common
  CardModel('Hinata Shoyo', Rarity.common, 'Middle Blocker', {
    'Power': 3,
    'Speed': 4,
    'Technique': 2,
    'Stamina': 3,
    'Defense': 2,
    'Agility': 5,
  }, './assets/hinata.png'),
  CardModel(
    'Tadashi Yamaguchi',
    Rarity.common,
    'Outside Hitter',
    {
      'Power': 2,
      'Speed': 3,
      'Technique': 3,
      'Stamina': 4,
      'Defense': 3,
      'Agility': 3,
    },
    'https://via.placeholder.com/150?text=Yamaguchi',
  ),
  CardModel(
    'Ryunosuke Tanaka',
    Rarity.common,
    'Wing Spiker',
    {
      'Power': 4,
      'Speed': 3,
      'Technique': 2,
      'Stamina': 5,
      'Defense': 4,
      'Agility': 2,
    },
    'https://via.placeholder.com/150?text=Tanaka',
  ),
  CardModel(
    'Asahi Azumane',
    Rarity.common,
    'Outside Hitter',
    {
      'Power': 5,
      'Speed': 2,
      'Technique': 3,
      'Stamina': 4,
      'Defense': 5,
      'Agility': 1,
    },
    'https://via.placeholder.com/150?text=Asahi',
  ),
  CardModel(
    'Kei Tsukishima',
    Rarity.common,
    'Middle Blocker',
    {
      'Power': 3,
      'Speed': 2,
      'Technique': 4,
      'Stamina': 3,
      'Defense': 3,
      'Agility': 4,
    },
    'https://via.placeholder.com/150?text=Tsukishima',
  ),
  // Rare
  CardModel(
    'Tobio Kageyama',
    Rarity.rare,
    'Setter',
    {
      'Power': 6,
      'Speed': 7,
      'Technique': 8,
      'Stamina': 6,
      'Defense': 5,
      'Agility': 7,
    },
    'https://via.placeholder.com/150?text=Kageyama',
  ),
  CardModel(
    'Yu Nishinoya',
    Rarity.rare,
    'Libero',
    {
      'Power': 7,
      'Speed': 8,
      'Technique': 5,
      'Stamina': 7,
      'Defense': 4,
      'Agility': 9,
    },
    'https://via.placeholder.com/150?text=Nishinoya',
  ),
  CardModel(
    'Koshi Sugawara',
    Rarity.rare,
    'Setter',
    {
      'Power': 5,
      'Speed': 6,
      'Technique': 9,
      'Stamina': 6,
      'Defense': 6,
      'Agility': 6,
    },
    'https://via.placeholder.com/150?text=Sugawara',
  ),
  CardModel(
    'Daichi Sawamura',
    Rarity.rare,
    'Wing Spiker',
    {
      'Power': 6,
      'Speed': 5,
      'Technique': 7,
      'Stamina': 8,
      'Defense': 7,
      'Agility': 5,
    },
    'https://via.placeholder.com/150?text=Daichi',
  ),
  CardModel(
    'Kenma Kozume',
    Rarity.rare,
    'Setter',
    {
      'Power': 4,
      'Speed': 6,
      'Technique': 9,
      'Stamina': 5,
      'Defense': 4,
      'Agility': 8,
    },
    'https://via.placeholder.com/150?text=Kenma',
  ),
  // Epic
  CardModel(
    'Tetsuro Kuroo',
    Rarity.epic,
    'Middle Blocker',
    {
      'Power': 9,
      'Speed': 8,
      'Technique': 9,
      'Stamina': 8,
      'Defense': 8,
      'Agility': 8,
    },
    'https://via.placeholder.com/150?text=Kuroo',
  ),
  CardModel(
    'Kotaro Bokuto',
    Rarity.epic,
    'Outside Hitter',
    {
      'Power': 10,
      'Speed': 9,
      'Technique': 7,
      'Stamina': 9,
      'Defense': 7,
      'Agility': 10,
    },
    'https://via.placeholder.com/150?text=Bokuto',
  ),
  CardModel(
    'Keiji Akaashi',
    Rarity.epic,
    'Setter',
    {
      'Power': 7,
      'Speed': 8,
      'Technique': 10,
      'Stamina': 7,
      'Defense': 6,
      'Agility': 9,
    },
    'https://via.placeholder.com/150?text=Akaashi',
  ),
  CardModel(
    'Toru Oikawa',
    Rarity.epic,
    'Setter',
    {
      'Power': 8,
      'Speed': 9,
      'Technique': 10,
      'Stamina': 6,
      'Defense': 5,
      'Agility': 10,
    },
    'https://via.placeholder.com/150?text=Oikawa',
  ),
  // Legendary
  CardModel(
    'Hajime Iwaizumi',
    Rarity.legendary,
    'Outside Hitter',
    {
      'Power': 11,
      'Speed': 10,
      'Technique': 10,
      'Stamina': 11,
      'Defense': 10,
      'Agility': 9,
    },
    'https://via.placeholder.com/150?text=Iwaizumi',
  ),
  CardModel(
    'Wakatoshi Ushijima',
    Rarity.legendary,
    'Outside Hitter',
    {
      'Power': 12,
      'Speed': 9,
      'Technique': 11,
      'Stamina': 12,
      'Defense': 12,
      'Agility': 8,
    },
    'https://via.placeholder.com/150?text=Ushijima',
  ),
  CardModel(
    'Satori Tendou',
    Rarity.legendary,
    'Middle Blocker',
    {
      'Power': 10,
      'Speed': 11,
      'Technique': 12,
      'Stamina': 9,
      'Defense': 8,
      'Agility': 11,
    },
    'https://via.placeholder.com/150?text=Tendou',
  ),
  CardModel(
    'Eita Semi',
    Rarity.legendary,
    'Setter',
    {
      'Power': 9,
      'Speed': 10,
      'Technique': 12,
      'Stamina': 8,
      'Defense': 7,
      'Agility': 10,
    },
    'https://via.placeholder.com/150?text=Semi',
  ),
  CardModel(
    'Kiyoomi Sakusa',
    Rarity.legendary,
    'Outside Hitter',
    {
      'Power': 10,
      'Speed': 12,
      'Technique': 11,
      'Stamina': 10,
      'Defense': 9,
      'Agility': 12,
    },
    'https://via.placeholder.com/150?text=Sakusa',
  ),
  CardModel(
    'Atsumu Miya',
    Rarity.legendary,
    'Setter',
    {
      'Power': 11,
      'Speed': 11,
      'Technique': 10,
      'Stamina': 9,
      'Defense': 8,
      'Agility': 11,
    },
    'https://via.placeholder.com/150?text=Atsumu',
  ),
];
