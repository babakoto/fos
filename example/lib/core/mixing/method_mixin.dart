import 'package:dio/dio.dart';
import 'package:example/core/dependancies.dart';
import 'package:fos/errors/exceptions.dart';

mixin Get<T> {
  Future<dynamic> get(String path, T Function(Map<String, dynamic>) fromMap) async {
    try {
      final response = await getIt<Dio>().get(path);
      if (response.data is Map) {
        final entity = fromMap(response.data);
        return entity;
      } else {
        final entities = (response.data as List).map((e) => fromMap(e)).toList();
        return entities;
      }
    } on FormatException {
      throw const SerializationException();
    } on DioException catch (e) {
      final code = e.response?.statusCode;
      final message = e.response?.statusMessage;
      if (code == 401 || code == 403) {
        throw const UnauthorizedException();
      } else if (code == 500) {
        throw ServerException(error: code, message: message);
      } else {
        if (e.type == DioExceptionType.connectionError) {
          throw const NetworkConnectionException();
        } else {
          throw const UnknownException();
        }
      }
    } catch (e) {
      throw const UnknownException();
    }
  }
}

mixin Create<T> {
  Future<T> create(String path, Map<String, dynamic> data) async {
    final response = await getIt<Dio>().post(path, data: data);
    final entity = response.data;
    return entity;
  }
}
