// Simple preferences service without external dependencies
class PreferencesService {
  static final PreferencesService _instance = PreferencesService._internal();
  factory PreferencesService() => _instance;
  PreferencesService._internal();

  // In-memory storage for demo purposes
  final Map<String, dynamic> _storage = {};

  // Save counter value
  Future<void> saveCounter(int value) async {
    _storage['counter'] = value;
  }

  // Get counter value
  Future<int> getCounter() async {
    return _storage['counter'] ?? 0;
  }

  // Save user preferences
  Future<void> saveUserPreference(String key, dynamic value) async {
    _storage[key] = value;
  }

  // Get user preferences
  Future<T?> getUserPreference<T>(String key) async {
    return _storage[key] as T?;
  }

  // Clear all preferences
  Future<void> clearAll() async {
    _storage.clear();
  }
}
