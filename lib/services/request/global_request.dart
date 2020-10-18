import 'package:dio/dio.dart';
import 'package:highfives_ui/logging/logger.dart';

class UiHttpClient {
  var _dio; //TODO Change later
  BaseOptions _options;
  final log = getLogger('UiHttpClient');
  factory UiHttpClient() {
    return _uiHttpClientSingleton;
  }

  static final UiHttpClient _uiHttpClientSingleton = UiHttpClient._internal();

  UiHttpClient._internal() {
    _options = new BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
  }

  //Memoization
  get dio {
    if (_dio == null) {
      _dio = Dio(_options);
    }
    return _dio;
  }

  getData(String url, Map<String, String> headers) async {
    try {
      var response = await dio.get(url);
      return response;
    } on DioError catch (e) {
      log.e(e);

      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        log.e(e.response);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        log.e(e.message);
      }
      return null;
    }
  }

  postData(
      String url, Map<String, String> headers, Map<String, String> body) async {
    try {
      var response = await dio.post(url, data: body);
      return response;
    } on DioError catch (e) {
      log.e(e);

      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        //THIS WILL BE LOGGED IN DIFFERENT SERVICES
        // print(e.response.data);
        // print(e.response.headers);
        // print(e.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(
            'Something happened in setting up or sending the request that triggered an Error ${e.request}');
        print(
            'Something happened in setting up or sending the request that triggered an Error ${e.message}');
      }
      return e;
    }
  }
}

/*

Response Schema
The response for a request contains the following information.

{
  /// Response body. may have been transformed, please refer to [ResponseType].
  T data;
  /// Response headers.
  Headers headers;
  /// The corresponding request info.
  Options request;
  /// Http status code.
  int statusCode;
  /// Whether redirect
  bool isRedirect;
  /// redirect info
  List<RedirectInfo> redirects ;
  /// Returns the final real request uri (maybe redirect).
  Uri realUri;
  /// Custom field that you can retrieve it later in `then`.
  Map<String, dynamic> extra;
}
*/
