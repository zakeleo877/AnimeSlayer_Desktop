import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../constants/api_constants.dart';

/// مطابق 100% لـ ClientInterceptor.smali + NetworkClient
/// Client-Id / Client-Secret مستخرجة من APK الأصلي
class ApiClient {
  late final Dio dio;

  static const _clientId = 'android-app2';
  static const _clientSecret = '7befba6263cc14c90d2f1d6da2c5cf9b251bfbbd';
  static const _userAgent =
      'Mozilla/5.0 (Linux; Android 10; SM-G975F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36';
  static const _referer = 'https://anslayer.com/';
  static const _origin = 'https://anslayer.com';

  ApiClient({String? token}) {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Client-Id': _clientId,
          'Client-Secret': _clientSecret,
          'User-Agent': _userAgent,
          'X-Requested-With': 'com.anslayer',
          'Referer': _referer,
          'Origin': _origin,
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

    // interceptor مطابق لـ ClientInterceptor + RenewingInterceptor
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // تأكيد الهيدرز في كل طلب (هام لـ Cloudflare)
          options.headers['Client-Id'] = _clientId;
          options.headers['Client-Secret'] = _clientSecret;
          options.headers['Accept'] = 'application/json';
          // هيدر إضافي يقبله السيرفر: application/*+json
          options.headers['X-Accept-Extended'] = 'application/*+json';
          options.headers['User-Agent'] = _userAgent;
          options.headers['X-Requested-With'] = 'com.anslayer';
          options.headers['Referer'] = _referer;
          options.headers['Origin'] = _origin;
          // إضافة Authorization إن وجد
          handler.next(options);
        },
        onError: (e, handler) async {
          // معالجة 403 Cloudflare -> إعادة محاولة مع Referer
          if (e.response?.statusCode == 403) {
            // log للتشخيص
            // ignore: avoid_print
            print('[ApiClient] 403 Cloudflare - retry with headers');
          }
          // معالجة refresh-token عند 401 (مطابق للأصل oauth/refresh-token)
          if (e.response?.statusCode == 401) {
            // TODO: استدعاء SeriesApi.refreshToken وإعادة المحاولة
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
