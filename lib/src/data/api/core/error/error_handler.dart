import 'package:dio/dio.dart';
import 'package:flower_app/common/common.dart';

import '../constants/status_code.dart';
import 'error_massage.dart';

class ErrorHandler {
  final String errorMassage;
  final int? code;
  ErrorHandler({required this.errorMassage, this.code});

  static ErrorHandler fromException(Exception exception, AppLocalizations locale) {
    if (exception is DioException) {
      return _handleDioException(exception,locale);
    } else {
      return ErrorHandler(errorMassage: locale.unknown);
    }
  }

  static ErrorHandler _handleDioException(DioException exception, AppLocalizations locale) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ErrorHandler(errorMassage: locale.connectionError);
      case DioExceptionType.badCertificate:
        return ErrorHandler(errorMassage: locale.badCertificate);
      case DioExceptionType.badResponse:
        return ErrorHandler._formResponse(exception.response!,locale);
      case DioExceptionType.connectionError:
        return ErrorHandler(errorMassage: locale.connectionError);
      default:
        return ErrorHandler(errorMassage: locale.unknown);
    }
  }

  static ErrorHandler _formResponse(Response<dynamic> response , AppLocalizations locale) {
    switch (response.statusCode) {
      case StatusCode.unauthorized:
      case StatusCode.forbidden:
        return ErrorHandler(errorMassage: response.data["error"], code: 401);
      case StatusCode.conflict:
        return ErrorHandler(
            errorMassage:
                response.data["error"] ?? locale.conflict, code: 409);
      case StatusCode.notFount:
        return ErrorHandler(errorMassage: locale.notFount);
      case StatusCode.internalServerError:
        return ErrorHandler(
            errorMassage: locale.internalServerError);
      default:
        return ErrorHandler(errorMassage: locale.unknown);
    }
  }
}
