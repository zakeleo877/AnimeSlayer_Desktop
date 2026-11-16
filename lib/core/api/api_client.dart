import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../constants/api_constants.dart';

class ApiClient {
  late final Dio dio;

  ApiClient({String? token}) {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        compact: true,
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (e, handler) async {
          // معالجة refresh-token عند 401 (مطابق للأصل oauth/refresh-token)
          if (e.response?.statusCode == 401) {
            // TODO: استدعاء refreshToken وإعادة المحاولة
          }
          handler.next(e);
        },
      ),
    );
  }

  void setToken(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  void clearToken() {
    dio.options.headers.remove('Authorization');
  }
}

// Retrofit-style endpoints (تُولد بـ build_runner)
// مثال لاستخدام Retrofit Generator:
/// 
/// @RestApi(baseUrl: ApiConstants.baseUrl)
/// abstract class SeriesApi {
///   @POST(ApiConstants.getAnimeDetails)
///   Future<AnimeDetails> getAnimeDetails(@Body() Map<String, dynamic> body);
/// }
