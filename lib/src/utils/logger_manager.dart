import 'package:logger/logger.dart';

class LogManager {
  // Singleton Instance
  static LogManager? _instance;

  late Logger _logger;

  LogManager._() {
    _logger = Logger(level: Level.debug);
  }

  static LogManager get getInstance => _instance ??= LogManager._();

  void debug(String message) {
    _logger.d(message);
  }

  void error(String message) {
    _logger.e(message);
  }

  void info(String message) {
    _logger.i(message);
  }
}
