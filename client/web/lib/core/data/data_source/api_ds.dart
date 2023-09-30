import 'package:dio/dio.dart';

class ApiService {
  ApiService({required Dio dio}) {
    _dio = dio;
  }

  late final Dio _dio;

  Future<Response> sendRequest({
    required String baseUrl,
    required Future<Response> Function(Dio client) request,
    String? token,
  }) async {
    final client = _getClient(
      baseUrl: baseUrl,
      token: token,
    );

    final res = await request(client);
    return res;
  }

  Dio _getClient({
    required String baseUrl,
    required String? token,
  }) {
    final client = _dio;

    client.options.baseUrl = baseUrl;
    client.options.headers = _headers;

    _mayBeRemoveAuthHeader(client, accessToken: token);
    // _addErrorHandler(client, token: token);

    return client;
  }

  void _mayBeRemoveAuthHeader(Dio client, {String? accessToken}) {
    if (accessToken == null) {
      client.options.headers.remove('Authorization');
    } else {
      client.options.headers['Authorization'] = 'Bearer $accessToken';
    }
  }

  // /// Method to add error-handler [Interceptor]
  // void _addErrorHandler(
  //   Dio client, {
  //   required String? token,
  // }) {
  //   /// Error handler
  //   Future<void> onError(
  //     DioException err,
  //     ErrorInterceptorHandler handler,
  //   ) async {
  //     final statusCode = err.response?.statusCode;
  //     if (statusCode == HttpStatus.unauthorized ||
  //         statusCode == HttpStatus.internalServerError ||
  //         statusCode == HttpStatus.forbidden) {
  //       final res = await AuthService.refreshToken();

  //       await res.fold(
  //         (error) async {
  //           await AuthService.auth(null);
  //           return handler.next(err);
  //         },
  //         (newToken) async {
  //           err.requestOptions.headers.remove('Authorization');

  //           err.requestOptions.headers['Authorization'] = 'Bearer $newToken';

  //           await AuthService.getUserInfo(newToken);

  //           final repeatedRequest = await client.request(
  //             err.requestOptions.path,
  //             data: err.requestOptions.data,
  //             queryParameters: err.requestOptions.queryParameters,
  //             options: Options(
  //               method: err.requestOptions.method,
  //               headers: err.requestOptions.headers,
  //             ),
  //           );

  //           return handler.resolve(repeatedRequest);
  //         },
  //       );
  //     }
  //     return handler.next(err);
  //   }

  //   client.interceptors.add(QueuedInterceptorsWrapper(onError: onError));
  // }

  Map<String, dynamic> get _headers => {
        'Content-Type': 'application/json',
      };
}
