import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Future<Database> database() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      path.join(dbPath, 'places.db'),
      version: 1,
      onCreate: (database, version) {
        return database.execute(
          'CREATE TABLE places (id TEXT PRIMARY KEY, title TEXT, image TEXT)',
        );
      },
    );
  }

  static Future<void> insert(String table, Map<String, dynamic> data) async {
    final database = await DatabaseService.database();
    database.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
