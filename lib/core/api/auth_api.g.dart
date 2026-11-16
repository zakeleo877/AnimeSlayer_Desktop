// GENERATED CODE - DO NOT MODIFY BY HAND - Stub
part of 'auth_api.dart';

class _AuthApi implements AuthApi {
  _AuthApi(this._dio, {this.baseUrl});
  final Dio _dio;
  final String? baseUrl;

  @override
  Future<Map<String, dynamic>> login(Map<String, dynamic> body) async {
    final res = await _dio.post(ApiConstants.login, data: body);
    return res.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> googleLogin(Map<String, dynamic> body) async {
    final res = await _dio.post(ApiConstants.googleLogin, data: body);
    return res.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> twitterLogin(Map<String, dynamic> body) async {
    final res = await _dio.post(ApiConstants.twitterLogin, data: body);
    return res.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> logout() async {
    final res = await _dio.post(ApiConstants.logout);
    return res.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> refreshToken(Map<String, dynamic> body) async {
    final res = await _dio.post(ApiConstants.refreshToken, data: body);
    return res.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> forgotPassword(Map<String, dynamic> body) async {
    final res = await _dio.post(ApiConstants.forgotPassword, data: body);
    return res.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> restoreFb(Map<String, dynamic> body) async {
    final res = await _dio.post(ApiConstants.restoreFb, data: body);
    return res.data as Map<String, dynamic>;
  }
}
