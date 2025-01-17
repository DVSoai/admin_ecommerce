import 'package:shared_preferences/shared_preferences.dart';

class TLocalStorage {
  late final SharedPreferences _storage;

  // Singleton instance
  static TLocalStorage? _instance;

  TLocalStorage._internal();

  /// Create a named constructor to obtain an instance with a specific bucket name
  factory TLocalStorage.instance() {
    _instance ??= TLocalStorage._internal();
    return _instance!;
  }

  /// Asynchronous initialization method
  static Future<void> init() async {
    _instance = TLocalStorage._internal();
    _instance!._storage = await SharedPreferences.getInstance();
  }

  /// Generic method to save data
  Future<void> writeData<T>(String key, T value) async {
    if (value is String) {
      await _storage.setString(key, value);
    } else if (value is int) {
      await _storage.setInt(key, value);
    } else if (value is double) {
      await _storage.setDouble(key, value);
    } else if (value is bool) {
      await _storage.setBool(key, value);
    } else if (value is List<String>) {
      await _storage.setStringList(key, value);
    } else {
      throw Exception('Unsupported type for SharedPreferences');
    }
  }

  /// Generic method to read data
  T? readData<T>(String key) {
    if (T == String) {
      return _storage.getString(key) as T?;
    } else if (T == int) {
      return _storage.getInt(key) as T?;
    } else if (T == double) {
      return _storage.getDouble(key) as T?;
    } else if (T == bool) {
      return _storage.getBool(key) as T?;
    } else if (T == List<String>) {
      return _storage.getStringList(key) as T?;
    } else {
      throw Exception('Unsupported type for SharedPreferences');
    }
  }

  /// Generic method to remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  /// Clear all data in storage
  Future<void> clearAll() async {
    await _storage.clear();
  }
}
