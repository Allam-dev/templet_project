import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:templete_project/core/debugging/log.dart';
import 'package:templete_project/core/error/failure/failure.dart';
import 'package:templete_project/core/error/failure/network_failures/connection_failure.dart';
import 'package:templete_project/core/error/failure/unknown_failure.dart';
import 'package:templete_project/core/remote_services/constants/apis.dart';

class DioX {
  DioX._();
  static final DioX instance = DioX._();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: APIs.baseUrl,
    ),
  );

  Future<Either<Failure, Response>> request({
    required String endPoint,
    required String method,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      await InternetAddress.lookup('https://www.google.com/');
      options = options ?? Options();
      options.method = method;
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
    } on DioError catch (e) {
      //TODO: make dio error handelar
      return Left(ConnectionFailure()); //delete this line
    } on SocketException {
      Log.error("connection error");
      return Left(ConnectionFailure());
    } catch (e) {
      Log.error("error");
      return Left(UnknownFailure());
    }
  }
}
