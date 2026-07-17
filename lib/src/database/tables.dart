import 'package:drift/drift.dart';
import 'package:ladder2/src/database/database.dart';

/// Which player won a [GameSet].
enum WinningPlayer {
  /// Player 1.
  player1,

  /// Player 2.
  player2,
}

/// Add an [id] column.
mixin IdMixin on Table {
  /// The primary key.
  IntColumn get id => integer().autoIncrement()();
}

/// The players table.
class Players extends Table with IdMixin {
  /// The name of the player.
  TextColumn get name => text()();

  /// When the player was deactivated.
  ///
  /// If [deactivated] is not `null`, then this player will not show up in the
  /// players list.
  DateTimeColumn get deactivated => dateTime().nullable()();
}

/// The events table.
class LadderEvents extends Table with IdMixin {
  /// The date and time of the event.
  DateTimeColumn get when => dateTime().withDefault(currentDateAndTime)();
}

/// The games table.
class EventGames extends Table with IdMixin {
  /// The event this game is part of.
  IntColumn get eventId =>
      integer().references(LadderEvents, #id, onDelete: KeyAction.cascade)();

  /// The ID of player 1.
  @ReferenceName('player1Games')
  IntColumn get player1Id =>
      integer().references(Players, #id, onDelete: KeyAction.cascade)();

  /// The ID of player 2.
  @ReferenceName('player2Games')
  IntColumn get player2Id =>
      integer().references(Players, #id, onDelete: KeyAction.cascade)();
}

/// The sets table.
class GameSets extends Table with IdMixin {
  /// The ID of the game this set is part of.
  IntColumn get gameId =>
      integer().references(EventGames, #id, onDelete: KeyAction.cascade)();

  /// Which player won this set.
  ///
  /// If [winningPlayer] is [WinningPlayer.player1], then the winner is the
  /// `player1Id` from the [EventGame]. Of it is [WinningPlayer.player2], then
  /// `player2Id`.
  IntColumn get winningPlayer => intEnum<WinningPlayer>()();
}

/// The points resets table.
class PointsResets extends Table with IdMixin {
  /// The name of this reset.
  ///
  /// If [name] is `null`, then [when] will be used.
  TextColumn get name => text().nullable()();

  /// The date when the reset was enacted.
  DateTimeColumn get when => dateTime().withDefault(currentDateAndTime)();
}
