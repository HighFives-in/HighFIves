import 'package:highfives_ui/constants/const/platform.dart';
import 'package:highfives_ui/utils/platform.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

String getTimeBasedId() {
  String timeId = uuid.v1(); // Generate a v1 (time-based) id
  var _platform = findPlatform();
    switch (_platform) {
    case PLATFORMS.Web:
      return "Web_" + timeId;
    case PLATFORMS.Android:
      return "Android_" + timeId;
    case PLATFORMS.Ios:
      return "IOS_" + timeId;
    case PLATFORMS.App:
    default:
      return "Other_" + timeId;
  }
}
