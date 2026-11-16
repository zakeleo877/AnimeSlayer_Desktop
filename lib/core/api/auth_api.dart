import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../constants/api_constants.dart';

part 'auth_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @POST(ApiConstants.login)
  Future<Map<String, dynamic>> login(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.googleLogin)
  Future<Map<String, dynamic>> googleLogin(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.twitterLogin)
  Future<Map<String, dynamic>> twitterLogin(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.logout)
  Future<Map<String, dynamic>> logout();

  @POST(ApiConstants.refreshToken)
  Future<Map<String, dynamic>> refreshToken(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.forgotPassword)
  Future<Map<String, dynamic>> forgotPassword(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.restoreFb)
  Future<Map<String, dynamic>> restoreFb(@Body() Map<String, dynamic> body);
}
