import 'package:autocar/core/db/data_base_helper.dart';
import 'package:autocar/domain/entity/diski.dart';
import 'package:autocar/domain/entity/role.dart';

import '../domain/entity/car.dart';
import '../domain/entity/engine.dart';
import '../domain/entity/kuzov.dart';
import '../domain/entity/marka.dart';
import 'package:sqflite/sqflite.dart';

abstract class DataBaseRequest {
  /// Запрос для удаления таблиц
  static String deleteTable(String table) => 'DROP TABLE $table';

  static Future<void> fillRole() async {
    Database db = await DataBaseHelper.instance.database;
    await db.insert('Role', Role(name: 'Admin').toMap());
    await db.insert('Role', Role(name: 'User').toMap());
  }

  ///CRUD for Marka
  static Future<List<Marka>> getMarkas() async {
    return await Future.delayed(Duration(seconds: 4), () async {
      Database db = await DataBaseHelper.instance.database;
      var markas = await db.query('Marka', orderBy: 'name');
      List<Marka> markaList =
          markas.isNotEmpty ? markas.map((e) => Marka.fromMap(e)).toList() : [];
      return markaList;
    });
  }

  ///CRUD for Marka
  static Future<int> insertMarka(Marka marka) async {
    Database db = await DataBaseHelper.instance.database;
    return await db.insert('Marka', marka.toMap());
  }

  ///CRUD for Marka
  static Future<int> deleteMarka(int id) async {
    Database db = await DataBaseHelper.instance.database;
    return db.delete('Marka', where: 'id = ?', whereArgs: [id]);
  }

  ///CRUD for Marka
  static Future<int> upadateMarka(Marka marka) async {
    Database db = await DataBaseHelper.instance.database;
    return db
        .update('Marka', marka.toMap(), where: 'id = ?', whereArgs: [marka.id]);
  }

  ///CRUD for Kuzov
  static Future<List<Kuzov>> getKuzovs() async {
    return await Future.delayed(Duration(seconds: 4), () async {
      Database db = await DataBaseHelper.instance.database;
      var kuzovs = await db.query('Kuzov', orderBy: 'name');
      List<Kuzov> kuzovsList =
          kuzovs.isNotEmpty ? kuzovs.map((e) => Kuzov.fromMap(e)).toList() : [];
      return kuzovsList;
    });
  }

  ///CRUD for Kuzov
  static Future<int> insertKuzov(Kuzov kuzov) async {
    Database db = await DataBaseHelper.instance.database;
    return await db.insert('Kuzov', kuzov.toMap());
  }

  ///CRUD for Kuzov
  static Future<int> deleteKuzov(int id) async {
    Database db = await DataBaseHelper.instance.database;
    return db.delete('Kuzov', where: 'id = ?', whereArgs: [id]);
  }

  ///CRUD for Kuzov
  static Future<int> upadateKuzov(Kuzov kuzov) async {
    Database db = await DataBaseHelper.instance.database;
    return db
        .update('Kuzov', kuzov.toMap(), where: 'id = ?', whereArgs: [kuzov.id]);
  }

  ///CRUD for Diski
  static Future<List<Diski>> getDiski() async {
    return await Future.delayed(Duration(seconds: 4), () async {
      Database db = await DataBaseHelper.instance.database;
      var diski = await db.query('Diski', orderBy: 'name');
      List<Diski> diskiList =
          diski.isNotEmpty ? diski.map((e) => Diski.fromMap(e)).toList() : [];
      return diskiList;
    });
  }

  ///CRUD for Diski
  static Future<int> insertDiskis(Diski diski) async {
    Database db = await DataBaseHelper.instance.database;
    return await db.insert('Diski', diski.toMap());
  }

  ///CRUD for Diski
  static Future<int> deleteDiski(int id) async {
    Database db = await DataBaseHelper.instance.database;
    return db.delete('Diski', where: 'id = ?', whereArgs: [id]);
  }

  ///CRUD for Diski
  static Future<int> upadateDiski(Diski diski) async {
    Database db = await DataBaseHelper.instance.database;
    return db
        .update('Diski', diski.toMap(), where: 'id = ?', whereArgs: [diski.id]);
  }

  ///CRUD for Engine
  static Future<List<Engine>> getEngine() async {
    return await Future.delayed(Duration(seconds: 4), () async {
      Database db = await DataBaseHelper.instance.database;
      var engine = await db.query('Engine', orderBy: 'name');
      List<Engine> engineList = engine.isNotEmpty
          ? engine.map((e) => Engine.fromMap(e)).toList()
          : [];
      return engineList;
    });
  }

  ///CRUD for Engine
  static Future<int> insertEngine(Engine engine) async {
    Database db = await DataBaseHelper.instance.database;
    return await db.insert('Engine', engine.toMap());
  }

  ///CRUD for Engine
  static Future<int> deleteEngine(int id) async {
    Database db = await DataBaseHelper.instance.database;
    return db.delete('Engine', where: 'id = ?', whereArgs: [id]);
  }

  ///CRUD for Engine
  static Future<int> upadateEngine(Engine engine) async {
    Database db = await DataBaseHelper.instance.database;
    return db.update('Engine', engine.toMap(),
        where: 'id = ?', whereArgs: [engine.id]);
  }
  ///CRUD for Car
  static Future<List<Car>> getCars() async {
    return await Future.delayed(Duration(seconds: 4), () async {
      Database db = await DataBaseHelper.instance.database;
      var car = await db.query('Car', orderBy: 'name');
      List<Car> carList = car.isNotEmpty
          ? car.map((e) => Car.fromMap(e)).toList()
          : [];
      return carList;
    });
  }

  ///CRUD for Car
  static Future<int> insertCar(Car car) async {
    Database db = await DataBaseHelper.instance.database;
    return await db.insert('Car', car.toMap());
  }

  ///CRUD for Car
  static Future<int> deleteCar(int id) async {
    Database db = await DataBaseHelper.instance.database;
    return db.delete('Car', where: 'id = ?', whereArgs: [id]);
  }

  ///CRUD for Car
  static Future<int> upadateCar(Car car) async {
    Database db = await DataBaseHelper.instance.database;
    return db.update('Car', car.toMap(),
        where: 'id = ?', whereArgs: [car.id]);
  }
}
