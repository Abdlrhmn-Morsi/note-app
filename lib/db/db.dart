import 'package:molahzati/model/note.dart';
import 'package:molahzati/utilis/string.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHealper {
  DbHealper._();
  static final DbHealper db = DbHealper._();

  Future<Database> initDb() async {
    print('inintDatabase=================');
    var path = join(await getDatabasesPath(), 'note_database.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        return await db.execute('''
      CREATE TABLE $tableNote(
        $columnId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        $columnTitle TEXT NOT NULL,
        $columnContent TEXT NOT NULL,
        $columnDateTimeCreated TEXT NOT NULL);
        ''');
      },
    );
  }

  Future<int> addNote(Note note) async {
    final db = await initDb();
    return db.insert(
      tableNote,
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> updateNote(Note note) async {
    final db = await initDb();
    return db.update(
      tableNote,
      note.toMap(),
      where: '$columnId = ?',
      whereArgs: [note.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> deleteNote(Note note) async {
    final db = await initDb();
    return db.delete(
      tableNote,
      where: '$columnId = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> deleteAllNote() async {
    final db = await initDb();
    return db.delete(
      tableNote,
    );
  }

  Future<List<Note>> getAllNotes() async {
    final db = await initDb();
    final List<Map<String, dynamic>> dbMaps = await db.query(tableNote);
    return List.generate(dbMaps.length, (index) {
      return Note(
        id: dbMaps[index][columnId],
        title: dbMaps[index][columnTitle],
        content: dbMaps[index][columnContent],
        dateTimeCreated: dbMaps[index][columnDateTimeCreated],
      );
    });
  }
}
