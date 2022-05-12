import 'package:alura/database/app_database.dart';
import 'package:alura/model/contact_model.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {
  static const String tableSql = 'CREATE TABLE $_tableName ('
      '$_id INTEGER PRIMARY KEY, '
      '$_name STRING, '
      '$_accountNumber INTEGER)';

  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';
  static const String _tableName = 'contacts';
  static const String _databasePath = 'bytebank.db';

  static Future<List<ContactModel>> findAll() async {
    final Database db = await AppDatabase().getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    final List<ContactModel> contacts = List();
    for (Map<String, dynamic> row in result) {
      final ContactModel contact = ContactModel(
        row[_id],
        row[_name],
        row[_accountNumber],
      );
      contacts.add(contact);
    }
    return contacts;
  }

  Future<int> save(ContactModel contact) async {
    final Database db = await AppDatabase().getDatabase();
    final Map<String, dynamic> contactMap = Map();
    contactMap[_name] = contact.name;
    contactMap[_accountNumber] = contact.accountNumber;
    return db.insert(_tableName, contactMap);
  }
}
