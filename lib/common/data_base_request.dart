abstract class DataBaseRequest {
  /// Запрос для удаления таблиц
  static String deleteTable(String table) => 'DROP TABLE $table';

  
}
