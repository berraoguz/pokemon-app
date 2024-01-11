class Pokedex {
  List<Pokemon> pokemon;

  Pokedex({required this.pokemon});

  Pokedex.fromJson(Map<String, dynamic> json)
      : pokemon = List<Pokemon>.from(
          (json['pokemon'] ?? []).map((v) => Pokemon.fromJson(v)),
        );

  Map<String, dynamic> toJson() {
    return {'pokemon': pokemon.map((v) => v.toJson()).toList()};
  }
}

class Pokemon {
  int id;
  String num;
  String name;
  String img;
  List<String> type;
  String height;
  String weight;
  String candy;
  int candyCount;
  String egg;
  double spawnChance;
  double avgSpawns;
  String spawnTime;
  List<double> multipliers;
  List<String> weaknesses;
  List<NextEvolution> nextEvolution;

  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.candy,
    required this.candyCount,
    required this.egg,
    required this.spawnChance,
    required this.avgSpawns,
    required this.spawnTime,
    required this.multipliers,
    required this.weaknesses,
    required this.nextEvolution,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      num: json['num'],
      name: json['name'],
      img: json['img'],
      type: List<String>.from(json['type'].map((x) => x)),
      height: json['height'],
      weight: json['weight'],
      candy: json['candy'],
      candyCount: json['candy_count'],
      egg: json['egg'],
      spawnChance: json['spawn_chance'],
      avgSpawns: json['avg_spawns'],
      spawnTime: json['spawn_time'],
      multipliers: List<double>.from(json['multipliers'].map((x) => x)),
      weaknesses: List<String>.from(json['weaknesses'].map((x) => x)),
      nextEvolution: (json['next_evolution'] ?? [])
          .map((v) => NextEvolution.fromJson(v))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'num': num,
      'name': name,
      'img': img,
      'type': type,
      'height': height,
      'weight': weight,
      'candy': candy,
      'candy_count': candyCount,
      'egg': egg,
      'spawn_chance': spawnChance,
      'avg_spawns': avgSpawns,
      'spawn_time': spawnTime,
      'multipliers': multipliers,
      'weaknesses': weaknesses,
      'next_evolution':
          nextEvolution.map((v) => v.toJson()).toList(),
    };
  }
}

class NextEvolution {
  String num;
  String name;

  NextEvolution({
    required this.num,
    required this.name,
  });

  factory NextEvolution.fromJson(Map<String, dynamic> json) {
    return NextEvolution(
      num: json['num'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'num': num, 'name': name};
  }
}
