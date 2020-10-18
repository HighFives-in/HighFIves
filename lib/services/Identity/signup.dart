import 'package:highfives_ui/logging/logger.dart';
import 'package:highfives_ui/services/request/global_request.dart';

class SignUpService {
  final httpClient = UiHttpClient();
  final log = getLogger('SignUpService');

  Future<Map<String, dynamic>> attemptSignUp(
      String email, String password, String role) async {
    const url =
        'https://be-identity.azurewebsites.net/identity/signUpWithEmailAndPasswordAndRole';

    final user = {'email': email, 'password': password, 'role': role};
    try {
      var response = await httpClient.postData(url, null, user);
      if (response.statusCode == 201 &&
          response.data != null &&
          response.data is Map) {
        return response.data;
      } else {
        throw Exception('Failed to signUp From SignUpService');
      }
    } catch (e) {
      log.e(e);
      return null;
    }
  }
}
