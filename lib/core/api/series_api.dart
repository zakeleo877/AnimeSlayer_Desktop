import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../constants/api_constants.dart';

part 'series_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class SeriesApi {
  factory SeriesApi(Dio dio, {String baseUrl}) = _SeriesApi;

  @POST(ApiConstants.getAnimeDetails)
  Future<Map<String, dynamic>> getAnimeDetails(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.getAnimeStatus)
  Future<Map<String, dynamic>> getAnimeStatus(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.getPublishedAnimes)
  Future<Map<String, dynamic>> getPublishedAnimes(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.getAnimeCharacters)
  Future<Map<String, dynamic>> getAnimeCharacters(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.getEpisodes)
  Future<Map<String, dynamic>> getEpisodes(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.getEpisodesNew)
  Future<Map<String, dynamic>> getEpisodesNew(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.saveAnimeRating)
  Future<Map<String, dynamic>> saveAnimeRating(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.saveToFavorites)
  Future<Map<String, dynamic>> saveToFavorites(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.saveToWatching)
  Future<Map<String, dynamic>> saveToWatching(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.addContentRating)
  Future<Map<String, dynamic>> addContentRating(@Body() Map<String, dynamic> body);
}
