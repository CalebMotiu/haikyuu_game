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

// List of all possible cards - Organized by Rarity with Character Growth Stories
final List<CardModel> allCards = [
  // ============ COMMON RARITY ============
  // Karasuno Team
  CardModel(
    'Shōyō Hinata - Beginning',
    Rarity.common,
    'Outside Hitter',
    {
      'Power': 4,
      'Speed': 7,
      'Technique': 3,
      'Stamina': 6,
      'Defense': 2,
      'Agility': 8,
    },
    'assets/images/Hinata.png',
  ),
  CardModel(
    'Tobio Kageyama - Beginning',
    Rarity.common,
    'Setter',
    {
      'Power': 4,
      'Speed': 6,
      'Technique': 6,
      'Stamina': 5,
      'Defense': 4,
      'Agility': 6,
    },
    'assets/images/Tobio Kageyama Beginning.png',
  ),
  CardModel(
    'Daichi Sawamura',
    Rarity.common,
    'Wing Spiker',
    {
      'Power': 6,
      'Speed': 5,
      'Technique': 6,
      'Stamina': 7,
      'Defense': 7,
      'Agility': 5,
    },
    'assets/images/Daichi Sawamura.png',
  ),
  CardModel('Kōshi Sugawara', Rarity.common, 'Setter', {
    'Power': 4,
    'Speed': 5,
    'Technique': 7,
    'Stamina': 6,
    'Defense': 6,
    'Agility': 6,
  }, 'assets/images/Koshi Sugawara.png'),
  CardModel('Asahi Azumane', Rarity.common, 'Wing Spiker', {
    'Power': 8,
    'Speed': 6,
    'Technique': 7,
    'Stamina': 7,
    'Defense': 6,
    'Agility': 6,
  }, 'assets/images/Asahi Azumane.png'),
  CardModel('Yū Nishinoya', Rarity.common, 'Libero', {
    'Power': 4,
    'Speed': 8,
    'Technique': 7,
    'Stamina': 8,
    'Defense': 9,
    'Agility': 9,
  }, 'assets/images/Yu Nishinoya.png'),
  CardModel(
    'Ryūnosuke Tanaka',
    Rarity.common,
    'Middle Blocker',
    {
      'Power': 7,
      'Speed': 6,
      'Technique': 6,
      'Stamina': 7,
      'Defense': 7,
      'Agility': 6,
    },
    'https://via.placeholder.com/150?text=Tanaka',
  ),
  CardModel('Kazuma Chaya', Rarity.common, 'Middle Blocker', {
    'Power': 3,
    'Speed': 4,
    'Technique': 2,
    'Stamina': 3,
    'Defense': 2,
    'Agility': 5,
  }, 'assets/images/Kazuma Chaya.png'),
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
    'assets/images/tadashi-yamaguchi.png',
  ),
  CardModel(
    'Yūdai Hyakuzawa',
    Rarity.common,
    'Middle Blocker',
    {
      'Power': 6,
      'Speed': 1,
      'Technique': 2,
      'Stamina': 2,
      'Defense': 4,
      'Agility': 1,
    },
    'assets/images/Yūdai Hyakuzawa.png',
  ),
  CardModel('Yuzuru Komaki', Rarity.common, 'Setter', {
    'Power': 3,
    'Speed': 2,
    'Technique': 4,
    'Stamina': 3,
    'Defense': 3,
    'Agility': 4,
  }, 'assets/images/Yuzuru Komaki.png'),
  CardModel(
    'Ikejiri Hayato',
    Rarity.common,
    'Outside Hitter',
    {
      'Power': 3,
      'Speed': 2,
      'Technique': 4,
      'Stamina': 3,
      'Defense': 3,
      'Agility': 4,
    },
    'assets/images/Ikejiri Hayato.png',
  ),
  CardModel(
    'Kaito Asamushi',
    Rarity.common,
    'Outside Hitter',
    {
      'Power': 3,
      'Speed': 2,
      'Technique': 4,
      'Stamina': 3,
      'Defense': 3,
      'Agility': 4,
    },
    'assets/images/Kaito Asamushi.png',
  ),
  CardModel('Daiki Ogano', Rarity.common, 'Wing Spiker', {
    'Power': 3,
    'Speed': 2,
    'Technique': 4,
    'Stamina': 3,
    'Defense': 3,
    'Agility': 4,
  }, 'assets/images/Daiki Ogano.png'),

  // Nekoma Team
  CardModel(
    'Morisuke Yaku',
    Rarity.common,
    'Libero',
    {
      'Power': 4,
      'Speed': 7,
      'Technique': 7,
      'Stamina': 8,
      'Defense': 9,
      'Agility': 8,
    },
    'https://via.placeholder.com/150?text=Yaku',
  ),
  CardModel(
    'Taketora Yamamoto',
    Rarity.common,
    'Wing Spiker',
    {
      'Power': 6,
      'Speed': 6,
      'Technique': 5,
      'Stamina': 6,
      'Defense': 5,
      'Agility': 6,
    },
    'https://via.placeholder.com/150?text=Yamamoto',
  ),

  // Aoba Johsai Team
  CardModel(
    'Issei Matsukawa',
    Rarity.common,
    'Middle Blocker',
    {
      'Power': 8,
      'Speed': 6,
      'Technique': 7,
      'Stamina': 7,
      'Defense': 7,
      'Agility': 6,
    },
    'https://via.placeholder.com/150?text=Matsukawa',
  ),
  CardModel(
    'Takahiro Hanamaki',
    Rarity.common,
    'Wing Spiker',
    {
      'Power': 7,
      'Speed': 6,
      'Technique': 6,
      'Stamina': 7,
      'Defense': 6,
      'Agility': 6,
    },
    'https://via.placeholder.com/150?text=Hanamaki',
  ),

  // Shiratorizawa Team
  CardModel(
    'Reon Ōhira',
    Rarity.common,
    'Middle Blocker',
    {
      'Power': 8,
      'Speed': 6,
      'Technique': 6,
      'Stamina': 7,
      'Defense': 7,
      'Agility': 6,
    },
    'https://via.placeholder.com/150?text=Ohira',
  ),
  CardModel(
    'Tsutomu Goshiki',
    Rarity.common,
    'Wing Spiker',
    {
      'Power': 7,
      'Speed': 6,
      'Technique': 5,
      'Stamina': 6,
      'Defense': 5,
      'Agility': 6,
    },
    'https://via.placeholder.com/150?text=Goshiki',
  ),

  // Inarizaki Team
  CardModel(
    'Aran Ojiro',
    Rarity.common,
    'Outside Hitter',
    {
      'Power': 8,
      'Speed': 6,
      'Technique': 7,
      'Stamina': 7,
      'Defense': 6,
      'Agility': 6,
    },
    'https://via.placeholder.com/150?text=OjiroAran',
  ),

  // Kamomedai Team
  CardModel(
    'Sachirō Hirugami',
    Rarity.common,
    'Middle Blocker',
    {
      'Power': 8,
      'Speed': 6,
      'Technique': 7,
      'Stamina': 7,
      'Defense': 8,
      'Agility': 6,
    },
    'https://via.placeholder.com/150?text=Hirugami',
  ),

  // Date Tech Team
  CardModel(
    'Yūji Terushima',
    Rarity.common,
    'Setter',
    {
      'Power': 5,
      'Speed': 6,
      'Technique': 6,
      'Stamina': 5,
      'Defense': 4,
      'Agility': 6,
    },
    'https://via.placeholder.com/150?text=Terushima',
  ),
  CardModel(
    'Kenji Futakuchi',
    Rarity.common,
    'Wing Spiker',
    {
      'Power': 7,
      'Speed': 6,
      'Technique': 6,
      'Stamina': 6,
      'Defense': 5,
      'Agility': 6,
    },
    'https://via.placeholder.com/150?text=Futakuchi',
  ),
  CardModel(
    'Takanobu Aone',
    Rarity.common,
    'Middle Blocker',
    {
      'Power': 8,
      'Speed': 5,
      'Technique': 5,
      'Stamina': 7,
      'Defense': 8,
      'Agility': 5,
    },
    'https://via.placeholder.com/150?text=Aone',
  ),

  // Nohebi Academy
  CardModel(
    'Suguru Daishō',
    Rarity.common,
    'Setter',
    {
      'Power': 4,
      'Speed': 6,
      'Technique': 7,
      'Stamina': 6,
      'Defense': 5,
      'Agility': 6,
    },
    'https://via.placeholder.com/150?text=Daisho',
  ),

  // Inarizaki Team
  CardModel(
    'Ren Ōmimi',
    Rarity.common,
    'Libero',
    {
      'Power': 3,
      'Speed': 8,
      'Technique': 7,
      'Stamina': 8,
      'Defense': 8,
      'Agility': 8,
    },
    'https://via.placeholder.com/150?text=Omimi',
  ),
  CardModel(
    'Hitoshi Ginjima',
    Rarity.common,
    'Middle Blocker',
    {
      'Power': 8,
      'Speed': 6,
      'Technique': 6,
      'Stamina': 7,
      'Defense': 7,
      'Agility': 6,
    },
    'https://via.placeholder.com/150?text=Ginjima',
  ),

  // ============ RARE RARITY ============
  // Karasuno Growth
  CardModel(
    'Shōyō Hinata - Karasuno',
    Rarity.rare,
    'Outside Hitter',
    {
      'Power': 7,
      'Speed': 9,
      'Technique': 6,
      'Stamina': 8,
      'Defense': 4,
      'Agility': 9,
    },
    'https://via.placeholder.com/150?text=HinataKarasuno',
  ),
  CardModel(
    'Tobio Kageyama - Karasuno',
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
    'https://via.placeholder.com/150?text=KageyamaRare',
  ),

  // Nekoma
  CardModel(
    'Tetsurō Kuroo',
    Rarity.rare,
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
    'Kenma Kozume',
    Rarity.rare,
    'Setter',
    {
      'Power': 3,
      'Speed': 7,
      'Technique': 9,
      'Stamina': 5,
      'Defense': 4,
      'Agility': 8,
    },
    'https://via.placeholder.com/150?text=Kozume',
  ),

  // Fukurōdani
  CardModel(
    'Keiji Akaashi',
    Rarity.rare,
    'Setter',
    {
      'Power': 5,
      'Speed': 7,
      'Technique': 8,
      'Stamina': 7,
      'Defense': 6,
      'Agility': 7,
    },
    'https://via.placeholder.com/150?text=Akaashi',
  ),

  // Shiratorizawa
  CardModel(
    'Satori Tendō',
    Rarity.rare,
    'Middle Blocker',
    {
      'Power': 8,
      'Speed': 7,
      'Technique': 8,
      'Stamina': 7,
      'Defense': 8,
      'Agility': 7,
    },
    'https://via.placeholder.com/150?text=Tendou',
  ),
  CardModel('Eita Semi', Rarity.rare, 'Setter', {
    'Power': 5,
    'Speed': 7,
    'Technique': 8,
    'Stamina': 7,
    'Defense': 6,
    'Agility': 7,
  }, 'https://via.placeholder.com/150?text=Semi'),

  // Inarizaki
  CardModel(
    'Atsumu Miya',
    Rarity.rare,
    'Setter',
    {
      'Power': 6,
      'Speed': 8,
      'Technique': 9,
      'Stamina': 8,
      'Defense': 5,
      'Agility': 8,
    },
    'https://via.placeholder.com/150?text=AtsumulMiya',
  ),
  CardModel(
    'Osamu Miya',
    Rarity.rare,
    'Wing Spiker',
    {
      'Power': 8,
      'Speed': 7,
      'Technique': 8,
      'Stamina': 8,
      'Defense': 6,
      'Agility': 7,
    },
    'https://via.placeholder.com/150?text=OsamuMiya',
  ),
  CardModel(
    'Shinsuke Kita',
    Rarity.rare,
    'Outside Hitter',
    {
      'Power': 7,
      'Speed': 7,
      'Technique': 8,
      'Stamina': 9,
      'Defense': 7,
      'Agility': 7,
    },
    'https://via.placeholder.com/150?text=Kita',
  ),

  // Kamomedai
  CardModel(
    'Kōrai Hoshiumi',
    Rarity.rare,
    'Outside Hitter',
    {
      'Power': 8,
      'Speed': 9,
      'Technique': 8,
      'Stamina': 7,
      'Defense': 5,
      'Agility': 9,
    },
    'https://via.placeholder.com/150?text=Hoshiumi',
  ),

  // Professional Teams
  CardModel(
    'Shūgo Meian',
    Rarity.rare,
    'Middle Blocker',
    {
      'Power': 9,
      'Speed': 7,
      'Technique': 8,
      'Stamina': 9,
      'Defense': 9,
      'Agility': 7,
    },
    'https://via.placeholder.com/150?text=Meian',
  ),

  // Karasuno Captain
  CardModel(
    'Daichi Sawamura - Captain',
    Rarity.rare,
    'Wing Spiker',
    {
      'Power': 7,
      'Speed': 6,
      'Technique': 7,
      'Stamina': 8,
      'Defense': 8,
      'Agility': 6,
    },
    'https://via.placeholder.com/150?text=SawamuraCap',
  ),

  // Libero Star
  CardModel(
    'Yu Nishinoya - Libero Star',
    Rarity.rare,
    'Libero',
    {
      'Power': 5,
      'Speed': 9,
      'Technique': 8,
      'Stamina': 9,
      'Defense': 10,
      'Agility': 10,
    },
    'https://via.placeholder.com/150?text=NishinoyaStar',
  ),

  // ============ EPIC RARITY ============
  // Karasuno Growth
  CardModel(
    'Shōyō Hinata - Growth',
    Rarity.epic,
    'Outside Hitter',
    {
      'Power': 8,
      'Speed': 10,
      'Technique': 7,
      'Stamina': 9,
      'Defense': 5,
      'Agility': 10,
    },
    'https://via.placeholder.com/150?text=HinataGrowth',
  ),
  CardModel(
    'Tobio Kageyama - Growth',
    Rarity.epic,
    'Setter',
    {
      'Power': 6,
      'Speed': 8,
      'Technique': 9,
      'Stamina': 7,
      'Defense': 5,
      'Agility': 8,
    },
    'https://via.placeholder.com/150?text=KageyamaGrowth',
  ),

  // Fukurōdani
  CardModel(
    'Kōtarō Bokuto',
    Rarity.epic,
    'Wing Spiker',
    {
      'Power': 10,
      'Speed': 8,
      'Technique': 8,
      'Stamina': 8,
      'Defense': 6,
      'Agility': 8,
    },
    'https://via.placeholder.com/150?text=Bokuto',
  ),

  // Itachiyama
  CardModel(
    'Kiyoomi Sakusa',
    Rarity.epic,
    'Outside Hitter',
    {
      'Power': 9,
      'Speed': 8,
      'Technique': 9,
      'Stamina': 8,
      'Defense': 7,
      'Agility': 8,
    },
    'https://via.placeholder.com/150?text=Sakusa',
  ),

  // Aoba Johsai
  CardModel(
    'Tōru Oikawa - Aoba Johsai',
    Rarity.epic,
    'Setter',
    {
      'Power': 7,
      'Speed': 8,
      'Technique': 10,
      'Stamina': 8,
      'Defense': 6,
      'Agility': 8,
    },
    'https://via.placeholder.com/150?text=OikawaHS',
  ),

  // Professional Teams
  CardModel(
    'Kōtarō Bokuto - MSBY',
    Rarity.epic,
    'Wing Spiker',
    {
      'Power': 10,
      'Speed': 9,
      'Technique': 9,
      'Stamina': 9,
      'Defense': 7,
      'Agility': 9,
    },
    'https://via.placeholder.com/150?text=BokutoMSBY',
  ),
  CardModel(
    'Tōru Oikawa - Adlers',
    Rarity.epic,
    'Setter',
    {
      'Power': 7,
      'Speed': 9,
      'Technique': 11,
      'Stamina': 9,
      'Defense': 6,
      'Agility': 9,
    },
    'https://via.placeholder.com/150?text=OikawaAdlers',
  ),

  // Karasuno Veteran
  CardModel(
    'Yu Nishinoya - Veteran',
    Rarity.epic,
    'Libero',
    {
      'Power': 5,
      'Speed': 10,
      'Technique': 9,
      'Stamina': 10,
      'Defense': 11,
      'Agility': 11,
    },
    'https://via.placeholder.com/150?text=NishinoyaVet',
  ),

  CardModel(
    'Asahi Azumane - Third Year',
    Rarity.epic,
    'Wing Spiker',
    {
      'Power': 9,
      'Speed': 7,
      'Technique': 8,
      'Stamina': 8,
      'Defense': 7,
      'Agility': 7,
    },
    'https://via.placeholder.com/150?text=Azumane3rd',
  ),

  // Nekoma Captain
  CardModel(
    'Tetsurō Kuroo - Captain',
    Rarity.epic,
    'Middle Blocker',
    {
      'Power': 10,
      'Speed': 8,
      'Technique': 9,
      'Stamina': 9,
      'Defense': 9,
      'Agility': 8,
    },
    'https://via.placeholder.com/150?text=KurooCap',
  ),

  CardModel(
    'Kenma Kozume - Peak',
    Rarity.epic,
    'Setter',
    {
      'Power': 3,
      'Speed': 8,
      'Technique': 10,
      'Stamina': 6,
      'Defense': 5,
      'Agility': 9,
    },
    'https://via.placeholder.com/150?text=KozumePeak',
  ),

  // ============ LEGENDARY RARITY ============
  // Karasuno Peak
  CardModel(
    'Shōyō Hinata - Peak',
    Rarity.legendary,
    'Outside Hitter',
    {
      'Power': 9,
      'Speed': 11,
      'Technique': 8,
      'Stamina': 10,
      'Defense': 6,
      'Agility': 11,
    },
    'https://via.placeholder.com/150?text=HinataPeak',
  ),
  CardModel(
    'Tobio Kageyama - Schweiden',
    Rarity.legendary,
    'Setter',
    {
      'Power': 7,
      'Speed': 9,
      'Technique': 11,
      'Stamina': 8,
      'Defense': 6,
      'Agility': 9,
    },
    'https://via.placeholder.com/150?text=KageyamaAdlers',
  ),

  // Professional MSBY
  CardModel(
    'Shōyō Hinata - MSBY Black Jackal',
    Rarity.legendary,
    'Outside Hitter',
    {
      'Power': 10,
      'Speed': 12,
      'Technique': 9,
      'Stamina': 11,
      'Defense': 7,
      'Agility': 12,
    },
    'https://via.placeholder.com/150?text=HinataMSBY',
  ),

  // Aoba Johsai High School
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

  // Shiratorizawa
  CardModel(
    'Wakatoshi Ushijima',
    Rarity.legendary,
    'Outside Hitter',
    {
      'Power': 12,
      'Speed': 8,
      'Technique': 9,
      'Stamina': 10,
      'Defense': 8,
      'Agility': 7,
    },
    'https://via.placeholder.com/150?text=Ushijima',
  ),

  // Professional Adlers
  CardModel(
    'Wakatoshi Ushijima - Adlers',
    Rarity.legendary,
    'Outside Hitter',
    {
      'Power': 12,
      'Speed': 9,
      'Technique': 10,
      'Stamina': 11,
      'Defense': 9,
      'Agility': 8,
    },
    'https://via.placeholder.com/150?text=UshijimaAdlers',
  ),
  CardModel(
    'Hajime Iwaizumi - Adlers',
    Rarity.legendary,
    'Outside Hitter',
    {
      'Power': 11,
      'Speed': 10,
      'Technique': 11,
      'Stamina': 12,
      'Defense': 11,
      'Agility': 10,
    },
    'https://via.placeholder.com/150?text=IwaizumiAdlers',
  ),

  // Professional Peak
  CardModel(
    'Tōru Oikawa - Schweiden Adlers Pro',
    Rarity.legendary,
    'Setter',
    {
      'Power': 8,
      'Speed': 9,
      'Technique': 12,
      'Stamina': 10,
      'Defense': 7,
      'Agility': 10,
    },
    'https://via.placeholder.com/150?text=OikawaPro',
  ),
];
