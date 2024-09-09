// import 'dart:async';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import '../grocery_item/grocery_item.dart';
//
// class DatabaseHelper {
//   static final DatabaseHelper _instance = DatabaseHelper._internal();
//   factory DatabaseHelper() => _instance;
//   DatabaseHelper._internal();
//
//   static Database? _database;
//
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }
//
//   Future<Database> _initDatabase() async {
//     String path = join(await getDatabasesPath(), 'grocery.db');
//     print('Database Path: $path'); // Log the database path for debugging
//     return await openDatabase(
//       path,
//       version: 4,
//       onCreate: (db, version) async {
//         await db.execute(
//           'CREATE TABLE items(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, color TEXT NOT NULL)',
//         );
//       },
//       onUpgrade: (db, oldVersion, newVersion) async {
//         if (oldVersion < 4) {
//           // Example upgrade: Add new columns or modify schema
//            await db.execute('ALTER TABLE items ADD COLUMN new_column TEXT');
//         }
//       },
//     );
//   }
//
//   Future<int> insertItem(String name, String color) async {
//     try {
//       final db = await database;
//       int result = await db.insert(
//         'items',
//         {
//           'name': name,
//           'color': color,
//         },
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//       print('Inserted Item: $name');
//       return result;
//     } catch (e) {
//       print('Error inserting item: $e');
//       rethrow;
//     }
//   }
//
//   Future<List<GroceryItem>> fetchItems() async {
//     try {
//       final db = await database;
//       final List<Map<String, dynamic>> maps = await db.query('items');
//       print('Fetched Items: $maps');
//       return List.generate(maps.length, (i) {
//         return GroceryItem.fromMap(maps[i]);
//       });
//     } catch (e) {
//       print('Error fetching items: $e');
//       rethrow;
//     }
//   }
//
//   Future<int> deleteItem(String name) async {
//     try {
//       final db = await database;
//       return await db.delete(
//         'items',
//         where: 'name = ?',
//         whereArgs: [name],
//       );
//     } catch (e) {
//       print('Error deleting item: $e');
//       rethrow;
//     }
//   }
//
//   Future<bool> itemExists(String name) async {
//     try {
//       final db = await database;
//       final List<Map<String, dynamic>> result = await db.query(
//         'items',
//         where: 'name = ?',
//         whereArgs: [name],
//       );
//       return result.isNotEmpty;
//     } catch (e) {
//       print('Error checking if item exists: $e');
//       rethrow;
//     }
//   }
//
//   Future<void> closeDatabase() async {
//     try {
//       final db = _database;
//       if (db != null && db.isOpen) {
//         await db.close();
//         _database = null; // Set to null after closing to avoid reuse
//       }
//     } catch (e) {
//       print('Error closing database: $e');
//       rethrow;
//     }
//   }
//
// }
//
//
//






import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../grocery_item/grocery_item.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'grocery.db');
    print('Database Path: $path'); // Log the database path for debugging
    return await openDatabase(
      path,
      version: 4,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE items(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, color TEXT NOT NULL)',
        );
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 4) {
          // Example upgrade: Add new columns or modify schema
          await db.execute('ALTER TABLE items ADD COLUMN new_column TEXT');
        }
      },
    );
  }

  Future<int> insertItem(String name, String color) async {
    final db = await database;
    int result = await db.insert(
      'items',
      {
        'name': name,
        'color': color,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print('Inserted Item: $name');
    return result;
  }

  Future<List<GroceryItem>> fetchItems() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('items');
    print('Fetched Items: $maps');
    return List.generate(maps.length, (i) {
      return GroceryItem.fromMap(maps[i]);
    });
  }

  Future<int> deleteItem(String name) async {
    final db = await database;
    return await db.delete(
      'items',
      where: 'name = ?',
      whereArgs: [name],
    );
  }

  Future<bool> itemExists(String name) async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      'items',
      where: 'name = ?',
      whereArgs: [name],
    );
    return result.isNotEmpty;
  }

  Future<void> closeDatabase() async {
    final db = _database;
    if (db != null && db.isOpen) {
      await db.close();
      _database = null; // Set to null after closing to avoid reuse
    }
  }
}
