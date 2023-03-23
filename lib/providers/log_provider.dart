import 'package:flutter/foundation.dart';

// LogProvider get logger => const LogProvider('⚡️ CallAPIDemo');
class LogProvider {
  final String prefix;

  const LogProvider(this.prefix);

  void log(String content) {
    if (kReleaseMode) {
      return;
    }

    // ignore: avoid_print
    print('$prefix $content');
  }
}
