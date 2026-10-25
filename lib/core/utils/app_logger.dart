import 'package:logger/logger.dart';

import '../env.dart';

final logger = Logger(
  level: Env.verboseLogs ? Level.debug : Level.warning,
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 100,
    colors: true,
    printEmojis: true,
    dateTimeFormat: DateTimeFormat.none,
  ),
);
