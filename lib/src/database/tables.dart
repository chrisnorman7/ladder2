import 'package:drift/drift.dart';

/// Add an [id] column.
mixin IdMixin on Table {
  /// The primary key.
  IntColumn get id => integer().autoIncrement()();
}

/// Add [player1Id] and [player2Id] to any table.
mixin PlayersMixin on Table {
  /// The ID of player 1.
  IntColumn get player1Id =>
      integer().references(Players, #id, onDelete: KeyAction.cascade)();

  /// The ID of player 2.
  IntColumn get player2Id =>
      integer().references(Players, #id, onDelete: KeyAction.cascade)();
}

/// The players table.
class Players extends Table with IdMixin {
  /// The name of the player.
  TextColumn get name => text()();
}

/// The events table.
class LadderEvents extends Table with IdMixin {
  /// The date and time of the event.
  DateTimeColumn get when => dateTime().withDefault(currentDateAndTime)();
}

/// The games table.
class EventGames extends Table with IdMixin, PlayersMixin {
  /// The event this game is part of.
  IntColumn get eventId =>
      integer().references(LadderEvents, #id, onDelete: KeyAction.cascade)();
}

/// The sets table.
class GameSets extends Table with IdMixin, PlayersMixin {
  /// The ID of the game this set is part of.
  IntColumn get gameId =>
      integer().references(EventGames, #id, onDelete: KeyAction.cascade)();
}
