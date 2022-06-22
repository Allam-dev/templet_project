import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:templete_project/core/debugging/log.dart';
import 'package:templete_project/core/error/failure/failure.dart';
import 'package:templete_project/core/error/failure/network_failures/connection_failure.dart';
import 'package:templete_project/core/error/failure/unknown_failure.dart';
import 'package:templete_project/core/functions/enum_to_string.dart';
import 'package:templete_project/core/remote_services/dio_x/constants/methods.dart';
import 'package:templete_project/core/remote_services/dio_x/dio_error_handler.dart';

import 'constants/dio_x_config.dart';

class DioX {
  DioX._();
  static final DioX instance = DioX._();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
    ),
  );

  Future<Either<Failure, Response>> request({
    required String endPoint,
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
      options.method = enumToString(method);
      Response response = await _dio.request(
        endPoint,
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
