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
    'assets/images/Ryunosuke-Tanaka.png',
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
  CardModel('Morisuke Yaku', Rarity.common, 'Libero', {
    'Power': 4,
    'Speed': 7,
    'Technique': 7,
    'Stamina': 8,
    'Defense': 9,
    'Agility': 8,
  }, 'assets/images/Morisuke Yaku.png'),
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
    'assets/images/Taketora Yamamoto.png',
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
    'assets/images/Issei Matsukawa.png',
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
    'assets/images/Takahiro_Hanamaki.png',
  ),

  // Shiratorizawa Team
  CardModel('Reon Ōhira', Rarity.common, 'Middle Blocker', {
    'Power': 8,
    'Speed': 6,
    'Technique': 6,
    'Stamina': 7,
    'Defense': 7,
    'Agility': 6,
  }, 'assets/images/Reon_Ōhira.png'),
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
    'assets/images/Tsutomu Goshiki.png',
  ),

  // Inarizaki Team
  CardModel('Aran Ojiro', Rarity.common, 'Outside Hitter', {
    'Power': 8,
    'Speed': 6,
    'Technique': 7,
    'Stamina': 7,
    'Defense': 6,
    'Agility': 6,
  }, 'assets/images/Aran Ojiro.png'),

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
    'assets/images/Sachirō Hirugami.png',
  ),

  // Date Tech Team
  CardModel('Yūji Terushima', Rarity.common, 'Setter', {
    'Power': 5,
    'Speed': 6,
    'Technique': 6,
    'Stamina': 5,
    'Defense': 4,
    'Agility': 6,
  }, 'assets/images/Yūji Terushima.png'),
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
    'assets/images/Kenji Futakuchi.png',
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
    'assets/images/Takanobu Aone.png',
  ),

  // Nohebi Academy
  CardModel('Suguru Daishō', Rarity.common, 'Setter', {
    'Power': 4,
    'Speed': 6,
    'Technique': 7,
    'Stamina': 6,
    'Defense': 5,
    'Agility': 6,
  }, 'assets/images/Suguru Daishō.png'),

  // Inarizaki Team
  CardModel('Ren Ōmimi', Rarity.common, 'Libero', {
    'Power': 3,
    'Speed': 8,
    'Technique': 7,
    'Stamina': 8,
    'Defense': 8,
    'Agility': 8,
  }, 'assets/images/Ren Ōmimi.png'),

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
    'assets/images/Shōyō Hinata - Karasuno.png',
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
    'assets/images/Tobio Kageyama - Karasuno.png',
  ),

  // Nekoma
  CardModel('Tetsurō Kuroo', Rarity.rare, 'Middle Blocker', {
    'Power': 9,
    'Speed': 8,
    'Technique': 9,
    'Stamina': 8,
    'Defense': 8,
    'Agility': 8,
  }, 'assets/images/Tetsurō Kuroo.png'),
  CardModel('Kenma Kozume', Rarity.rare, 'Setter', {
    'Power': 3,
    'Speed': 7,
    'Technique': 9,
    'Stamina': 5,
    'Defense': 4,
    'Agility': 8,
  }, 'assets/images/Kenma Kozume.png'),

  // Fukurōdani
  CardModel('Keiji Akaashi', Rarity.rare, 'Setter', {
    'Power': 5,
    'Speed': 7,
    'Technique': 8,
    'Stamina': 7,
    'Defense': 6,
    'Agility': 7,
  }, 'assets/images/Keiji Akaashi.png'),

  // Shiratorizawa
  CardModel('Satori Tendō', Rarity.rare, 'Middle Blocker', {
    'Power': 8,
    'Speed': 7,
    'Technique': 8,
    'Stamina': 7,
    'Defense': 8,
    'Agility': 7,
  }, 'assets/images/Satori Tendō.png'),
  CardModel('Eita Semi', Rarity.rare, 'Setter', {
    'Power': 5,
    'Speed': 7,
    'Technique': 8,
    'Stamina': 7,
    'Defense': 6,
    'Agility': 7,
  }, 'assets/images/Eita Semi.png'),

  // Inarizaki
  CardModel('Atsumu Miya', Rarity.rare, 'Setter', {
    'Power': 6,
    'Speed': 8,
    'Technique': 9,
    'Stamina': 8,
    'Defense': 5,
    'Agility': 8,
  }, 'assets/images/Atsumu Miya.png'),
  CardModel('Osamu Miya', Rarity.rare, 'Wing Spiker', {
    'Power': 8,
    'Speed': 7,
    'Technique': 8,
    'Stamina': 8,
    'Defense': 6,
    'Agility': 7,
  }, 'assets/images/Osamu Miya.png'),
  CardModel('Shinsuke Kita', Rarity.rare, 'Outside Hitter', {
    'Power': 7,
    'Speed': 7,
    'Technique': 8,
    'Stamina': 9,
    'Defense': 7,
    'Agility': 7,
  }, 'assets/images/Shinsuke Kita.png'),

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
    'assets/images/Kōrai Hoshiumi.png',
  ),

  // Professional Teams
  CardModel('Shūgo Meian', Rarity.rare, 'Middle Blocker', {
    'Power': 9,
    'Speed': 7,
    'Technique': 8,
    'Stamina': 9,
    'Defense': 9,
    'Agility': 7,
  }, 'assets/images/Shūgo Meian.png'),

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
    'assets/images/Daichi Sawamura - Captain.png',
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
    'assets/images/Yu Nishinoya - Libero Star.png',
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
    'assets/images/Shōyō Hinata - Growth.png',
  ),
  CardModel(
    'Tobio Kageyama - Growth',
    Rarity.epic,
    'Setter',
    {
      'Power': 8,
      'Speed': 8,
      'Technique': 10,
      'Stamina': 7,
      'Defense': 6,
      'Agility': 8,
    },
    'assets/images/Tobio Kageyama - Growth.png',
  ),

  // Fukurōdani
  CardModel('Kōtarō Bokuto', Rarity.epic, 'Wing Spiker', {
    'Power': 10,
    'Speed': 8,
    'Technique': 8,
    'Stamina': 8,
    'Defense': 6,
    'Agility': 8,
  }, 'assets/images/Kōtarō Bokuto.png'),

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
    'assets/images/Kiyoomi Sakusa.png',
  ),

  // Aoba Johsai
  CardModel(
    'Tōru Oikawa - Aoba Johsai',
    Rarity.epic,
    'Setter',
    {
      'Power': 10,
      'Speed': 9,
      'Technique': 10,
      'Stamina': 8,
      'Defense': 7,
      'Agility': 8,
    },
    'assets/images/Tōru Oikawa.png',
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
    'assets/images/Asahi Azumane - Third Year.png',
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
    'assets/images/Tetsurō Kuroo - Captain.png',
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
    'assets/images/Kenma Kozume - Peak.png',
  ),

  // ============ LEGENDARY RARITY ============
  CardModel(
    'Kōtarō Bokuto - MSBY',
    Rarity.legendary,
    'Wing Spiker',
    {
      'Power': 10,
      'Speed': 9,
      'Technique': 9,
      'Stamina': 9,
      'Defense': 7,
      'Agility': 9,
    },
    'assets/images/Kōtarō Bokuto - MSBY.png',
  ),
  CardModel(
    'Tōru Oikawa - Adlers',
    Rarity.legendary,
    'Setter',
    {
      'Power': 7,
      'Speed': 9,
      'Technique': 11,
      'Stamina': 9,
      'Defense': 6,
      'Agility': 9,
    },
    'assets/images/Tōru Oikawa - Adlers.png',
  ),
  CardModel(
    'Tobio Kageyama - Schweiden',
    Rarity.legendary,
    'Setter',
    {
      'Power': 11,
      'Speed': 9,
      'Technique': 12,
      'Stamina': 9,
      'Defense': 11,
      'Agility': 10,
    },
    'assets/images/Tobio Kageyama - Schweiden.png',
  ),

  // Professional MSBY
  CardModel(
    'Shōyō Hinata - MSBY Black Jackal',
    Rarity.legendary,
    'Outside Hitter',
    {
      'Power': 10,
      'Speed': 12,
      'Technique': 10,
      'Stamina': 11,
      'Defense': 8,
      'Agility': 12,
    },
    'assets/images/Shōyō Hinata - MSBY Black Jackal.png',
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
    'assets/images/Hajime Iwaizumi.png',
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
    'assets/images/Wakatoshi Ushijima.png',
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
    'assets/images/Wakatoshi Ushijima - Adlers.png',
  ),
];
