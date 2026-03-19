import 'package:flutter_event_navigation/model/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabaseService {
  static final LocalDatabaseService _instance =
      LocalDatabaseService._internal();
  factory LocalDatabaseService() => _instance;
  LocalDatabaseService._internal();

  Database? _database;
  final String _userTable = 'users';

  // create db instance
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initializeDatabase();
    return _database!;
  }

  // init db
  Future<Database> _initializeDatabase() async {
    // Get the path to the database file
    final String path = join(
      await getDatabasesPath(),
      'flutter_fundamental.db',
    );

    // Open or create the database
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        phone TEXT NOT NULL,
        createdAt TEXT NOT NULL
      )
    ''');
      },
    );
  }

  // create db
  // Future<void> _createTables(Database db, int version) async {
  //   // Users table
  //   await db.execute('''
  //     CREATE TABLE users (
  //       id INTEGER PRIMARY KEY AUTOINCREMENT,
  //       name TEXT NOT NULL,
  //       email TEXT UNIQUE NOT NULL,
  //       phone TEXT NOT NULL,
  //       createdAt TEXT NOT NULL
  //     )
  //   ''');
  // }

  // add user
  Future<int> insertUser(User user) async {
    try {
      final db = await database;

      final id = await db.insert(
        _userTable,
        user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      return id;
    } catch (e) {
      rethrow;
    }
  }

  // get all
  Future<List<User>> getAllUsers() async {
    try {
      final db = await database;
      // select * from users;
      final List<Map<String, dynamic>> maps = await db.query(_userTable);

      if (maps.isEmpty) {
        return [];
      }

      return List.generate(maps.length, (i) => User.fromMap(maps[i]));
    } catch (e) {
      rethrow;
    }
  }

  // get by id
  Future<User?> getUserById(int id) async {
    try {
      // select from users where id = id;
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query(
        _userTable,
        where: 'id = ?',
        whereArgs: [id],
      );

      if (maps.isEmpty) {
        return null;
      }

      return User.fromMap(maps.first);
    } catch (e) {
      rethrow;
    }
  }

  // update user
  Future<int> updateUser(User user) async {
    try {
      if (user.id == null) {
        throw Exception('User ID cannot be null for update');
      }

      final db = await database;
      final count = await db.update(
        'users',
        user.toMap(),
        where: 'id = ?',
        whereArgs: [user.id],
      );

      return count;
    } catch (e) {
      rethrow;
    }
  }

  // dekete user
  Future<int> deleteUser(int id) async {
    try {
      final db = await database;
      final count = await db.delete('users', where: 'id = ?', whereArgs: [id]);

      return count;
    } catch (e) {
      rethrow;
    }
  }

  // delete all
  Future<int> deleteAllUsers() async {
    try {
      final db = await database;
      final count = await db.delete('users');

      return count;
    } catch (e) {
      rethrow;
    }
  }

  // close
  Future<void> closeDatabase() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }
}
