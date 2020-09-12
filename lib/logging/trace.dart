import 'package:highfives_ui/constants/const/platform.dart';
import 'package:highfives_ui/resources/localStorage/AppLocalStorage.dart';
import 'package:highfives_ui/resources/localStorage/WebLocalStorage.dart';
import 'package:highfives_ui/utils/platform.dart';

Future<String> getTraceId(dynamic tokenType) async {
  final _webId = WebLocalStorage();
  final _appId = AppLocalStorage();
  dynamic _platform = findPlatform();
  switch (_platform) {
    case PLATFORMS.Web:
      return await _webId.readToken(tokenType);
    case PLATFORMS.Android:
    case PLATFORMS.Ios:
    case PLATFORMS.App:
    default:
      return await _appId.readToken(tokenType);
  }
}

Future<void> storeTraceId(String token, dynamic tokenType) async {
  final _webId = WebLocalStorage();
  final _appId = AppLocalStorage();
  dynamic _platform = findPlatform();
  switch (_platform) {
    case PLATFORMS.Web:
      return await _webId.storeToken(token, tokenType);
    case PLATFORMS.Android:
    case PLATFORMS.Ios:
    case PLATFORMS.App:
    default:
      return await _appId.storeToken(token, tokenType);
  }
}

Future<void> deleteTraceId(dynamic tokenType) async {
  final _webId = WebLocalStorage();
  final _appId = AppLocalStorage();
  dynamic _platform = findPlatform();
  switch (_platform) {
    case PLATFORMS.Web:
      return await _webId.deleteToken(tokenType);
    case PLATFORMS.Android:
    case PLATFORMS.Ios:
    case PLATFORMS.App:
    default:
      return await _appId.deleteToken(tokenType);
  }
}