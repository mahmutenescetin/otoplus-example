import 'package:flutter/foundation.dart';

abstract class BaseNotifier extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;

  String? get error => _error;

  @protected
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  @protected
  void setError(String? message) {
    _error = message;
    notifyListeners();
  }

  @protected
  Future<T> handleAsync<T>(Future<T> Function() action) async {
    try {
      setLoading(true);
      setError(null);
      final result = await action();
      return result;
    } catch (e) {
      setError(e.toString());
      rethrow;
    } finally {
      setLoading(false);
    }
  }
}
