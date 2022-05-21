// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _MovieService implements MovieService {
  _MovieService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://www.omdbapi.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<MovieSearchDto> searchMovie(title) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r's': title};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MovieSearchDto>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MovieSearchDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MovieDto> getMovie(imdbId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'i': imdbId};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MovieDto>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MovieDto.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
