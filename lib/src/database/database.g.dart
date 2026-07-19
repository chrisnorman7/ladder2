// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $PlayerDivisionsTable extends PlayerDivisions
    with TableInfo<$PlayerDivisionsTable, PlayerDivision> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlayerDivisionsTable(this.attachedDatabase, [this._alias]);
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
  static const String $name = 'player_divisions';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlayerDivision> instance, {
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
  PlayerDivision map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlayerDivision(
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
  $PlayerDivisionsTable createAlias(String alias) {
    return $PlayerDivisionsTable(attachedDatabase, alias);
  }
}

class PlayerDivision extends DataClass implements Insertable<PlayerDivision> {
  /// The primary key.
  final int id;

  /// The name of this row.
  final String name;
  const PlayerDivision({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  PlayerDivisionsCompanion toCompanion(bool nullToAbsent) {
    return PlayerDivisionsCompanion(id: Value(id), name: Value(name));
  }

  factory PlayerDivision.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlayerDivision(
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

  PlayerDivision copyWith({int? id, String? name}) =>
      PlayerDivision(id: id ?? this.id, name: name ?? this.name);
  PlayerDivision copyWithCompanion(PlayerDivisionsCompanion data) {
    return PlayerDivision(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlayerDivision(')
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
      (other is PlayerDivision &&
          other.id == this.id &&
          other.name == this.name);
}

class PlayerDivisionsCompanion extends UpdateCompanion<PlayerDivision> {
  final Value<int> id;
  final Value<String> name;
  const PlayerDivisionsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  PlayerDivisionsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<PlayerDivision> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  PlayerDivisionsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return PlayerDivisionsCompanion(id: id ?? this.id, name: name ?? this.name);
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
    return (StringBuffer('PlayerDivisionsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

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
  static const VerificationMeta _divisionIdMeta = const VerificationMeta(
    'divisionId',
  );
  @override
  late final GeneratedColumn<int> divisionId = GeneratedColumn<int>(
    'division_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES player_divisions (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _deactivatedMeta = const VerificationMeta(
    'deactivated',
  );
  @override
  late final GeneratedColumn<DateTime> deactivated = GeneratedColumn<DateTime>(
    'deactivated',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, divisionId, deactivated];
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
    if (data.containsKey('division_id')) {
      context.handle(
        _divisionIdMeta,
        divisionId.isAcceptableOrUnknown(data['division_id']!, _divisionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_divisionIdMeta);
    }
    if (data.containsKey('deactivated')) {
      context.handle(
        _deactivatedMeta,
        deactivated.isAcceptableOrUnknown(
          data['deactivated']!,
          _deactivatedMeta,
        ),
      );
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
      divisionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}division_id'],
      )!,
      deactivated: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deactivated'],
      ),
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

  /// The name of this row.
  final String name;

  /// The ID of the division this player belongs to.
  final int divisionId;

  /// When the player was deactivated.
  ///
  /// If [deactivated] is not `null`, then this player will not show up in the
  /// players list.
  final DateTime? deactivated;
  const Player({
    required this.id,
    required this.name,
    required this.divisionId,
    this.deactivated,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['division_id'] = Variable<int>(divisionId);
    if (!nullToAbsent || deactivated != null) {
      map['deactivated'] = Variable<DateTime>(deactivated);
    }
    return map;
  }

  PlayersCompanion toCompanion(bool nullToAbsent) {
    return PlayersCompanion(
      id: Value(id),
      name: Value(name),
      divisionId: Value(divisionId),
      deactivated: deactivated == null && nullToAbsent
          ? const Value.absent()
          : Value(deactivated),
    );
  }

  factory Player.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Player(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      divisionId: serializer.fromJson<int>(json['divisionId']),
      deactivated: serializer.fromJson<DateTime?>(json['deactivated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'divisionId': serializer.toJson<int>(divisionId),
      'deactivated': serializer.toJson<DateTime?>(deactivated),
    };
  }

  Player copyWith({
    int? id,
    String? name,
    int? divisionId,
    Value<DateTime?> deactivated = const Value.absent(),
  }) => Player(
    id: id ?? this.id,
    name: name ?? this.name,
    divisionId: divisionId ?? this.divisionId,
    deactivated: deactivated.present ? deactivated.value : this.deactivated,
  );
  Player copyWithCompanion(PlayersCompanion data) {
    return Player(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      divisionId: data.divisionId.present
          ? data.divisionId.value
          : this.divisionId,
      deactivated: data.deactivated.present
          ? data.deactivated.value
          : this.deactivated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Player(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('divisionId: $divisionId, ')
          ..write('deactivated: $deactivated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, divisionId, deactivated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Player &&
          other.id == this.id &&
          other.name == this.name &&
          other.divisionId == this.divisionId &&
          other.deactivated == this.deactivated);
}

class PlayersCompanion extends UpdateCompanion<Player> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> divisionId;
  final Value<DateTime?> deactivated;
  const PlayersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.divisionId = const Value.absent(),
    this.deactivated = const Value.absent(),
  });
  PlayersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int divisionId,
    this.deactivated = const Value.absent(),
  }) : name = Value(name),
       divisionId = Value(divisionId);
  static Insertable<Player> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? divisionId,
    Expression<DateTime>? deactivated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (divisionId != null) 'division_id': divisionId,
      if (deactivated != null) 'deactivated': deactivated,
    });
  }

  PlayersCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? divisionId,
    Value<DateTime?>? deactivated,
  }) {
    return PlayersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      divisionId: divisionId ?? this.divisionId,
      deactivated: deactivated ?? this.deactivated,
    );
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
    if (divisionId.present) {
      map['division_id'] = Variable<int>(divisionId.value);
    }
    if (deactivated.present) {
      map['deactivated'] = Variable<DateTime>(deactivated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('divisionId: $divisionId, ')
          ..write('deactivated: $deactivated')
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
  static const VerificationMeta _divisionIdMeta = const VerificationMeta(
    'divisionId',
  );
  @override
  late final GeneratedColumn<int> divisionId = GeneratedColumn<int>(
    'division_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES player_divisions (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, when, divisionId];
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
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('when')) {
      context.handle(
        _whenMeta,
        when.isAcceptableOrUnknown(data['when']!, _whenMeta),
      );
    }
    if (data.containsKey('division_id')) {
      context.handle(
        _divisionIdMeta,
        divisionId.isAcceptableOrUnknown(data['division_id']!, _divisionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_divisionIdMeta);
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
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      when: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}when'],
      )!,
      divisionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}division_id'],
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

  /// The name of this event.
  ///
  /// If [name] is `null`, then no name will be shown.
  final String? name;

  /// The date and time of the event.
  final DateTime when;

  /// The ID of the division this event is for.
  final int divisionId;
  const LadderEvent({
    required this.id,
    this.name,
    required this.when,
    required this.divisionId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    map['when'] = Variable<DateTime>(when);
    map['division_id'] = Variable<int>(divisionId);
    return map;
  }

  LadderEventsCompanion toCompanion(bool nullToAbsent) {
    return LadderEventsCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      when: Value(when),
      divisionId: Value(divisionId),
    );
  }

  factory LadderEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LadderEvent(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      when: serializer.fromJson<DateTime>(json['when']),
      divisionId: serializer.fromJson<int>(json['divisionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'when': serializer.toJson<DateTime>(when),
      'divisionId': serializer.toJson<int>(divisionId),
    };
  }

  LadderEvent copyWith({
    int? id,
    Value<String?> name = const Value.absent(),
    DateTime? when,
    int? divisionId,
  }) => LadderEvent(
    id: id ?? this.id,
    name: name.present ? name.value : this.name,
    when: when ?? this.when,
    divisionId: divisionId ?? this.divisionId,
  );
  LadderEvent copyWithCompanion(LadderEventsCompanion data) {
    return LadderEvent(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      when: data.when.present ? data.when.value : this.when,
      divisionId: data.divisionId.present
          ? data.divisionId.value
          : this.divisionId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LadderEvent(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('when: $when, ')
          ..write('divisionId: $divisionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, when, divisionId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LadderEvent &&
          other.id == this.id &&
          other.name == this.name &&
          other.when == this.when &&
          other.divisionId == this.divisionId);
}

class LadderEventsCompanion extends UpdateCompanion<LadderEvent> {
  final Value<int> id;
  final Value<String?> name;
  final Value<DateTime> when;
  final Value<int> divisionId;
  const LadderEventsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.when = const Value.absent(),
    this.divisionId = const Value.absent(),
  });
  LadderEventsCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.when = const Value.absent(),
    required int divisionId,
  }) : divisionId = Value(divisionId);
  static Insertable<LadderEvent> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? when,
    Expression<int>? divisionId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (when != null) 'when': when,
      if (divisionId != null) 'division_id': divisionId,
    });
  }

  LadderEventsCompanion copyWith({
    Value<int>? id,
    Value<String?>? name,
    Value<DateTime>? when,
    Value<int>? divisionId,
  }) {
    return LadderEventsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      when: when ?? this.when,
      divisionId: divisionId ?? this.divisionId,
    );
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
    if (when.present) {
      map['when'] = Variable<DateTime>(when.value);
    }
    if (divisionId.present) {
      map['division_id'] = Variable<int>(divisionId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LadderEventsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('when: $when, ')
          ..write('divisionId: $divisionId')
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
  @override
  List<GeneratedColumn> get $columns => [id, eventId, player1Id, player2Id];
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
    if (data.containsKey('event_id')) {
      context.handle(
        _eventIdMeta,
        eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta),
      );
    } else if (isInserting) {
      context.missing(_eventIdMeta);
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
      eventId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}event_id'],
      )!,
      player1Id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}player1_id'],
      )!,
      player2Id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}player2_id'],
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

  /// The event this game is part of.
  final int eventId;

  /// The ID of player 1.
  final int player1Id;

  /// The ID of player 2.
  final int player2Id;
  const EventGame({
    required this.id,
    required this.eventId,
    required this.player1Id,
    required this.player2Id,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['event_id'] = Variable<int>(eventId);
    map['player1_id'] = Variable<int>(player1Id);
    map['player2_id'] = Variable<int>(player2Id);
    return map;
  }

  EventGamesCompanion toCompanion(bool nullToAbsent) {
    return EventGamesCompanion(
      id: Value(id),
      eventId: Value(eventId),
      player1Id: Value(player1Id),
      player2Id: Value(player2Id),
    );
  }

  factory EventGame.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventGame(
      id: serializer.fromJson<int>(json['id']),
      eventId: serializer.fromJson<int>(json['eventId']),
      player1Id: serializer.fromJson<int>(json['player1Id']),
      player2Id: serializer.fromJson<int>(json['player2Id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'eventId': serializer.toJson<int>(eventId),
      'player1Id': serializer.toJson<int>(player1Id),
      'player2Id': serializer.toJson<int>(player2Id),
    };
  }

  EventGame copyWith({int? id, int? eventId, int? player1Id, int? player2Id}) =>
      EventGame(
        id: id ?? this.id,
        eventId: eventId ?? this.eventId,
        player1Id: player1Id ?? this.player1Id,
        player2Id: player2Id ?? this.player2Id,
      );
  EventGame copyWithCompanion(EventGamesCompanion data) {
    return EventGame(
      id: data.id.present ? data.id.value : this.id,
      eventId: data.eventId.present ? data.eventId.value : this.eventId,
      player1Id: data.player1Id.present ? data.player1Id.value : this.player1Id,
      player2Id: data.player2Id.present ? data.player2Id.value : this.player2Id,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventGame(')
          ..write('id: $id, ')
          ..write('eventId: $eventId, ')
          ..write('player1Id: $player1Id, ')
          ..write('player2Id: $player2Id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, eventId, player1Id, player2Id);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventGame &&
          other.id == this.id &&
          other.eventId == this.eventId &&
          other.player1Id == this.player1Id &&
          other.player2Id == this.player2Id);
}

class EventGamesCompanion extends UpdateCompanion<EventGame> {
  final Value<int> id;
  final Value<int> eventId;
  final Value<int> player1Id;
  final Value<int> player2Id;
  const EventGamesCompanion({
    this.id = const Value.absent(),
    this.eventId = const Value.absent(),
    this.player1Id = const Value.absent(),
    this.player2Id = const Value.absent(),
  });
  EventGamesCompanion.insert({
    this.id = const Value.absent(),
    required int eventId,
    required int player1Id,
    required int player2Id,
  }) : eventId = Value(eventId),
       player1Id = Value(player1Id),
       player2Id = Value(player2Id);
  static Insertable<EventGame> custom({
    Expression<int>? id,
    Expression<int>? eventId,
    Expression<int>? player1Id,
    Expression<int>? player2Id,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (eventId != null) 'event_id': eventId,
      if (player1Id != null) 'player1_id': player1Id,
      if (player2Id != null) 'player2_id': player2Id,
    });
  }

  EventGamesCompanion copyWith({
    Value<int>? id,
    Value<int>? eventId,
    Value<int>? player1Id,
    Value<int>? player2Id,
  }) {
    return EventGamesCompanion(
      id: id ?? this.id,
      eventId: eventId ?? this.eventId,
      player1Id: player1Id ?? this.player1Id,
      player2Id: player2Id ?? this.player2Id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<int>(eventId.value);
    }
    if (player1Id.present) {
      map['player1_id'] = Variable<int>(player1Id.value);
    }
    if (player2Id.present) {
      map['player2_id'] = Variable<int>(player2Id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventGamesCompanion(')
          ..write('id: $id, ')
          ..write('eventId: $eventId, ')
          ..write('player1Id: $player1Id, ')
          ..write('player2Id: $player2Id')
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
  late final GeneratedColumnWithTypeConverter<WinningPlayer, int>
  winningPlayer = GeneratedColumn<int>(
    'winning_player',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  ).withConverter<WinningPlayer>($GameSetsTable.$converterwinningPlayer);
  @override
  List<GeneratedColumn> get $columns => [id, gameId, winningPlayer];
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
      gameId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}game_id'],
      )!,
      winningPlayer: $GameSetsTable.$converterwinningPlayer.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}winning_player'],
        )!,
      ),
    );
  }

  @override
  $GameSetsTable createAlias(String alias) {
    return $GameSetsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<WinningPlayer, int, int> $converterwinningPlayer =
      const EnumIndexConverter<WinningPlayer>(WinningPlayer.values);
}

class GameSet extends DataClass implements Insertable<GameSet> {
  /// The primary key.
  final int id;

  /// The ID of the game this set is part of.
  final int gameId;

  /// Which player won this set.
  ///
  /// If [winningPlayer] is [WinningPlayer.player1], then the winner is the
  /// `player1Id` from the [EventGame]. Of it is [WinningPlayer.player2], then
  /// `player2Id`.
  final WinningPlayer winningPlayer;
  const GameSet({
    required this.id,
    required this.gameId,
    required this.winningPlayer,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['game_id'] = Variable<int>(gameId);
    {
      map['winning_player'] = Variable<int>(
        $GameSetsTable.$converterwinningPlayer.toSql(winningPlayer),
      );
    }
    return map;
  }

  GameSetsCompanion toCompanion(bool nullToAbsent) {
    return GameSetsCompanion(
      id: Value(id),
      gameId: Value(gameId),
      winningPlayer: Value(winningPlayer),
    );
  }

  factory GameSet.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameSet(
      id: serializer.fromJson<int>(json['id']),
      gameId: serializer.fromJson<int>(json['gameId']),
      winningPlayer: $GameSetsTable.$converterwinningPlayer.fromJson(
        serializer.fromJson<int>(json['winningPlayer']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'gameId': serializer.toJson<int>(gameId),
      'winningPlayer': serializer.toJson<int>(
        $GameSetsTable.$converterwinningPlayer.toJson(winningPlayer),
      ),
    };
  }

  GameSet copyWith({int? id, int? gameId, WinningPlayer? winningPlayer}) =>
      GameSet(
        id: id ?? this.id,
        gameId: gameId ?? this.gameId,
        winningPlayer: winningPlayer ?? this.winningPlayer,
      );
  GameSet copyWithCompanion(GameSetsCompanion data) {
    return GameSet(
      id: data.id.present ? data.id.value : this.id,
      gameId: data.gameId.present ? data.gameId.value : this.gameId,
      winningPlayer: data.winningPlayer.present
          ? data.winningPlayer.value
          : this.winningPlayer,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GameSet(')
          ..write('id: $id, ')
          ..write('gameId: $gameId, ')
          ..write('winningPlayer: $winningPlayer')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, gameId, winningPlayer);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameSet &&
          other.id == this.id &&
          other.gameId == this.gameId &&
          other.winningPlayer == this.winningPlayer);
}

class GameSetsCompanion extends UpdateCompanion<GameSet> {
  final Value<int> id;
  final Value<int> gameId;
  final Value<WinningPlayer> winningPlayer;
  const GameSetsCompanion({
    this.id = const Value.absent(),
    this.gameId = const Value.absent(),
    this.winningPlayer = const Value.absent(),
  });
  GameSetsCompanion.insert({
    this.id = const Value.absent(),
    required int gameId,
    required WinningPlayer winningPlayer,
  }) : gameId = Value(gameId),
       winningPlayer = Value(winningPlayer);
  static Insertable<GameSet> custom({
    Expression<int>? id,
    Expression<int>? gameId,
    Expression<int>? winningPlayer,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (gameId != null) 'game_id': gameId,
      if (winningPlayer != null) 'winning_player': winningPlayer,
    });
  }

  GameSetsCompanion copyWith({
    Value<int>? id,
    Value<int>? gameId,
    Value<WinningPlayer>? winningPlayer,
  }) {
    return GameSetsCompanion(
      id: id ?? this.id,
      gameId: gameId ?? this.gameId,
      winningPlayer: winningPlayer ?? this.winningPlayer,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (gameId.present) {
      map['game_id'] = Variable<int>(gameId.value);
    }
    if (winningPlayer.present) {
      map['winning_player'] = Variable<int>(
        $GameSetsTable.$converterwinningPlayer.toSql(winningPlayer.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameSetsCompanion(')
          ..write('id: $id, ')
          ..write('gameId: $gameId, ')
          ..write('winningPlayer: $winningPlayer')
          ..write(')'))
        .toString();
  }
}

class $PointsResetsTable extends PointsResets
    with TableInfo<$PointsResetsTable, PointsReset> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PointsResetsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _divisionIdMeta = const VerificationMeta(
    'divisionId',
  );
  @override
  late final GeneratedColumn<int> divisionId = GeneratedColumn<int>(
    'division_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES player_divisions (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
  List<GeneratedColumn> get $columns => [id, divisionId, name, when];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'points_resets';
  @override
  VerificationContext validateIntegrity(
    Insertable<PointsReset> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('division_id')) {
      context.handle(
        _divisionIdMeta,
        divisionId.isAcceptableOrUnknown(data['division_id']!, _divisionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_divisionIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
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
  PointsReset map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PointsReset(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      divisionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}division_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      when: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}when'],
      )!,
    );
  }

  @override
  $PointsResetsTable createAlias(String alias) {
    return $PointsResetsTable(attachedDatabase, alias);
  }
}

class PointsReset extends DataClass implements Insertable<PointsReset> {
  /// The primary key.
  final int id;

  /// The ID of the division this reset is for.
  final int divisionId;

  /// The name of this reset.
  ///
  /// If [name] is `null`, then [when] will be used.
  final String? name;

  /// The date when the reset was enacted.
  final DateTime when;
  const PointsReset({
    required this.id,
    required this.divisionId,
    this.name,
    required this.when,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['division_id'] = Variable<int>(divisionId);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    map['when'] = Variable<DateTime>(when);
    return map;
  }

  PointsResetsCompanion toCompanion(bool nullToAbsent) {
    return PointsResetsCompanion(
      id: Value(id),
      divisionId: Value(divisionId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      when: Value(when),
    );
  }

  factory PointsReset.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PointsReset(
      id: serializer.fromJson<int>(json['id']),
      divisionId: serializer.fromJson<int>(json['divisionId']),
      name: serializer.fromJson<String?>(json['name']),
      when: serializer.fromJson<DateTime>(json['when']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'divisionId': serializer.toJson<int>(divisionId),
      'name': serializer.toJson<String?>(name),
      'when': serializer.toJson<DateTime>(when),
    };
  }

  PointsReset copyWith({
    int? id,
    int? divisionId,
    Value<String?> name = const Value.absent(),
    DateTime? when,
  }) => PointsReset(
    id: id ?? this.id,
    divisionId: divisionId ?? this.divisionId,
    name: name.present ? name.value : this.name,
    when: when ?? this.when,
  );
  PointsReset copyWithCompanion(PointsResetsCompanion data) {
    return PointsReset(
      id: data.id.present ? data.id.value : this.id,
      divisionId: data.divisionId.present
          ? data.divisionId.value
          : this.divisionId,
      name: data.name.present ? data.name.value : this.name,
      when: data.when.present ? data.when.value : this.when,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PointsReset(')
          ..write('id: $id, ')
          ..write('divisionId: $divisionId, ')
          ..write('name: $name, ')
          ..write('when: $when')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, divisionId, name, when);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PointsReset &&
          other.id == this.id &&
          other.divisionId == this.divisionId &&
          other.name == this.name &&
          other.when == this.when);
}

class PointsResetsCompanion extends UpdateCompanion<PointsReset> {
  final Value<int> id;
  final Value<int> divisionId;
  final Value<String?> name;
  final Value<DateTime> when;
  const PointsResetsCompanion({
    this.id = const Value.absent(),
    this.divisionId = const Value.absent(),
    this.name = const Value.absent(),
    this.when = const Value.absent(),
  });
  PointsResetsCompanion.insert({
    this.id = const Value.absent(),
    required int divisionId,
    this.name = const Value.absent(),
    this.when = const Value.absent(),
  }) : divisionId = Value(divisionId);
  static Insertable<PointsReset> custom({
    Expression<int>? id,
    Expression<int>? divisionId,
    Expression<String>? name,
    Expression<DateTime>? when,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (divisionId != null) 'division_id': divisionId,
      if (name != null) 'name': name,
      if (when != null) 'when': when,
    });
  }

  PointsResetsCompanion copyWith({
    Value<int>? id,
    Value<int>? divisionId,
    Value<String?>? name,
    Value<DateTime>? when,
  }) {
    return PointsResetsCompanion(
      id: id ?? this.id,
      divisionId: divisionId ?? this.divisionId,
      name: name ?? this.name,
      when: when ?? this.when,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (divisionId.present) {
      map['division_id'] = Variable<int>(divisionId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (when.present) {
      map['when'] = Variable<DateTime>(when.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PointsResetsCompanion(')
          ..write('id: $id, ')
          ..write('divisionId: $divisionId, ')
          ..write('name: $name, ')
          ..write('when: $when')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PlayerDivisionsTable playerDivisions = $PlayerDivisionsTable(
    this,
  );
  late final $PlayersTable players = $PlayersTable(this);
  late final $LadderEventsTable ladderEvents = $LadderEventsTable(this);
  late final $EventGamesTable eventGames = $EventGamesTable(this);
  late final $GameSetsTable gameSets = $GameSetsTable(this);
  late final $PointsResetsTable pointsResets = $PointsResetsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    playerDivisions,
    players,
    ladderEvents,
    eventGames,
    gameSets,
    pointsResets,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'player_divisions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('players', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'player_divisions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('ladder_events', kind: UpdateKind.delete)],
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
        'event_games',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('game_sets', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'player_divisions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('points_resets', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$PlayerDivisionsTableCreateCompanionBuilder =
    PlayerDivisionsCompanion Function({Value<int> id, required String name});
typedef $$PlayerDivisionsTableUpdateCompanionBuilder =
    PlayerDivisionsCompanion Function({Value<int> id, Value<String> name});

final class $$PlayerDivisionsTableReferences
    extends
        BaseReferences<_$AppDatabase, $PlayerDivisionsTable, PlayerDivision> {
  $$PlayerDivisionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$PlayersTable, List<Player>> _playersRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.players,
    aliasName: 'player_divisions__id__players__division_id',
  );

  $$PlayersTableProcessedTableManager get playersRefs {
    final manager = $$PlayersTableTableManager(
      $_db,
      $_db.players,
    ).filter((f) => f.divisionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_playersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$LadderEventsTable, List<LadderEvent>>
  _ladderEventsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.ladderEvents,
    aliasName: 'player_divisions__id__ladder_events__division_id',
  );

  $$LadderEventsTableProcessedTableManager get ladderEventsRefs {
    final manager = $$LadderEventsTableTableManager(
      $_db,
      $_db.ladderEvents,
    ).filter((f) => f.divisionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_ladderEventsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PointsResetsTable, List<PointsReset>>
  _pointsResetsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.pointsResets,
    aliasName: 'player_divisions__id__points_resets__division_id',
  );

  $$PointsResetsTableProcessedTableManager get pointsResetsRefs {
    final manager = $$PointsResetsTableTableManager(
      $_db,
      $_db.pointsResets,
    ).filter((f) => f.divisionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_pointsResetsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PlayerDivisionsTableFilterComposer
    extends Composer<_$AppDatabase, $PlayerDivisionsTable> {
  $$PlayerDivisionsTableFilterComposer({
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

  Expression<bool> playersRefs(
    Expression<bool> Function($$PlayersTableFilterComposer f) f,
  ) {
    final $$PlayersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.divisionId,
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
    return f(composer);
  }

  Expression<bool> ladderEventsRefs(
    Expression<bool> Function($$LadderEventsTableFilterComposer f) f,
  ) {
    final $$LadderEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ladderEvents,
      getReferencedColumn: (t) => t.divisionId,
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
    return f(composer);
  }

  Expression<bool> pointsResetsRefs(
    Expression<bool> Function($$PointsResetsTableFilterComposer f) f,
  ) {
    final $$PointsResetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.pointsResets,
      getReferencedColumn: (t) => t.divisionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PointsResetsTableFilterComposer(
            $db: $db,
            $table: $db.pointsResets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PlayerDivisionsTableOrderingComposer
    extends Composer<_$AppDatabase, $PlayerDivisionsTable> {
  $$PlayerDivisionsTableOrderingComposer({
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

class $$PlayerDivisionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlayerDivisionsTable> {
  $$PlayerDivisionsTableAnnotationComposer({
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

  Expression<T> playersRefs<T extends Object>(
    Expression<T> Function($$PlayersTableAnnotationComposer a) f,
  ) {
    final $$PlayersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.divisionId,
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
    return f(composer);
  }

  Expression<T> ladderEventsRefs<T extends Object>(
    Expression<T> Function($$LadderEventsTableAnnotationComposer a) f,
  ) {
    final $$LadderEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ladderEvents,
      getReferencedColumn: (t) => t.divisionId,
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
    return f(composer);
  }

  Expression<T> pointsResetsRefs<T extends Object>(
    Expression<T> Function($$PointsResetsTableAnnotationComposer a) f,
  ) {
    final $$PointsResetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.pointsResets,
      getReferencedColumn: (t) => t.divisionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PointsResetsTableAnnotationComposer(
            $db: $db,
            $table: $db.pointsResets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PlayerDivisionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlayerDivisionsTable,
          PlayerDivision,
          $$PlayerDivisionsTableFilterComposer,
          $$PlayerDivisionsTableOrderingComposer,
          $$PlayerDivisionsTableAnnotationComposer,
          $$PlayerDivisionsTableCreateCompanionBuilder,
          $$PlayerDivisionsTableUpdateCompanionBuilder,
          (PlayerDivision, $$PlayerDivisionsTableReferences),
          PlayerDivision,
          PrefetchHooks Function({
            bool playersRefs,
            bool ladderEventsRefs,
            bool pointsResetsRefs,
          })
        > {
  $$PlayerDivisionsTableTableManager(
    _$AppDatabase db,
    $PlayerDivisionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlayerDivisionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlayerDivisionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlayerDivisionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => PlayerDivisionsCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  PlayerDivisionsCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PlayerDivisionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                playersRefs = false,
                ladderEventsRefs = false,
                pointsResetsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (playersRefs) db.players,
                    if (ladderEventsRefs) db.ladderEvents,
                    if (pointsResetsRefs) db.pointsResets,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (playersRefs)
                        await $_getPrefetchedData<
                          PlayerDivision,
                          $PlayerDivisionsTable,
                          Player
                        >(
                          currentTable: table,
                          referencedTable: $$PlayerDivisionsTableReferences
                              ._playersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlayerDivisionsTableReferences(
                                db,
                                table,
                                p0,
                              ).playersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.divisionId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (ladderEventsRefs)
                        await $_getPrefetchedData<
                          PlayerDivision,
                          $PlayerDivisionsTable,
                          LadderEvent
                        >(
                          currentTable: table,
                          referencedTable: $$PlayerDivisionsTableReferences
                              ._ladderEventsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlayerDivisionsTableReferences(
                                db,
                                table,
                                p0,
                              ).ladderEventsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.divisionId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (pointsResetsRefs)
                        await $_getPrefetchedData<
                          PlayerDivision,
                          $PlayerDivisionsTable,
                          PointsReset
                        >(
                          currentTable: table,
                          referencedTable: $$PlayerDivisionsTableReferences
                              ._pointsResetsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlayerDivisionsTableReferences(
                                db,
                                table,
                                p0,
                              ).pointsResetsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.divisionId == item.id,
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

typedef $$PlayerDivisionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlayerDivisionsTable,
      PlayerDivision,
      $$PlayerDivisionsTableFilterComposer,
      $$PlayerDivisionsTableOrderingComposer,
      $$PlayerDivisionsTableAnnotationComposer,
      $$PlayerDivisionsTableCreateCompanionBuilder,
      $$PlayerDivisionsTableUpdateCompanionBuilder,
      (PlayerDivision, $$PlayerDivisionsTableReferences),
      PlayerDivision,
      PrefetchHooks Function({
        bool playersRefs,
        bool ladderEventsRefs,
        bool pointsResetsRefs,
      })
    >;
typedef $$PlayersTableCreateCompanionBuilder =
    PlayersCompanion Function({
      Value<int> id,
      required String name,
      required int divisionId,
      Value<DateTime?> deactivated,
    });
typedef $$PlayersTableUpdateCompanionBuilder =
    PlayersCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> divisionId,
      Value<DateTime?> deactivated,
    });

final class $$PlayersTableReferences
    extends BaseReferences<_$AppDatabase, $PlayersTable, Player> {
  $$PlayersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PlayerDivisionsTable _divisionIdTable(_$AppDatabase db) => db
      .playerDivisions
      .createAlias('players__division_id__player_divisions__id');

  $$PlayerDivisionsTableProcessedTableManager get divisionId {
    final $_column = $_itemColumn<int>('division_id')!;

    final manager = $$PlayerDivisionsTableTableManager(
      $_db,
      $_db.playerDivisions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_divisionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$EventGamesTable, List<EventGame>>
  _player1GamesTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.eventGames,
    aliasName: 'players__id__event_games__player1_id',
  );

  $$EventGamesTableProcessedTableManager get player1Games {
    final manager = $$EventGamesTableTableManager(
      $_db,
      $_db.eventGames,
    ).filter((f) => f.player1Id.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_player1GamesTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$EventGamesTable, List<EventGame>>
  _player2GamesTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.eventGames,
    aliasName: 'players__id__event_games__player2_id',
  );

  $$EventGamesTableProcessedTableManager get player2Games {
    final manager = $$EventGamesTableTableManager(
      $_db,
      $_db.eventGames,
    ).filter((f) => f.player2Id.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_player2GamesTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

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

  ColumnFilters<DateTime> get deactivated => $composableBuilder(
    column: $table.deactivated,
    builder: (column) => ColumnFilters(column),
  );

  $$PlayerDivisionsTableFilterComposer get divisionId {
    final $$PlayerDivisionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.divisionId,
      referencedTable: $db.playerDivisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayerDivisionsTableFilterComposer(
            $db: $db,
            $table: $db.playerDivisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> player1Games(
    Expression<bool> Function($$EventGamesTableFilterComposer f) f,
  ) {
    final $$EventGamesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventGames,
      getReferencedColumn: (t) => t.player1Id,
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

  Expression<bool> player2Games(
    Expression<bool> Function($$EventGamesTableFilterComposer f) f,
  ) {
    final $$EventGamesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventGames,
      getReferencedColumn: (t) => t.player2Id,
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

  ColumnOrderings<DateTime> get deactivated => $composableBuilder(
    column: $table.deactivated,
    builder: (column) => ColumnOrderings(column),
  );

  $$PlayerDivisionsTableOrderingComposer get divisionId {
    final $$PlayerDivisionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.divisionId,
      referencedTable: $db.playerDivisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayerDivisionsTableOrderingComposer(
            $db: $db,
            $table: $db.playerDivisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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

  GeneratedColumn<DateTime> get deactivated => $composableBuilder(
    column: $table.deactivated,
    builder: (column) => column,
  );

  $$PlayerDivisionsTableAnnotationComposer get divisionId {
    final $$PlayerDivisionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.divisionId,
      referencedTable: $db.playerDivisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayerDivisionsTableAnnotationComposer(
            $db: $db,
            $table: $db.playerDivisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> player1Games<T extends Object>(
    Expression<T> Function($$EventGamesTableAnnotationComposer a) f,
  ) {
    final $$EventGamesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventGames,
      getReferencedColumn: (t) => t.player1Id,
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

  Expression<T> player2Games<T extends Object>(
    Expression<T> Function($$EventGamesTableAnnotationComposer a) f,
  ) {
    final $$EventGamesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventGames,
      getReferencedColumn: (t) => t.player2Id,
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
          (Player, $$PlayersTableReferences),
          Player,
          PrefetchHooks Function({
            bool divisionId,
            bool player1Games,
            bool player2Games,
          })
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
                Value<int> divisionId = const Value.absent(),
                Value<DateTime?> deactivated = const Value.absent(),
              }) => PlayersCompanion(
                id: id,
                name: name,
                divisionId: divisionId,
                deactivated: deactivated,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int divisionId,
                Value<DateTime?> deactivated = const Value.absent(),
              }) => PlayersCompanion.insert(
                id: id,
                name: name,
                divisionId: divisionId,
                deactivated: deactivated,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PlayersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                divisionId = false,
                player1Games = false,
                player2Games = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (player1Games) db.eventGames,
                    if (player2Games) db.eventGames,
                  ],
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
                        if (divisionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.divisionId,
                                    referencedTable: $$PlayersTableReferences
                                        ._divisionIdTable(db),
                                    referencedColumn: $$PlayersTableReferences
                                        ._divisionIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (player1Games)
                        await $_getPrefetchedData<
                          Player,
                          $PlayersTable,
                          EventGame
                        >(
                          currentTable: table,
                          referencedTable: $$PlayersTableReferences
                              ._player1GamesTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlayersTableReferences(
                                db,
                                table,
                                p0,
                              ).player1Games,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.player1Id == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (player2Games)
                        await $_getPrefetchedData<
                          Player,
                          $PlayersTable,
                          EventGame
                        >(
                          currentTable: table,
                          referencedTable: $$PlayersTableReferences
                              ._player2GamesTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlayersTableReferences(
                                db,
                                table,
                                p0,
                              ).player2Games,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.player2Id == item.id,
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
      (Player, $$PlayersTableReferences),
      Player,
      PrefetchHooks Function({
        bool divisionId,
        bool player1Games,
        bool player2Games,
      })
    >;
typedef $$LadderEventsTableCreateCompanionBuilder =
    LadderEventsCompanion Function({
      Value<int> id,
      Value<String?> name,
      Value<DateTime> when,
      required int divisionId,
    });
typedef $$LadderEventsTableUpdateCompanionBuilder =
    LadderEventsCompanion Function({
      Value<int> id,
      Value<String?> name,
      Value<DateTime> when,
      Value<int> divisionId,
    });

final class $$LadderEventsTableReferences
    extends BaseReferences<_$AppDatabase, $LadderEventsTable, LadderEvent> {
  $$LadderEventsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PlayerDivisionsTable _divisionIdTable(_$AppDatabase db) => db
      .playerDivisions
      .createAlias('ladder_events__division_id__player_divisions__id');

  $$PlayerDivisionsTableProcessedTableManager get divisionId {
    final $_column = $_itemColumn<int>('division_id')!;

    final manager = $$PlayerDivisionsTableTableManager(
      $_db,
      $_db.playerDivisions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_divisionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get when => $composableBuilder(
    column: $table.when,
    builder: (column) => ColumnFilters(column),
  );

  $$PlayerDivisionsTableFilterComposer get divisionId {
    final $$PlayerDivisionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.divisionId,
      referencedTable: $db.playerDivisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayerDivisionsTableFilterComposer(
            $db: $db,
            $table: $db.playerDivisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get when => $composableBuilder(
    column: $table.when,
    builder: (column) => ColumnOrderings(column),
  );

  $$PlayerDivisionsTableOrderingComposer get divisionId {
    final $$PlayerDivisionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.divisionId,
      referencedTable: $db.playerDivisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayerDivisionsTableOrderingComposer(
            $db: $db,
            $table: $db.playerDivisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get when =>
      $composableBuilder(column: $table.when, builder: (column) => column);

  $$PlayerDivisionsTableAnnotationComposer get divisionId {
    final $$PlayerDivisionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.divisionId,
      referencedTable: $db.playerDivisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayerDivisionsTableAnnotationComposer(
            $db: $db,
            $table: $db.playerDivisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

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
          PrefetchHooks Function({bool divisionId, bool eventGamesRefs})
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
                Value<String?> name = const Value.absent(),
                Value<DateTime> when = const Value.absent(),
                Value<int> divisionId = const Value.absent(),
              }) => LadderEventsCompanion(
                id: id,
                name: name,
                when: when,
                divisionId: divisionId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<DateTime> when = const Value.absent(),
                required int divisionId,
              }) => LadderEventsCompanion.insert(
                id: id,
                name: name,
                when: when,
                divisionId: divisionId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LadderEventsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({divisionId = false, eventGamesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (eventGamesRefs) db.eventGames],
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
                        if (divisionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.divisionId,
                                    referencedTable:
                                        $$LadderEventsTableReferences
                                            ._divisionIdTable(db),
                                    referencedColumn:
                                        $$LadderEventsTableReferences
                                            ._divisionIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
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
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.eventId == item.id,
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
      PrefetchHooks Function({bool divisionId, bool eventGamesRefs})
    >;
typedef $$EventGamesTableCreateCompanionBuilder =
    EventGamesCompanion Function({
      Value<int> id,
      required int eventId,
      required int player1Id,
      required int player2Id,
    });
typedef $$EventGamesTableUpdateCompanionBuilder =
    EventGamesCompanion Function({
      Value<int> id,
      Value<int> eventId,
      Value<int> player1Id,
      Value<int> player2Id,
    });

final class $$EventGamesTableReferences
    extends BaseReferences<_$AppDatabase, $EventGamesTable, EventGame> {
  $$EventGamesTableReferences(super.$_db, super.$_table, super.$_typedResult);

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
            bool eventId,
            bool player1Id,
            bool player2Id,
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
                Value<int> eventId = const Value.absent(),
                Value<int> player1Id = const Value.absent(),
                Value<int> player2Id = const Value.absent(),
              }) => EventGamesCompanion(
                id: id,
                eventId: eventId,
                player1Id: player1Id,
                player2Id: player2Id,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int eventId,
                required int player1Id,
                required int player2Id,
              }) => EventGamesCompanion.insert(
                id: id,
                eventId: eventId,
                player1Id: player1Id,
                player2Id: player2Id,
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
                eventId = false,
                player1Id = false,
                player2Id = false,
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
        bool eventId,
        bool player1Id,
        bool player2Id,
        bool gameSetsRefs,
      })
    >;
typedef $$GameSetsTableCreateCompanionBuilder =
    GameSetsCompanion Function({
      Value<int> id,
      required int gameId,
      required WinningPlayer winningPlayer,
    });
typedef $$GameSetsTableUpdateCompanionBuilder =
    GameSetsCompanion Function({
      Value<int> id,
      Value<int> gameId,
      Value<WinningPlayer> winningPlayer,
    });

final class $$GameSetsTableReferences
    extends BaseReferences<_$AppDatabase, $GameSetsTable, GameSet> {
  $$GameSetsTableReferences(super.$_db, super.$_table, super.$_typedResult);

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

  ColumnWithTypeConverterFilters<WinningPlayer, WinningPlayer, int>
  get winningPlayer => $composableBuilder(
    column: $table.winningPlayer,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

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

  ColumnOrderings<int> get winningPlayer => $composableBuilder(
    column: $table.winningPlayer,
    builder: (column) => ColumnOrderings(column),
  );

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

  GeneratedColumnWithTypeConverter<WinningPlayer, int> get winningPlayer =>
      $composableBuilder(
        column: $table.winningPlayer,
        builder: (column) => column,
      );

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
          PrefetchHooks Function({bool gameId})
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
                Value<int> gameId = const Value.absent(),
                Value<WinningPlayer> winningPlayer = const Value.absent(),
              }) => GameSetsCompanion(
                id: id,
                gameId: gameId,
                winningPlayer: winningPlayer,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int gameId,
                required WinningPlayer winningPlayer,
              }) => GameSetsCompanion.insert(
                id: id,
                gameId: gameId,
                winningPlayer: winningPlayer,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$GameSetsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({gameId = false}) {
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
      PrefetchHooks Function({bool gameId})
    >;
typedef $$PointsResetsTableCreateCompanionBuilder =
    PointsResetsCompanion Function({
      Value<int> id,
      required int divisionId,
      Value<String?> name,
      Value<DateTime> when,
    });
typedef $$PointsResetsTableUpdateCompanionBuilder =
    PointsResetsCompanion Function({
      Value<int> id,
      Value<int> divisionId,
      Value<String?> name,
      Value<DateTime> when,
    });

final class $$PointsResetsTableReferences
    extends BaseReferences<_$AppDatabase, $PointsResetsTable, PointsReset> {
  $$PointsResetsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PlayerDivisionsTable _divisionIdTable(_$AppDatabase db) => db
      .playerDivisions
      .createAlias('points_resets__division_id__player_divisions__id');

  $$PlayerDivisionsTableProcessedTableManager get divisionId {
    final $_column = $_itemColumn<int>('division_id')!;

    final manager = $$PlayerDivisionsTableTableManager(
      $_db,
      $_db.playerDivisions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_divisionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PointsResetsTableFilterComposer
    extends Composer<_$AppDatabase, $PointsResetsTable> {
  $$PointsResetsTableFilterComposer({
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

  ColumnFilters<DateTime> get when => $composableBuilder(
    column: $table.when,
    builder: (column) => ColumnFilters(column),
  );

  $$PlayerDivisionsTableFilterComposer get divisionId {
    final $$PlayerDivisionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.divisionId,
      referencedTable: $db.playerDivisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayerDivisionsTableFilterComposer(
            $db: $db,
            $table: $db.playerDivisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PointsResetsTableOrderingComposer
    extends Composer<_$AppDatabase, $PointsResetsTable> {
  $$PointsResetsTableOrderingComposer({
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

  ColumnOrderings<DateTime> get when => $composableBuilder(
    column: $table.when,
    builder: (column) => ColumnOrderings(column),
  );

  $$PlayerDivisionsTableOrderingComposer get divisionId {
    final $$PlayerDivisionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.divisionId,
      referencedTable: $db.playerDivisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayerDivisionsTableOrderingComposer(
            $db: $db,
            $table: $db.playerDivisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PointsResetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PointsResetsTable> {
  $$PointsResetsTableAnnotationComposer({
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

  GeneratedColumn<DateTime> get when =>
      $composableBuilder(column: $table.when, builder: (column) => column);

  $$PlayerDivisionsTableAnnotationComposer get divisionId {
    final $$PlayerDivisionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.divisionId,
      referencedTable: $db.playerDivisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayerDivisionsTableAnnotationComposer(
            $db: $db,
            $table: $db.playerDivisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PointsResetsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PointsResetsTable,
          PointsReset,
          $$PointsResetsTableFilterComposer,
          $$PointsResetsTableOrderingComposer,
          $$PointsResetsTableAnnotationComposer,
          $$PointsResetsTableCreateCompanionBuilder,
          $$PointsResetsTableUpdateCompanionBuilder,
          (PointsReset, $$PointsResetsTableReferences),
          PointsReset,
          PrefetchHooks Function({bool divisionId})
        > {
  $$PointsResetsTableTableManager(_$AppDatabase db, $PointsResetsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PointsResetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PointsResetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PointsResetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> divisionId = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<DateTime> when = const Value.absent(),
              }) => PointsResetsCompanion(
                id: id,
                divisionId: divisionId,
                name: name,
                when: when,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int divisionId,
                Value<String?> name = const Value.absent(),
                Value<DateTime> when = const Value.absent(),
              }) => PointsResetsCompanion.insert(
                id: id,
                divisionId: divisionId,
                name: name,
                when: when,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PointsResetsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({divisionId = false}) {
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
                    if (divisionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.divisionId,
                                referencedTable: $$PointsResetsTableReferences
                                    ._divisionIdTable(db),
                                referencedColumn: $$PointsResetsTableReferences
                                    ._divisionIdTable(db)
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

typedef $$PointsResetsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PointsResetsTable,
      PointsReset,
      $$PointsResetsTableFilterComposer,
      $$PointsResetsTableOrderingComposer,
      $$PointsResetsTableAnnotationComposer,
      $$PointsResetsTableCreateCompanionBuilder,
      $$PointsResetsTableUpdateCompanionBuilder,
      (PointsReset, $$PointsResetsTableReferences),
      PointsReset,
      PrefetchHooks Function({bool divisionId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PlayerDivisionsTableTableManager get playerDivisions =>
      $$PlayerDivisionsTableTableManager(_db, _db.playerDivisions);
  $$PlayersTableTableManager get players =>
      $$PlayersTableTableManager(_db, _db.players);
  $$LadderEventsTableTableManager get ladderEvents =>
      $$LadderEventsTableTableManager(_db, _db.ladderEvents);
  $$EventGamesTableTableManager get eventGames =>
      $$EventGamesTableTableManager(_db, _db.eventGames);
  $$GameSetsTableTableManager get gameSets =>
      $$GameSetsTableTableManager(_db, _db.gameSets);
  $$PointsResetsTableTableManager get pointsResets =>
      $$PointsResetsTableTableManager(_db, _db.pointsResets);
}
