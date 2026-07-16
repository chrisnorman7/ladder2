// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $PlayersTable extends Players with TableInfo<$PlayersTable, Player> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlayersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'players';
  @override
  VerificationContext validateIntegrity(
    Insertable<Player> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Player map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Player(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $PlayersTable createAlias(String alias) {
    return $PlayersTable(attachedDatabase, alias);
  }
}

class Player extends DataClass implements Insertable<Player> {
  /// The primary key.
  final int id;

  /// The name of the player.
  final String name;
  const Player({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  PlayersCompanion toCompanion(bool nullToAbsent) {
    return PlayersCompanion(id: Value(id), name: Value(name));
  }

  factory Player.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Player(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Player copyWith({int? id, String? name}) =>
      Player(id: id ?? this.id, name: name ?? this.name);
  Player copyWithCompanion(PlayersCompanion data) {
    return Player(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Player(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Player && other.id == this.id && other.name == this.name);
}

class PlayersCompanion extends UpdateCompanion<Player> {
  final Value<int> id;
  final Value<String> name;
  const PlayersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  PlayersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Player> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  PlayersCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return PlayersCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $LadderEventsTable extends LadderEvents
    with TableInfo<$LadderEventsTable, LadderEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LadderEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _whenMeta = const VerificationMeta('when');
  @override
  late final GeneratedColumn<DateTime> when = GeneratedColumn<DateTime>(
    'when',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, when];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ladder_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<LadderEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('when')) {
      context.handle(
        _whenMeta,
        when.isAcceptableOrUnknown(data['when']!, _whenMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LadderEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LadderEvent(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      when: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}when'],
      )!,
    );
  }

  @override
  $LadderEventsTable createAlias(String alias) {
    return $LadderEventsTable(attachedDatabase, alias);
  }
}

class LadderEvent extends DataClass implements Insertable<LadderEvent> {
  /// The primary key.
  final int id;

  /// The date and time of the event.
  final DateTime when;
  const LadderEvent({required this.id, required this.when});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['when'] = Variable<DateTime>(when);
    return map;
  }

  LadderEventsCompanion toCompanion(bool nullToAbsent) {
    return LadderEventsCompanion(id: Value(id), when: Value(when));
  }

  factory LadderEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LadderEvent(
      id: serializer.fromJson<int>(json['id']),
      when: serializer.fromJson<DateTime>(json['when']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'when': serializer.toJson<DateTime>(when),
    };
  }

  LadderEvent copyWith({int? id, DateTime? when}) =>
      LadderEvent(id: id ?? this.id, when: when ?? this.when);
  LadderEvent copyWithCompanion(LadderEventsCompanion data) {
    return LadderEvent(
      id: data.id.present ? data.id.value : this.id,
      when: data.when.present ? data.when.value : this.when,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LadderEvent(')
          ..write('id: $id, ')
          ..write('when: $when')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, when);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LadderEvent && other.id == this.id && other.when == this.when);
}

class LadderEventsCompanion extends UpdateCompanion<LadderEvent> {
  final Value<int> id;
  final Value<DateTime> when;
  const LadderEventsCompanion({
    this.id = const Value.absent(),
    this.when = const Value.absent(),
  });
  LadderEventsCompanion.insert({
    this.id = const Value.absent(),
    this.when = const Value.absent(),
  });
  static Insertable<LadderEvent> custom({
    Expression<int>? id,
    Expression<DateTime>? when,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (when != null) 'when': when,
    });
  }

  LadderEventsCompanion copyWith({Value<int>? id, Value<DateTime>? when}) {
    return LadderEventsCompanion(id: id ?? this.id, when: when ?? this.when);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (when.present) {
      map['when'] = Variable<DateTime>(when.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LadderEventsCompanion(')
          ..write('id: $id, ')
          ..write('when: $when')
          ..write(')'))
        .toString();
  }
}

class $EventGamesTable extends EventGames
    with TableInfo<$EventGamesTable, EventGame> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventGamesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _player1IdMeta = const VerificationMeta(
    'player1Id',
  );
  @override
  late final GeneratedColumn<int> player1Id = GeneratedColumn<int>(
    'player1_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES players (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _player2IdMeta = const VerificationMeta(
    'player2Id',
  );
  @override
  late final GeneratedColumn<int> player2Id = GeneratedColumn<int>(
    'player2_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES players (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _eventIdMeta = const VerificationMeta(
    'eventId',
  );
  @override
  late final GeneratedColumn<int> eventId = GeneratedColumn<int>(
    'event_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES ladder_events (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, player1Id, player2Id, eventId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'event_games';
  @override
  VerificationContext validateIntegrity(
    Insertable<EventGame> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('player1_id')) {
      context.handle(
        _player1IdMeta,
        player1Id.isAcceptableOrUnknown(data['player1_id']!, _player1IdMeta),
      );
    } else if (isInserting) {
      context.missing(_player1IdMeta);
    }
    if (data.containsKey('player2_id')) {
      context.handle(
        _player2IdMeta,
        player2Id.isAcceptableOrUnknown(data['player2_id']!, _player2IdMeta),
      );
    } else if (isInserting) {
      context.missing(_player2IdMeta);
    }
    if (data.containsKey('event_id')) {
      context.handle(
        _eventIdMeta,
        eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta),
      );
    } else if (isInserting) {
      context.missing(_eventIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EventGame map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventGame(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      player1Id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}player1_id'],
      )!,
      player2Id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}player2_id'],
      )!,
      eventId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}event_id'],
      )!,
    );
  }

  @override
  $EventGamesTable createAlias(String alias) {
    return $EventGamesTable(attachedDatabase, alias);
  }
}

class EventGame extends DataClass implements Insertable<EventGame> {
  /// The primary key.
  final int id;

  /// The ID of player 1.
  final int player1Id;

  /// The ID of player 2.
  final int player2Id;

  /// The event this game is part of.
  final int eventId;
  const EventGame({
    required this.id,
    required this.player1Id,
    required this.player2Id,
    required this.eventId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['player1_id'] = Variable<int>(player1Id);
    map['player2_id'] = Variable<int>(player2Id);
    map['event_id'] = Variable<int>(eventId);
    return map;
  }

  EventGamesCompanion toCompanion(bool nullToAbsent) {
    return EventGamesCompanion(
      id: Value(id),
      player1Id: Value(player1Id),
      player2Id: Value(player2Id),
      eventId: Value(eventId),
    );
  }

  factory EventGame.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventGame(
      id: serializer.fromJson<int>(json['id']),
      player1Id: serializer.fromJson<int>(json['player1Id']),
      player2Id: serializer.fromJson<int>(json['player2Id']),
      eventId: serializer.fromJson<int>(json['eventId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'player1Id': serializer.toJson<int>(player1Id),
      'player2Id': serializer.toJson<int>(player2Id),
      'eventId': serializer.toJson<int>(eventId),
    };
  }

  EventGame copyWith({int? id, int? player1Id, int? player2Id, int? eventId}) =>
      EventGame(
        id: id ?? this.id,
        player1Id: player1Id ?? this.player1Id,
        player2Id: player2Id ?? this.player2Id,
        eventId: eventId ?? this.eventId,
      );
  EventGame copyWithCompanion(EventGamesCompanion data) {
    return EventGame(
      id: data.id.present ? data.id.value : this.id,
      player1Id: data.player1Id.present ? data.player1Id.value : this.player1Id,
      player2Id: data.player2Id.present ? data.player2Id.value : this.player2Id,
      eventId: data.eventId.present ? data.eventId.value : this.eventId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventGame(')
          ..write('id: $id, ')
          ..write('player1Id: $player1Id, ')
          ..write('player2Id: $player2Id, ')
          ..write('eventId: $eventId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, player1Id, player2Id, eventId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventGame &&
          other.id == this.id &&
          other.player1Id == this.player1Id &&
          other.player2Id == this.player2Id &&
          other.eventId == this.eventId);
}

class EventGamesCompanion extends UpdateCompanion<EventGame> {
  final Value<int> id;
  final Value<int> player1Id;
  final Value<int> player2Id;
  final Value<int> eventId;
  const EventGamesCompanion({
    this.id = const Value.absent(),
    this.player1Id = const Value.absent(),
    this.player2Id = const Value.absent(),
    this.eventId = const Value.absent(),
  });
  EventGamesCompanion.insert({
    this.id = const Value.absent(),
    required int player1Id,
    required int player2Id,
    required int eventId,
  }) : player1Id = Value(player1Id),
       player2Id = Value(player2Id),
       eventId = Value(eventId);
  static Insertable<EventGame> custom({
    Expression<int>? id,
    Expression<int>? player1Id,
    Expression<int>? player2Id,
    Expression<int>? eventId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (player1Id != null) 'player1_id': player1Id,
      if (player2Id != null) 'player2_id': player2Id,
      if (eventId != null) 'event_id': eventId,
    });
  }

  EventGamesCompanion copyWith({
    Value<int>? id,
    Value<int>? player1Id,
    Value<int>? player2Id,
    Value<int>? eventId,
  }) {
    return EventGamesCompanion(
      id: id ?? this.id,
      player1Id: player1Id ?? this.player1Id,
      player2Id: player2Id ?? this.player2Id,
      eventId: eventId ?? this.eventId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (player1Id.present) {
      map['player1_id'] = Variable<int>(player1Id.value);
    }
    if (player2Id.present) {
      map['player2_id'] = Variable<int>(player2Id.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<int>(eventId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventGamesCompanion(')
          ..write('id: $id, ')
          ..write('player1Id: $player1Id, ')
          ..write('player2Id: $player2Id, ')
          ..write('eventId: $eventId')
          ..write(')'))
        .toString();
  }
}

class $GameSetsTable extends GameSets with TableInfo<$GameSetsTable, GameSet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GameSetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _player1IdMeta = const VerificationMeta(
    'player1Id',
  );
  @override
  late final GeneratedColumn<int> player1Id = GeneratedColumn<int>(
    'player1_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES players (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _player2IdMeta = const VerificationMeta(
    'player2Id',
  );
  @override
  late final GeneratedColumn<int> player2Id = GeneratedColumn<int>(
    'player2_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES players (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _gameIdMeta = const VerificationMeta('gameId');
  @override
  late final GeneratedColumn<int> gameId = GeneratedColumn<int>(
    'game_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES event_games (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, player1Id, player2Id, gameId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'game_sets';
  @override
  VerificationContext validateIntegrity(
    Insertable<GameSet> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('player1_id')) {
      context.handle(
        _player1IdMeta,
        player1Id.isAcceptableOrUnknown(data['player1_id']!, _player1IdMeta),
      );
    } else if (isInserting) {
      context.missing(_player1IdMeta);
    }
    if (data.containsKey('player2_id')) {
      context.handle(
        _player2IdMeta,
        player2Id.isAcceptableOrUnknown(data['player2_id']!, _player2IdMeta),
      );
    } else if (isInserting) {
      context.missing(_player2IdMeta);
    }
    if (data.containsKey('game_id')) {
      context.handle(
        _gameIdMeta,
        gameId.isAcceptableOrUnknown(data['game_id']!, _gameIdMeta),
      );
    } else if (isInserting) {
      context.missing(_gameIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameSet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GameSet(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      player1Id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}player1_id'],
      )!,
      player2Id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}player2_id'],
      )!,
      gameId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}game_id'],
      )!,
    );
  }

  @override
  $GameSetsTable createAlias(String alias) {
    return $GameSetsTable(attachedDatabase, alias);
  }
}

class GameSet extends DataClass implements Insertable<GameSet> {
  /// The primary key.
  final int id;

  /// The ID of player 1.
  final int player1Id;

  /// The ID of player 2.
  final int player2Id;

  /// The ID of the game this set is part of.
  final int gameId;
  const GameSet({
    required this.id,
    required this.player1Id,
    required this.player2Id,
    required this.gameId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['player1_id'] = Variable<int>(player1Id);
    map['player2_id'] = Variable<int>(player2Id);
    map['game_id'] = Variable<int>(gameId);
    return map;
  }

  GameSetsCompanion toCompanion(bool nullToAbsent) {
    return GameSetsCompanion(
      id: Value(id),
      player1Id: Value(player1Id),
      player2Id: Value(player2Id),
      gameId: Value(gameId),
    );
  }

  factory GameSet.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameSet(
      id: serializer.fromJson<int>(json['id']),
      player1Id: serializer.fromJson<int>(json['player1Id']),
      player2Id: serializer.fromJson<int>(json['player2Id']),
      gameId: serializer.fromJson<int>(json['gameId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'player1Id': serializer.toJson<int>(player1Id),
      'player2Id': serializer.toJson<int>(player2Id),
      'gameId': serializer.toJson<int>(gameId),
    };
  }

  GameSet copyWith({int? id, int? player1Id, int? player2Id, int? gameId}) =>
      GameSet(
        id: id ?? this.id,
        player1Id: player1Id ?? this.player1Id,
        player2Id: player2Id ?? this.player2Id,
        gameId: gameId ?? this.gameId,
      );
  GameSet copyWithCompanion(GameSetsCompanion data) {
    return GameSet(
      id: data.id.present ? data.id.value : this.id,
      player1Id: data.player1Id.present ? data.player1Id.value : this.player1Id,
      player2Id: data.player2Id.present ? data.player2Id.value : this.player2Id,
      gameId: data.gameId.present ? data.gameId.value : this.gameId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GameSet(')
          ..write('id: $id, ')
          ..write('player1Id: $player1Id, ')
          ..write('player2Id: $player2Id, ')
          ..write('gameId: $gameId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, player1Id, player2Id, gameId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameSet &&
          other.id == this.id &&
          other.player1Id == this.player1Id &&
          other.player2Id == this.player2Id &&
          other.gameId == this.gameId);
}

class GameSetsCompanion extends UpdateCompanion<GameSet> {
  final Value<int> id;
  final Value<int> player1Id;
  final Value<int> player2Id;
  final Value<int> gameId;
  const GameSetsCompanion({
    this.id = const Value.absent(),
    this.player1Id = const Value.absent(),
    this.player2Id = const Value.absent(),
    this.gameId = const Value.absent(),
  });
  GameSetsCompanion.insert({
    this.id = const Value.absent(),
    required int player1Id,
    required int player2Id,
    required int gameId,
  }) : player1Id = Value(player1Id),
       player2Id = Value(player2Id),
       gameId = Value(gameId);
  static Insertable<GameSet> custom({
    Expression<int>? id,
    Expression<int>? player1Id,
    Expression<int>? player2Id,
    Expression<int>? gameId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (player1Id != null) 'player1_id': player1Id,
      if (player2Id != null) 'player2_id': player2Id,
      if (gameId != null) 'game_id': gameId,
    });
  }

  GameSetsCompanion copyWith({
    Value<int>? id,
    Value<int>? player1Id,
    Value<int>? player2Id,
    Value<int>? gameId,
  }) {
    return GameSetsCompanion(
      id: id ?? this.id,
      player1Id: player1Id ?? this.player1Id,
      player2Id: player2Id ?? this.player2Id,
      gameId: gameId ?? this.gameId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (player1Id.present) {
      map['player1_id'] = Variable<int>(player1Id.value);
    }
    if (player2Id.present) {
      map['player2_id'] = Variable<int>(player2Id.value);
    }
    if (gameId.present) {
      map['game_id'] = Variable<int>(gameId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameSetsCompanion(')
          ..write('id: $id, ')
          ..write('player1Id: $player1Id, ')
          ..write('player2Id: $player2Id, ')
          ..write('gameId: $gameId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PlayersTable players = $PlayersTable(this);
  late final $LadderEventsTable ladderEvents = $LadderEventsTable(this);
  late final $EventGamesTable eventGames = $EventGamesTable(this);
  late final $GameSetsTable gameSets = $GameSetsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    players,
    ladderEvents,
    eventGames,
    gameSets,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'players',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('event_games', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'players',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('event_games', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'ladder_events',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('event_games', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'players',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('game_sets', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'players',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('game_sets', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'event_games',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('game_sets', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$PlayersTableCreateCompanionBuilder =
    PlayersCompanion Function({Value<int> id, required String name});
typedef $$PlayersTableUpdateCompanionBuilder =
    PlayersCompanion Function({Value<int> id, Value<String> name});

class $$PlayersTableFilterComposer
    extends Composer<_$AppDatabase, $PlayersTable> {
  $$PlayersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PlayersTableOrderingComposer
    extends Composer<_$AppDatabase, $PlayersTable> {
  $$PlayersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlayersTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlayersTable> {
  $$PlayersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$PlayersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlayersTable,
          Player,
          $$PlayersTableFilterComposer,
          $$PlayersTableOrderingComposer,
          $$PlayersTableAnnotationComposer,
          $$PlayersTableCreateCompanionBuilder,
          $$PlayersTableUpdateCompanionBuilder,
          (Player, BaseReferences<_$AppDatabase, $PlayersTable, Player>),
          Player,
          PrefetchHooks Function()
        > {
  $$PlayersTableTableManager(_$AppDatabase db, $PlayersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlayersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlayersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlayersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => PlayersCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  PlayersCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PlayersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlayersTable,
      Player,
      $$PlayersTableFilterComposer,
      $$PlayersTableOrderingComposer,
      $$PlayersTableAnnotationComposer,
      $$PlayersTableCreateCompanionBuilder,
      $$PlayersTableUpdateCompanionBuilder,
      (Player, BaseReferences<_$AppDatabase, $PlayersTable, Player>),
      Player,
      PrefetchHooks Function()
    >;
typedef $$LadderEventsTableCreateCompanionBuilder =
    LadderEventsCompanion Function({Value<int> id, Value<DateTime> when});
typedef $$LadderEventsTableUpdateCompanionBuilder =
    LadderEventsCompanion Function({Value<int> id, Value<DateTime> when});

final class $$LadderEventsTableReferences
    extends BaseReferences<_$AppDatabase, $LadderEventsTable, LadderEvent> {
  $$LadderEventsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$EventGamesTable, List<EventGame>>
  _eventGamesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.eventGames,
    aliasName: 'ladder_events__id__event_games__event_id',
  );

  $$EventGamesTableProcessedTableManager get eventGamesRefs {
    final manager = $$EventGamesTableTableManager(
      $_db,
      $_db.eventGames,
    ).filter((f) => f.eventId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_eventGamesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LadderEventsTableFilterComposer
    extends Composer<_$AppDatabase, $LadderEventsTable> {
  $$LadderEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get when => $composableBuilder(
    column: $table.when,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> eventGamesRefs(
    Expression<bool> Function($$EventGamesTableFilterComposer f) f,
  ) {
    final $$EventGamesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventGames,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventGamesTableFilterComposer(
            $db: $db,
            $table: $db.eventGames,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LadderEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $LadderEventsTable> {
  $$LadderEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get when => $composableBuilder(
    column: $table.when,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LadderEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LadderEventsTable> {
  $$LadderEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get when =>
      $composableBuilder(column: $table.when, builder: (column) => column);

  Expression<T> eventGamesRefs<T extends Object>(
    Expression<T> Function($$EventGamesTableAnnotationComposer a) f,
  ) {
    final $$EventGamesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventGames,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventGamesTableAnnotationComposer(
            $db: $db,
            $table: $db.eventGames,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LadderEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LadderEventsTable,
          LadderEvent,
          $$LadderEventsTableFilterComposer,
          $$LadderEventsTableOrderingComposer,
          $$LadderEventsTableAnnotationComposer,
          $$LadderEventsTableCreateCompanionBuilder,
          $$LadderEventsTableUpdateCompanionBuilder,
          (LadderEvent, $$LadderEventsTableReferences),
          LadderEvent,
          PrefetchHooks Function({bool eventGamesRefs})
        > {
  $$LadderEventsTableTableManager(_$AppDatabase db, $LadderEventsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LadderEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LadderEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LadderEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> when = const Value.absent(),
              }) => LadderEventsCompanion(id: id, when: when),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> when = const Value.absent(),
              }) => LadderEventsCompanion.insert(id: id, when: when),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LadderEventsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({eventGamesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (eventGamesRefs) db.eventGames],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (eventGamesRefs)
                    await $_getPrefetchedData<
                      LadderEvent,
                      $LadderEventsTable,
                      EventGame
                    >(
                      currentTable: table,
                      referencedTable: $$LadderEventsTableReferences
                          ._eventGamesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$LadderEventsTableReferences(
                            db,
                            table,
                            p0,
                          ).eventGamesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.eventId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$LadderEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LadderEventsTable,
      LadderEvent,
      $$LadderEventsTableFilterComposer,
      $$LadderEventsTableOrderingComposer,
      $$LadderEventsTableAnnotationComposer,
      $$LadderEventsTableCreateCompanionBuilder,
      $$LadderEventsTableUpdateCompanionBuilder,
      (LadderEvent, $$LadderEventsTableReferences),
      LadderEvent,
      PrefetchHooks Function({bool eventGamesRefs})
    >;
typedef $$EventGamesTableCreateCompanionBuilder =
    EventGamesCompanion Function({
      Value<int> id,
      required int player1Id,
      required int player2Id,
      required int eventId,
    });
typedef $$EventGamesTableUpdateCompanionBuilder =
    EventGamesCompanion Function({
      Value<int> id,
      Value<int> player1Id,
      Value<int> player2Id,
      Value<int> eventId,
    });

final class $$EventGamesTableReferences
    extends BaseReferences<_$AppDatabase, $EventGamesTable, EventGame> {
  $$EventGamesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PlayersTable _player1IdTable(_$AppDatabase db) =>
      db.players.createAlias('event_games__player1_id__players__id');

  $$PlayersTableProcessedTableManager get player1Id {
    final $_column = $_itemColumn<int>('player1_id')!;

    final manager = $$PlayersTableTableManager(
      $_db,
      $_db.players,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_player1IdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PlayersTable _player2IdTable(_$AppDatabase db) =>
      db.players.createAlias('event_games__player2_id__players__id');

  $$PlayersTableProcessedTableManager get player2Id {
    final $_column = $_itemColumn<int>('player2_id')!;

    final manager = $$PlayersTableTableManager(
      $_db,
      $_db.players,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_player2IdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LadderEventsTable _eventIdTable(_$AppDatabase db) =>
      db.ladderEvents.createAlias('event_games__event_id__ladder_events__id');

  $$LadderEventsTableProcessedTableManager get eventId {
    final $_column = $_itemColumn<int>('event_id')!;

    final manager = $$LadderEventsTableTableManager(
      $_db,
      $_db.ladderEvents,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_eventIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$GameSetsTable, List<GameSet>> _gameSetsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.gameSets,
    aliasName: 'event_games__id__game_sets__game_id',
  );

  $$GameSetsTableProcessedTableManager get gameSetsRefs {
    final manager = $$GameSetsTableTableManager(
      $_db,
      $_db.gameSets,
    ).filter((f) => f.gameId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_gameSetsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EventGamesTableFilterComposer
    extends Composer<_$AppDatabase, $EventGamesTable> {
  $$EventGamesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  $$PlayersTableFilterComposer get player1Id {
    final $$PlayersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.player1Id,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableFilterComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlayersTableFilterComposer get player2Id {
    final $$PlayersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.player2Id,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableFilterComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LadderEventsTableFilterComposer get eventId {
    final $$LadderEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.ladderEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LadderEventsTableFilterComposer(
            $db: $db,
            $table: $db.ladderEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> gameSetsRefs(
    Expression<bool> Function($$GameSetsTableFilterComposer f) f,
  ) {
    final $$GameSetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gameSets,
      getReferencedColumn: (t) => t.gameId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameSetsTableFilterComposer(
            $db: $db,
            $table: $db.gameSets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EventGamesTableOrderingComposer
    extends Composer<_$AppDatabase, $EventGamesTable> {
  $$EventGamesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  $$PlayersTableOrderingComposer get player1Id {
    final $$PlayersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.player1Id,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableOrderingComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlayersTableOrderingComposer get player2Id {
    final $$PlayersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.player2Id,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableOrderingComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LadderEventsTableOrderingComposer get eventId {
    final $$LadderEventsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.ladderEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LadderEventsTableOrderingComposer(
            $db: $db,
            $table: $db.ladderEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventGamesTableAnnotationComposer
    extends Composer<_$AppDatabase, $EventGamesTable> {
  $$EventGamesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$PlayersTableAnnotationComposer get player1Id {
    final $$PlayersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.player1Id,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableAnnotationComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlayersTableAnnotationComposer get player2Id {
    final $$PlayersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.player2Id,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableAnnotationComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LadderEventsTableAnnotationComposer get eventId {
    final $$LadderEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.ladderEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LadderEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.ladderEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> gameSetsRefs<T extends Object>(
    Expression<T> Function($$GameSetsTableAnnotationComposer a) f,
  ) {
    final $$GameSetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gameSets,
      getReferencedColumn: (t) => t.gameId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameSetsTableAnnotationComposer(
            $db: $db,
            $table: $db.gameSets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EventGamesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EventGamesTable,
          EventGame,
          $$EventGamesTableFilterComposer,
          $$EventGamesTableOrderingComposer,
          $$EventGamesTableAnnotationComposer,
          $$EventGamesTableCreateCompanionBuilder,
          $$EventGamesTableUpdateCompanionBuilder,
          (EventGame, $$EventGamesTableReferences),
          EventGame,
          PrefetchHooks Function({
            bool player1Id,
            bool player2Id,
            bool eventId,
            bool gameSetsRefs,
          })
        > {
  $$EventGamesTableTableManager(_$AppDatabase db, $EventGamesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventGamesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventGamesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EventGamesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> player1Id = const Value.absent(),
                Value<int> player2Id = const Value.absent(),
                Value<int> eventId = const Value.absent(),
              }) => EventGamesCompanion(
                id: id,
                player1Id: player1Id,
                player2Id: player2Id,
                eventId: eventId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int player1Id,
                required int player2Id,
                required int eventId,
              }) => EventGamesCompanion.insert(
                id: id,
                player1Id: player1Id,
                player2Id: player2Id,
                eventId: eventId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EventGamesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                player1Id = false,
                player2Id = false,
                eventId = false,
                gameSetsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (gameSetsRefs) db.gameSets],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (player1Id) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.player1Id,
                                    referencedTable: $$EventGamesTableReferences
                                        ._player1IdTable(db),
                                    referencedColumn:
                                        $$EventGamesTableReferences
                                            ._player1IdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (player2Id) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.player2Id,
                                    referencedTable: $$EventGamesTableReferences
                                        ._player2IdTable(db),
                                    referencedColumn:
                                        $$EventGamesTableReferences
                                            ._player2IdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (eventId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.eventId,
                                    referencedTable: $$EventGamesTableReferences
                                        ._eventIdTable(db),
                                    referencedColumn:
                                        $$EventGamesTableReferences
                                            ._eventIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (gameSetsRefs)
                        await $_getPrefetchedData<
                          EventGame,
                          $EventGamesTable,
                          GameSet
                        >(
                          currentTable: table,
                          referencedTable: $$EventGamesTableReferences
                              ._gameSetsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EventGamesTableReferences(
                                db,
                                table,
                                p0,
                              ).gameSetsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.gameId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$EventGamesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EventGamesTable,
      EventGame,
      $$EventGamesTableFilterComposer,
      $$EventGamesTableOrderingComposer,
      $$EventGamesTableAnnotationComposer,
      $$EventGamesTableCreateCompanionBuilder,
      $$EventGamesTableUpdateCompanionBuilder,
      (EventGame, $$EventGamesTableReferences),
      EventGame,
      PrefetchHooks Function({
        bool player1Id,
        bool player2Id,
        bool eventId,
        bool gameSetsRefs,
      })
    >;
typedef $$GameSetsTableCreateCompanionBuilder =
    GameSetsCompanion Function({
      Value<int> id,
      required int player1Id,
      required int player2Id,
      required int gameId,
    });
typedef $$GameSetsTableUpdateCompanionBuilder =
    GameSetsCompanion Function({
      Value<int> id,
      Value<int> player1Id,
      Value<int> player2Id,
      Value<int> gameId,
    });

final class $$GameSetsTableReferences
    extends BaseReferences<_$AppDatabase, $GameSetsTable, GameSet> {
  $$GameSetsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PlayersTable _player1IdTable(_$AppDatabase db) =>
      db.players.createAlias('game_sets__player1_id__players__id');

  $$PlayersTableProcessedTableManager get player1Id {
    final $_column = $_itemColumn<int>('player1_id')!;

    final manager = $$PlayersTableTableManager(
      $_db,
      $_db.players,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_player1IdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PlayersTable _player2IdTable(_$AppDatabase db) =>
      db.players.createAlias('game_sets__player2_id__players__id');

  $$PlayersTableProcessedTableManager get player2Id {
    final $_column = $_itemColumn<int>('player2_id')!;

    final manager = $$PlayersTableTableManager(
      $_db,
      $_db.players,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_player2IdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EventGamesTable _gameIdTable(_$AppDatabase db) =>
      db.eventGames.createAlias('game_sets__game_id__event_games__id');

  $$EventGamesTableProcessedTableManager get gameId {
    final $_column = $_itemColumn<int>('game_id')!;

    final manager = $$EventGamesTableTableManager(
      $_db,
      $_db.eventGames,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_gameIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$GameSetsTableFilterComposer
    extends Composer<_$AppDatabase, $GameSetsTable> {
  $$GameSetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  $$PlayersTableFilterComposer get player1Id {
    final $$PlayersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.player1Id,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableFilterComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlayersTableFilterComposer get player2Id {
    final $$PlayersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.player2Id,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableFilterComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EventGamesTableFilterComposer get gameId {
    final $$EventGamesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.gameId,
      referencedTable: $db.eventGames,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventGamesTableFilterComposer(
            $db: $db,
            $table: $db.eventGames,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GameSetsTableOrderingComposer
    extends Composer<_$AppDatabase, $GameSetsTable> {
  $$GameSetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  $$PlayersTableOrderingComposer get player1Id {
    final $$PlayersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.player1Id,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableOrderingComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlayersTableOrderingComposer get player2Id {
    final $$PlayersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.player2Id,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableOrderingComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EventGamesTableOrderingComposer get gameId {
    final $$EventGamesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.gameId,
      referencedTable: $db.eventGames,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventGamesTableOrderingComposer(
            $db: $db,
            $table: $db.eventGames,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GameSetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GameSetsTable> {
  $$GameSetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$PlayersTableAnnotationComposer get player1Id {
    final $$PlayersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.player1Id,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableAnnotationComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlayersTableAnnotationComposer get player2Id {
    final $$PlayersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.player2Id,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableAnnotationComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EventGamesTableAnnotationComposer get gameId {
    final $$EventGamesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.gameId,
      referencedTable: $db.eventGames,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventGamesTableAnnotationComposer(
            $db: $db,
            $table: $db.eventGames,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GameSetsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GameSetsTable,
          GameSet,
          $$GameSetsTableFilterComposer,
          $$GameSetsTableOrderingComposer,
          $$GameSetsTableAnnotationComposer,
          $$GameSetsTableCreateCompanionBuilder,
          $$GameSetsTableUpdateCompanionBuilder,
          (GameSet, $$GameSetsTableReferences),
          GameSet,
          PrefetchHooks Function({bool player1Id, bool player2Id, bool gameId})
        > {
  $$GameSetsTableTableManager(_$AppDatabase db, $GameSetsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GameSetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GameSetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GameSetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> player1Id = const Value.absent(),
                Value<int> player2Id = const Value.absent(),
                Value<int> gameId = const Value.absent(),
              }) => GameSetsCompanion(
                id: id,
                player1Id: player1Id,
                player2Id: player2Id,
                gameId: gameId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int player1Id,
                required int player2Id,
                required int gameId,
              }) => GameSetsCompanion.insert(
                id: id,
                player1Id: player1Id,
                player2Id: player2Id,
                gameId: gameId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$GameSetsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({player1Id = false, player2Id = false, gameId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (player1Id) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.player1Id,
                                    referencedTable: $$GameSetsTableReferences
                                        ._player1IdTable(db),
                                    referencedColumn: $$GameSetsTableReferences
                                        ._player1IdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (player2Id) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.player2Id,
                                    referencedTable: $$GameSetsTableReferences
                                        ._player2IdTable(db),
                                    referencedColumn: $$GameSetsTableReferences
                                        ._player2IdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (gameId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.gameId,
                                    referencedTable: $$GameSetsTableReferences
                                        ._gameIdTable(db),
                                    referencedColumn: $$GameSetsTableReferences
                                        ._gameIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$GameSetsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GameSetsTable,
      GameSet,
      $$GameSetsTableFilterComposer,
      $$GameSetsTableOrderingComposer,
      $$GameSetsTableAnnotationComposer,
      $$GameSetsTableCreateCompanionBuilder,
      $$GameSetsTableUpdateCompanionBuilder,
      (GameSet, $$GameSetsTableReferences),
      GameSet,
      PrefetchHooks Function({bool player1Id, bool player2Id, bool gameId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PlayersTableTableManager get players =>
      $$PlayersTableTableManager(_db, _db.players);
  $$LadderEventsTableTableManager get ladderEvents =>
      $$LadderEventsTableTableManager(_db, _db.ladderEvents);
  $$EventGamesTableTableManager get eventGames =>
      $$EventGamesTableTableManager(_db, _db.eventGames);
  $$GameSetsTableTableManager get gameSets =>
      $$GameSetsTableTableManager(_db, _db.gameSets);
}
