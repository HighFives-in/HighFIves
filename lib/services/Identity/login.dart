import 'package:dio/dio.dart';
import 'package:highfives_ui/services/request/global_request.dart';

class LoginService {
  final httpClient = UiHttpClient();
  Future<Map<String, dynamic>> attemptLogin(
      String email, String password, String role) async {
    //
    const url = 'https://be-identity.azurewebsites.net/identity/signIn';

    final user = {'email': email, 'password': password, 'role': role};
    try {
      var response = await httpClient.postData(url, null, user);
      if (response is DioError) {
        //TODO LOG error status and error i.e. response.response.statusCode and response.response
      }
      if (response.statusCode == 200 &&
          response.data != null &&
          response.data is Map) {
        return response.data;
      }
    } catch (e) {
      //may be some problem in dio or in code inside try
    }
  }
}
