import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._secretDBConstructor();
  static Database? _database;

  DatabaseHelper._secretDBConstructor();

  // use for 'get' access to the SQLite database
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  // initializes the SQLite database
  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'shopping_list.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate:
          _createDatabase, // callback fun which is called when the database id created
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
    CREATE TABLE shopping_list (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      description TEXT
    )
''');

    await db.execute('''
    CREATE TABLE shopping_item (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      quantity INTEGER,
      unitPrice REAL,
      inCart INTEGER,
      list_id INTEGER,
      FOREIGN KEY (list_id) REFERENCES shopping_list(id)
    )
''');
  }

  Future<int> insertList(Map<String, dynamic> list) async {
    Database db = await instance.database;
    return await db.insert('shopping_list', list);
  }

  Future<List<Map<String, dynamic>>> getAllLists() async {
    Database db = await instance.database;
    return await db.query('shopping_list');
  }

  Future<int> updateList(Map<String, dynamic> list) async {
    Database db = await instance.database;

    int id = list['id'];

    return await db
        .update('shopping_list', list, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteList(int id) async {
    Database db = await instance.database;

    return await db.delete('shopping_list', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> insertItem(Map<String, dynamic> item) async {
    Database db = await instance.database;
    return await db.insert('shopping_item', item);
  }

  Future<List<Map<String, dynamic>>> getItemsByList(int listId) async {
    Database db = await instance.database;
    return await db.query(
      'shopping_item',
      where: 'list_id = ?',
      whereArgs: [listId],
    );
  }

  Future<int> updateItem(Map<String, dynamic> item) async {
    Database db = await instance.database;
    int id = item['id'];
    return await db.update(
      'shopping_item',
      item,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteItem(int id) async {
    Database db = await instance.database;
    return await db.delete(
      'shopping_item',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
