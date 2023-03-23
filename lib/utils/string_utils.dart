import 'package:intl/intl.dart';

class StringUtils {
  static String formatTimeChatMessage(String time) {
    final date = DateTime.now();
    final hourAndMinues = DateFormat.jm().format(date);
    return hourAndMinues;
  }
}