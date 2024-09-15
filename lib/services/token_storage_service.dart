import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  /// Store value
  setToken(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  /// Read value
  getToken(String key) async {
    return await _storage.read(key: key);
  }

  /// Delete Value
  deleteToken(String key) async {
    await _storage.delete(key: key);
  }
}
