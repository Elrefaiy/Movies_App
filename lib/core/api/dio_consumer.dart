import 'dart:convert';

import 'package:dio/dio.dart';

import '../errors/exceptions.dart';
import '../utils/app_strings.dart';
import 'api_consumer.dart';
import 'end_points.dart';
import 'status_code.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;
  DioConsumer({required this.dio}) {
    dio.options
      ..baseUrl = EndPoints.baseUrl
      ..headers = {
        'Authorization': AppStrings.accessTokenAuth,
        'accept': AppStrings.appJson,
      }
      ..responseType = ResponseType.plain;
  }

  @override
  Future delete({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.delete(
        path,
        queryParameters: queryParameters,
      );
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future get({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
      );
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future post({
    required String path,
    required Map<String, dynamic> body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.post(
        path,
        queryParameters: queryParameters,
        data: body,
      );
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future put({
    required String path,
    required Map<String, dynamic> body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.put(
        path,
        queryParameters: queryParameters,
        data: body,
      );
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  dynamic _handleResponseAsJson(Response<dynamic> response) {
    final responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }

  dynamic _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.cancel:
        throw const FetchDataException();
      case DioExceptionType.connectionError:
        throw const NoInternetConnectionException();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.confilct:
            throw const ConflictException();
          case StatusCode.internalServerError:
            throw const InternalServerErrorException();
        }
    }
  }
}
