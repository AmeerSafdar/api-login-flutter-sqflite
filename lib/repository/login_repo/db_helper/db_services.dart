import 'package:msincl/helper/constants/common_keys.dart';
import 'package:msincl/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

class DB_Helper {
  Database? _db;
  final int _version = 1;
  Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + '${CommonKey.db_name}';
      _db =
          await openDatabase(_path, version: _version, onCreate: (db, version) {
        return db.execute("""
            ${CommonKey.create_tabel}  ${CommonKey.tableName}
            (
            ${CommonKey.id} ${CommonKey.primaryKey},
            ${CommonKey.userName} ${CommonKey.dataType_string},
            ${CommonKey.password} ${CommonKey.dataType_string}
            )
            """);
      });
    } catch (e) {
      throw e;
    }
  }

  Future<List<Map<String, dynamic>>> query() async {
    List<Map<String, dynamic>> _users = await _db!.query(CommonKey.tableName);
    print(_users);
    return _users;
  }

  delete(String id) async {
    await _db!.delete(CommonKey.tableName, where: 'id=?', whereArgs: [id]);
    await _db!.rawQuery("DELETE FROM ${CommonKey.tableName}");
  }

  Future<List<Map<String, Object?>>?> getLogin(
      String user, String password) async {
    var res = await _db?.rawQuery(
        "SELECT ${CommonKey.id} FROM ${CommonKey.tableName} WHERE ${CommonKey.userName} = '$user' and ${CommonKey.password} = '$password'");

    return res!.length > 0 ? res : null;
  }

  Future<void> insert(UsersModelClass data) async {
    await _db?.insert(CommonKey.tableName, data.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
