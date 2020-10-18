import 'package:logger/logger.dart';

class SimpleLogPrinter extends LogPrinter {
  final String className;
  SimpleLogPrinter(this.className);

  @override
  List<String> log(LogEvent event) {
    var color = PrettyPrinter.levelColors[event.level];
    var emoji = PrettyPrinter.levelEmojis[event.level];
    var message = event.message;
    return [color('$emoji $className - $message')];
  }
}

//final log = getLogger('_MainHomeState');

//final log = getLogger('MyApp');
//log.v('Navigate to main home page.');
