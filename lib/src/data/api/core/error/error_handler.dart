import 'package:dio/dio.dart';

import '../constants/status_code.dart';
import 'error_massage.dart';

class ErrorHandler {
  final String errorMassage;
  final int? code;
  ErrorHandler({required this.errorMassage, this.code});

  static ErrorHandler fromException(Exception exception) {
    if (exception is DioException) {
      return _handleDioException(exception);
    } else {
      return ErrorHandler(errorMassage: ErrorMassage.unknownErrorMessage);
    }
  }

  static ErrorHandler _handleDioException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ErrorHandler(errorMassage: ErrorMassage.connectionErrorMessage);
      case DioExceptionType.badCertificate:
        return ErrorHandler(errorMassage: ErrorMassage.badCertificateMessage);
      case DioExceptionType.badResponse:
        return ErrorHandler._formResponse(exception.response!);
      case DioExceptionType.connectionError:
        return ErrorHandler(errorMassage: ErrorMassage.connectionErrorMessage);
      default:
        return ErrorHandler(errorMassage: ErrorMassage.unknownErrorMessage);
    }
  }

  static ErrorHandler _formResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case StatusCode.unauthorized:
      case StatusCode.forbidden:
        return ErrorHandler(errorMassage: response.data["error"], code: 401);
      case StatusCode.conflict:
        return ErrorHandler(
            errorMassage:
                response.data["error"] ?? ErrorMassage.conflictMessage, code: 409);
      case StatusCode.notFount:
        return ErrorHandler(errorMassage: ErrorMassage.notFoundMessage);
      case StatusCode.internalServerError:
        return ErrorHandler(
            errorMassage: ErrorMassage.internalServerErrorMessage);
      default:
        return ErrorHandler(errorMassage: ErrorMassage.unknownErrorMessage);
    }
  }
}
