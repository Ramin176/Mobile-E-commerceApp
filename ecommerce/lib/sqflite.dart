import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  //database
  static late Database database;
  static const databaseName = 'phone';
  static const databaseVersion = 2;

  //Table: about_user
  static const aboutUserTable = 'product';
  static const aboutUserColumnId = 'id';
  static const productName = 'productName';
  static const aboutUserColumnUserShopAddress = 'user Address';
  static const cost = 'cost';

  static Future<void> initializeDB() async {
    String path = await getDatabasesPath();
    database = await openDatabase(
      join(path, '$databaseName.db'),
      onCreate: (database, version) async {
        await database.execute(
          '''CREATE TABLE $aboutUserTable(
            $aboutUserColumnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $productName TEXT NOT NULL,
            $aboutUserColumnUserShopAddress TEXT NOT NULL,
            $cost INTEGER NOT NULL)''',
        );
      },
      version: databaseVersion,
    );
  }

  static Future<int> insertInto(String tableName, var data) async {
    return await database.insert(tableName, data.toMap());
  }

  static Future<List> retrieveData(String tableName) async {
    final List<Map<String, Object?>> queryResult =
        await database.query(tableName);
    return queryResult;
  }

  static Future<void> deleteData(
      String tableName, String where, List<Object> whereArgs) async {
    await database.delete(
      tableName,
      where: where,
      whereArgs: whereArgs,
    );
  }

  static Future<void> updateData(String tableName, Map<String, Object> values,
      String where, List<Object> whereArgs) async {
    await database.update(tableName, values,
        where: where, whereArgs: whereArgs);
  }

//   static Future<bool> isUserExists(String userContactNumber) async {
//     final List<Map<String, Object?>> queryResult = await database.rawQuery(
//         '''SELECT COUNT(*) FROM ${DatabaseHandler.aboutUserTable} WHERE
//         ${DatabaseHandler.aboutUserColumnUserContactNumber} = '$userContactNumber';''');
//     return queryResult[0]['COUNT(*)'] == 1 ? true : false;
//   }

//   static Future<bool> isPinCodeMatch(String pinCode) async {
//     final List<Map<String, Object?>> queryResult = await database.rawQuery(
//         '''SELECT COUNT(*) FROM ${DatabaseHandler.aboutUserTable} WHERE
//         ${DatabaseHandler.aboutUserColumnUserPinCode} = '$pinCode';''');
//     return queryResult[0]['COUNT(*)'] == 1 ? true : false;
//   }

//   static Future<void> getCurrentUser() async {
//     final List<Map<String, Object?>> queryResult = await database
//         .rawQuery('''SELECT * FROM ${DatabaseHandler.aboutUserTable};''');
//     aboutUserModel = AboutUserModel.fromMap(queryResult[0]);
//   }

//   static Future<List> getCurrentPlatform(String? userId) async {
//     final List<Map<String, Object?>> queryResult = await database
//         .rawQuery('''SELECT * FROM ${DatabaseHandler.platformTable} WHERE
//         ${DatabaseHandler.platformColumnPlatformUserId} = '$userId';''');
//     return queryResult;
//   }
}
