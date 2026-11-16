// GENERATED CODE - DO NOT MODIFY BY HAND - Stub for retrofit
part of 'series_api.dart';

// Stub implementation so project compiles 100% without build_runner
class _SeriesApi implements SeriesApi {
  _SeriesApi(this._dio, {this.baseUrl});
  final Dio _dio;
  final String? baseUrl;

  @override
  Future<Map<String, dynamic>> getAnimeDetails(Map<String, dynamic> body) async {
    final res = await _dio.post(ApiConstants.getAnimeDetails, data: body);
    return res.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> getAnimeStatus(Map<String, dynamic> body) async {
    final res = await _dio.post(ApiConstants.getAnimeStatus, data: body);
    return res.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> getPublishedAnimes(Map<String, dynamic> body) async {
    final res = await _dio.post(ApiConstants.getPublishedAnimes, data: body);
    return res.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> getAnimeCharacters(Map<String, dynamic> body) async {
    final res = await _dio.post(ApiConstants.getAnimeCharacters, data: body);
    return res.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> getEpisodes(Map<String, dynamic> body) async {
    final res = await _dio.post(ApiConstants.getEpisodes, data: body);
    return res.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> getEpisodesNew(Map<String, dynamic> body) async {
    final res = await _dio.post(ApiConstants.getEpisodesNew, data: body);
    return res.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> saveAnimeRating(Map<String, dynamic> body) async {
    final res = await _dio.post(ApiConstants.saveAnimeRating, data: body);
    return res.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> saveToFavorites(Map<String, dynamic> body) async {
    final res = await _dio.post(ApiConstants.saveToFavorites, data: body);
    return res.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> saveToWatching(Map<String, dynamic> body) async {
    final res = await _dio.post(ApiConstants.saveToWatching, data: body);
    return res.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> addContentRating(Map<String, dynamic> body) async {
    final res = await _dio.post(ApiConstants.addContentRating, data: body);
    return res.data as Map<String, dynamic>;
  }
}
