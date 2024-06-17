import 'package:logger/logger.dart';

class LogConfig {
  static final Logger logger = Logger(
    level: Level.info,
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 8,
      lineLength: 90,
      colors: true,
      printEmojis: true,
      printTime: false,
    ),
  );

  static void logError(String errorMessage, dynamic jsonResponse) {
    logger.e(
        "$errorMessage\nError\n ${jsonResponse['data']['code']}\n ${jsonResponse['data']['details']['error']}");
  }
}
