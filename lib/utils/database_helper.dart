import 'dart:io';
import 'package:gemini_ai_app/screen/history/model/history_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static DataBaseHelper dataBaseHelper = DataBaseHelper._();

  DataBaseHelper._();

  Database? db;

  //check database
  Future<Database?> checkDb() async {
    if (db != null) {
      return db;
    } else {
      var data = await initDb();
      return data;
    }
  }

  //database and table create
  Future<Future<Database>> initDb() async {
    Directory d1 = await getApplicationSupportDirectory();
    String path = d1.path;
    path = join(path, "mysql.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
            "CREATE TABLE history(id INTEGER PRIMARY KEY AUTOINCREMENT, question TEXT,ans TEXT)");
      },
    );
  }

  //add data
  Future<void> addData(HistoryModel historyModel) async {
    var insertDb = await checkDb();
    insertDb!.insert("history",
        {"question": historyModel.question, "ans": historyModel.ans});
  }

  // //read data
  Future<List<HistoryModel>> readData() async {
    var readDb = await checkDb();
    List<Map> data = await readDb!.rawQuery("SELECT * FROM history", null);
    List<HistoryModel> l1 =
        data.map((e) => HistoryModel.mapToModel(e)).toList();
    return l1;
  }

  //delete data
  Future<void> deleteData(String id) async {
    var deleteDb = await checkDb();
    deleteDb?.delete("history", where: "id==?", whereArgs: [id]);
  }
}
