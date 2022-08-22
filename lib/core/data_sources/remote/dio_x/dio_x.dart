import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../debugging/log.dart';
import '../../../failure/failure.dart';
import '../../../failure/network_failures/connection_failure.dart';
import '../../../failure/unknown_failure.dart';
import 'constants/dio_x_config.dart';
import 'constants/methods.dart';
import 'dio_error_handler.dart';

class DioX {
  DioX._();
  static final DioX instance = DioX._();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: DioXConfiguration.baseUrl,
    ),
  );

  Future<Either<Failure, Response>> request({
    required String endpoint,
    required Methods method,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      await InternetAddress.lookup('google.com');
      options = options ?? Options();
      options.method = method.name;
      Response response = await _dio.request(
        endpoint,
        data: data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: options,
        onSendProgress: onSendProgress,
        queryParameters: queryParameters,
      );
      Log.debug(
          "url : ${response.realUri}\nheaders : ${response.headers}\nresponse : $response");
      return Right(response);
    } on DioError catch (error) {
      return Left(DioErrorHandler.handle(error));
    } on SocketException {
      Log.error("connection error");
      return Left(ConnectionFailure());
    } catch (e) {
      Log.error("error");
      return Left(UnknownFailure());
    }
  }
}
