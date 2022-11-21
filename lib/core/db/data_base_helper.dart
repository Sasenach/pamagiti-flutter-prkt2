import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DataBaseHelper {
  static const int _version = 6;

  static const String tableEngine = 'Engine';
  static const String tableKuzov = 'Kuzov';
  static const String tableMarka = 'Marka';
  static const String tableDiski = 'Diski';
  static const String tableRole = 'Role';
  static const String tableCustomer = 'Customer';
  static const String tableCar = 'Car';

  static const List<String> tablesList = [
    tableEngine,
    tableKuzov,
    tableMarka,
    tableDiski,
    tableRole,
    tableCustomer,
    tableCar,
  ];

  static const String createTableEngine = '''
    CREATE TABLE Engine(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL UNIQUE
    );
  ''';
  static const String createTableKuzov = '''
    CREATE TABLE Kuzov(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL UNIQUE
    );
  ''';
  static const String createTableMarka = '''
    CREATE TABLE Marka(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL UNIQUE
    );
  ''';
  static const String createTableDiski = '''
    CREATE TABLE Diski(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL UNIQUE
    );
  ''';
  static const String createTableRole = '''
    CREATE TABLE Role(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL UNIQUE
    );
  ''';
  static const String createTableCustomer = '''
    CREATE TABLE $tableCustomer(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      fio TEXT NOT NULL,
      login TEXT NOT NULL UNIQUE,
      password TEXT NOT NULL,
      email TEXT,
      role_id INTEGER NOT NULL,
      FOREIGN KEY("role_id") REFERENCES "Role"("id")
    );
  ''';
  static const String createTableCar = '''
    CREATE TABLE $tableCar(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      model TEXT NOT NULL,
      power TEXT NOT NULL,
      capacity TEXT NOT NULL,
      engine_capacity TEXT NOT NULL,
      engine_id INTEGER NOT NULL,
      kuzov_id INTEGER NOT NULL,
      marka_id INTEGER NOT NULL,
      diski_id INTEGER NOT NULL,
      FOREIGN KEY("engine_id") REFERENCES "Engine"("id"),
      FOREIGN KEY("kuzov_id") REFERENCES "Kuzov"("id"),
      FOREIGN KEY("marka_id") REFERENCES "Marka"("id"),
      FOREIGN KEY("diski_id") REFERENCES "Diski"("id")
    );
  ''';

  static const List<String> createTableList = [
    createTableEngine,
    createTableKuzov,
    createTableMarka,
    createTableDiski,
    createTableRole,
    createTableCustomer,
    createTableCar,
  ];

  DataBaseHelper._privateConstructor();
  static final DataBaseHelper instance = DataBaseHelper._privateConstructor();

  //создать бд если такой нет, если есть то она есть create db if it doesnt exist
  static Database? _database;
  Future<Database> get database async => _database ??= await _initdatabase();

  Future<Database> _initdatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'auto.db');
    sqfliteFfiInit();
    if (Platform.isWindows) {
      return await databaseFactoryFfi.openDatabase(
        path,
        options: OpenDatabaseOptions(
          version: _version,
          onCreate: _onCreate,
          onUpgrade: (db, oldVersion, newVersion) => onUpdateTable(db),
        ),
      );
    }
    return await openDatabase(
      path,
      version: _version,
      onCreate: _onCreate,
      onUpgrade: (db, oldVersion, newVersion) => onUpdateTable(db),
    );
  }

  //эбэбоуаэа чем я занимаюсь наконецто оно работает, крч она добавляет таблицы если их нет в бд
  //главное чтобы в списке названий таблиц и в списке запросов на создание таблиц порядок таблиц совпадал
  //это не стоило 2 с половиной часов моих страданий
  Future<void> onUpdateTable(Database db) async {
    var tablesIndatabase = await db.rawQuery('SELECT name FROM sqlite_master');
    var values = tablesIndatabase.map((name) => name['name']);
    for (var table in tablesList) {
      if (!values.toList().contains(table)) {
        await db.execute(createTableList[tablesList.indexOf(table)]);
      }
    }
  }

  Future _onCreate(Database db, int version) async {
    for (var table in createTableList) {
      await db.execute(table);
    }
  }

  static Future<void> devHelp(String _query) async {
    Database db = await DataBaseHelper.instance.database;
     db.execute(_query);
  }
}
