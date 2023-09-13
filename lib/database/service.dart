import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'model.dart';

class TodoDatabaseService {
  Future<int> insert(Todo todo) async {
    final Database db = await open();
    return await db.insert('todos', todo.toMap());
  }

  Future<List<Todo>> getAll() async {
    final Database db = await open();
    final List<Map<String, dynamic>> maps = await db.query('todos');
    return List.generate(maps.length, (index) {
      return Todo(
        id: maps[index]['id'],
        title: maps[index]['title'],
        description: maps[index]['description'],
        date: maps[index]['date'],
        priority: maps[index]['priority'],
      );
    });
  }

  Future<int> update(Todo todo) async {
    final Database db = await open();
    return await db.update(
      'todos',
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  Future<int> delete(int id) async {
    final Database db = await open();
    return await db.delete(
      'todos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteAll() async {
    final Database db = await open();
    return await db.delete('todos');
  }

  Future<List<Todo>> getByTitle(String title) async {
    final Database db = await open();
    final List<Map<String, dynamic>> maps = await db.query(
      'todos',
      where: 'title LIKE ?',
      whereArgs: ['%$title%'],
    );
    return List.generate(maps.length, (index) {
      return Todo(
        id: maps[index]['id'],
        title: maps[index]['title'],
        description: maps[index]['description'],
        date: maps[index]['date'],
        priority: maps[index]['priority'],
      );
    });
  }
}

class UserDatabaseService {
  Future<int> createUser(User user) async {
    final Database db = await open();
    return await db.insert('user', user.toMap());
  }

  Future<User> getUser(String name) async {
    final Database db = await open();
    var result = await db.query('user', where: 'name = ?', whereArgs: [name]);
    var user = result.first;

    return User.fromJson(user);
  }

  Future<bool> checkUserAccount() async {
    final Database db = await open();

    var result = await db.query('user');
    if (result.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}

Future<Database> open() async {
  const String createUserTableStatement = '''
  CREATE TABLE USER IF NOT EXISTS user(
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    phone TEXT NOT NULL,
    password TEXT NOT NULL,
    imagePath TEXT NOT NULL

  );
''';

  const String createTodoTableStatement = '''
    CREATE TABLE IF NOT EXISTS todos(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT,
      description TEXT,
      date TEXT,
      priority INTEGER,
      status INTEGER
    )
  ''';

  final String path = await getDatabasesPath();
  return openDatabase(
    join(path, 'todos.db'),
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute(createUserTableStatement);
      await db.execute(createTodoTableStatement);
    },
  );
}
