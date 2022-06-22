import 'package:dio/dio.dart';
import 'package:templete_project/core/debugging/log.dart';
import 'package:templete_project/core/error/failure/failure.dart';
import 'package:templete_project/core/error/failure/network_failures/cancel_failure.dart';
import 'package:templete_project/core/error/failure/network_failures/forbidden_failure.dart';
import 'package:templete_project/core/error/failure/network_failures/internal_server_error_failure.dart';
import 'package:templete_project/core/error/failure/network_failures/not_found_failure.dart';
import 'package:templete_project/core/error/failure/network_failures/timeout_failure.dart';
import 'package:templete_project/core/error/failure/network_failures/unauthorized_failure.dart';
import 'package:templete_project/core/error/failure/unknown_failure.dart';
import 'package:templete_project/core/remote_services/dio_x/constants/status_codes.dart';

abstract class DioErrorHandler {
  static Failure handle(DioError error) {
    if (error.type == DioErrorType.sendTimeout ||
        error.type == DioErrorType.connectTimeout ||
        error.type == DioErrorType.receiveTimeout) {
      Log.error("timeout error");
      return TimeoutFailure();
    } else if (error.type == DioErrorType.cancel) {
      Log.error("cancel error");
      return CancelFailure();
    } else if (error.type == DioErrorType.response) {
      return _responseErrorHandler(error.response!);
    } else {
      Log.error("error");
      return UnknownFailure();
    }
  }

  static Failure _responseErrorHandler(Response response) {
    if (response.statusCode == StatusCodes.notFound) {
      Log.error("not found error");
      return NotFoundFailure();
    } else if (response.statusCode == StatusCodes.forbidden) {
      Log.error("forbidden error");
      return ForbiddenFailure();
    } else if (response.statusCode == StatusCodes.internalServerError) {
      Log.error("internal server error");
      return InternalServerErrorFailure();
    } else if (response.statusCode == StatusCodes.timeout) {
      Log.error("timeout error");
      return TimeoutFailure();
    } else if (response.statusCode == StatusCodes.unauthorized) {
      Log.error("unauthorized error");
      return UnauthorizedFailure();
    } else {
      Log.error("error");
      return UnknownFailure();
    }
  }
}
