import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SqfLite {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE mahasiswa(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nama TEXT,
        nim TEXT,
        email TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'mahasiswa.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createMahasiswa(
      String? nama, String? nim, String? email) async {
    final db = await SqfLite.db();

    final data = {'nama': nama, 'nim': nim, 'email': email};
    final id = await db.insert('mahasiswa', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getMahasiswa() async {
    final db = await SqfLite.db();
    return db.query('mahasiswa', orderBy: "id");
  }

  static Future<int> updateMahasiswa(
      int id, String nama, String nim, String email) async {
    final db = await SqfLite.db();

    final data = {
      'nama': nama,
      'nim': nim,
      'email': email,
      'createdAt': DateTime.now().toString()
    };

    final result =
        await db.update('mahasiswa', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteMahasiswa(int id) async {
    final db = await SqfLite.db();
    try {
      await db.delete("mahasiswa", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting a mahasiswa: $err");
    }
  }
}
