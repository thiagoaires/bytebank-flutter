import 'package:alura/database/contact_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  Future<Database> getDatabase() async {
    final String path = join(await getDatabasesPath(), 'bytebank.db');
    return openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute(ContactDao.tableSql);
      },
      version: 1,
      // onDowngrade: onDatabaseDowngradeDelete,
    );
  }
}
