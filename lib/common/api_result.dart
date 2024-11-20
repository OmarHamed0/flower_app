sealed class ApiResult<T> {}

class Success<T> extends ApiResult<T> {
  final T? data;
  Success({required this.data});
}

class Failures<T> extends ApiResult<T> {
  final Exception exception;
  Failures({required this.exception});
}
